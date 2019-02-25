module TypeN where

import AbsN
import PrintN (printTree)
import Data.List (union)
import ErrM

type Result = String -- rename String
ok :: Result
ok = ""
bad :: String -> Result
bad = (++"\n")
(/\) :: Result -> Result -> Result
(/\) = (++)

join :: (a -> Result) -> [a] -> Result
join f = foldl (/\) ok . map f -- fold from left using (/\) as function and ok as accumulator
-- map f returns a list of results that we then fold into ok

types :: [Dec] -> Ident -> [Type]
types ds m = [t | Dcl n t <- ds, m==n] -- list comprehension | [t for (Dcl n t) in declarations if ident == n]

ptypes :: [Proc] -> Ident -> [([Type],[Type])]
ptypes ps m = [(strip ins, strip outs) | PDcl n ins outs _ <- ps, m==n] -- [(tin,tout) for (PDcl ...) in pdecs if ident == n]
    where strip = map (\(Dcl _ t)->t)


typecheckN :: Stm -> Err Stm -- wrapper for tn
typecheckN p = if msg == "" then Ok p else Bad ('\n':msg)
    where msg = tn p

tn :: Stm -> Result -- top level
tn s = ts [] [] s

tp :: [Dec] -> [Proc] -> [Proc] -> Result -- procedure declarations (all of them)
-- ds ps is context - in any context [] is a valid procedure
tp _ _ [] = ok
-- check current procedure statements with ins and outs as context for statement
-- check the rest of the procedures with p now valid in the context
tp ds ps (p@(PDcl _ ins outs s) : qs)
    = ts (ins `union` outs `union` ds) ps s /\ tp ds ([p] `union` ps) qs

ts :: [Dec] -> [Proc] -> Stm -> Result -- statement
ts _ _ Skip = ok
ts ds ps (Prnt e) = te ds ps e IntgT
ts ds ps (Assn n e) | tys == [] = bad ("No declaration for variable '"++printTree n++"'")
                    | otherwise = te ds ps e (head tys)
    where tys = types ds n
ts ds ps (Ifte g th el) = te ds ps g BoolT /\ ts ds ps th /\ ts ds ps el
ts ds ps (Iter g s) = te ds ps g BoolT /\ ts ds ps s
ts ds ps (Blck es qs s) = ts (ds `union` es) (ps `union` qs) s
ts ds ps (Call n ains aouts)
    | ptys == [] = bad ("No declaration for procedure '"++printTree n++"'")
    | otherwise  = tai ds n fins ains /\ tao ds n fouts aouts
    where
        ptys = ptypes ps n
        (fins, fouts) = head ptys
ts ds ps (Seqn ss) = join (ts ds ps) ss

te :: [Dec] -> [Proc] -> Exp -> Type -> Result -- expressions
te ds ps (Eql el er)  BoolT = te ds ps el IntgT /\ te ds ps er IntgT
te ds ps (Lsth el er) BoolT = te ds ps el IntgT /\ te ds ps er IntgT
te ds ps (Plus el er) IntgT = te ds ps el IntgT /\ te ds ps er IntgT
te ds ps (Or el er)   BoolT = te ds ps el BoolT /\ te ds ps er BoolT
te ds ps (Mult el er) IntgT = te ds ps el IntgT /\ te ds ps er IntgT
te ds ps (And el er)  BoolT = te ds ps el BoolT /\ te ds ps er BoolT
te ds ps (Negt e)     IntgT = te ds ps e  IntgT
te ds ps (Not e)      BoolT = te ds ps e  BoolT
te _  _  (Intg n)     IntgT = ok
te _  _  (TruV)       BoolT = ok
te _  _  (FlsV)       BoolT = ok
te ds _  (Vrbl m)     t     = tv ds (t, m)
te _  _  e            t     = bad ("Expression '"++printTree e++"' does not have type '"++printTree t++"'")

-- check list of actual input expressions in procedure call
tai :: [Dec] -> Ident -> [Type] -> [Exp] -> Result
tai ds n fs es | length fs /= length es
    = bad ("Incorrect number of input actuals in call of '"++printTree n++"'")
               | otherwise = join (\ (u,e) -> te ds [] e u) (zip fs es)

-- check list of actual output variables in procedure call
tao :: [Dec] -> Ident -> [Type] -> [Ident] -> Result
tao ds n fs is | length fs /= length is
    = bad ("Incorrect number of output actuals in call of '"++printTree n++"'")
               | otherwise = join (tv ds) (zip fs is)

-- check a variable has given type
tv :: [Dec] -> (Type, Ident) -> Result
tv ds (u, i) | typ == []     = bad ("Variable '"++printTree i++"' not declared")
             | u /= head typ = bad ("Variable '"++printTree i++"' has wrong type")
             | otherwise     = ok
    where typ = types ds i

