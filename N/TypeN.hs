module TypeN where
import AbsN
import PrintN (printTree)
import Data.List (union)
import ErrM

-- Result as a String
type Result = String -- rename String, for documentation

ok :: Result -- empty string
ok = ""
bad :: String -> Result -- add newline to end of string
bad = (++"\n")
(/\) :: Result -> Result -> Result -- conjunction of judgements
(/\) = (++)
join :: (a -> Result) -> [a] -> Result
join f = foldl (/\) ok . map f
------------------------------------------

types :: [Dec] -> Ident -> [Type]
types ds m = [t | Dcl n t <- ds, m==n]

ptypes :: [Proc] -> Ident -> [([Type],[Type])]
ptypes ps m = [(strip ins, strip outs) | PDcl n ins outs _ <- ps, m==n]
  where strip = map (\(Dcl _ t)->t)
------------------------------------------

{-

Strategy for building contexts:

1: new declarations (variable or procedure) are placed at the front of
the list of declarations, masking any later occurences.

2: when searching for a matching declaration always take the first.

-}

typecheckN :: Stm -> Err Stm
typecheckN b | msg == ok = Ok b
             | otherwise = Bad ('\n':msg)
  where msg = tn b

-- check top level programs
tn :: Stm -> Result
tn = ts [] []

-- check procedure declarations; not how declaration-before-use is enforced
tp :: [Dec] -> [Proc] -> [Proc] -> Result
tp _  _  []                       = ok
tp ds ps (p@(PDcl _ ins outs s) : qs)
  = ts (ins `union` outs `union` ds) ps s /\ tp ds ([p] `union` ps) qs

-- check statements
ts :: [Dec] -> [Proc] -> Stm -> Result
ts _  _  Skip = ok
ts ds ps (Prnt e) = te ds ps e IntgT
ts ds ps (Assn n e) | tys == [] = bad ("No declaration for variable '"++printTree n++"'")
                    | otherwise = te ds ps e (head tys)
  where tys = types ds n
ts ds ps (Ifte g th el) = te ds ps g BoolT /\ ts ds ps th /\ ts ds ps el
ts ds ps (Iter g bd) = te ds ps g BoolT /\ ts ds ps bd
ts ds ps (Blck es qs s) = ts (es `union` ds) (qs `union` ps) s
ts ds ps (Call n ains aouts)
  | ptys == [] = bad ("No declaration for procedure '"++printTree n++"'")
  | otherwise  = tai ds n fins ains /\ tao ds n fouts aouts
  where
    ptys = ptypes ps n
    (fins, fouts) = head ptys
ts ds ps (Seqn ss) = join (ts ds ps) ss

-- check expressions
te :: [Dec] -> [Proc] -> Exp -> Type -> Result
te ds ps (Eql e f)  BoolT = te ds ps e IntgT /\ te ds ps f IntgT
te ds ps (Lsth e f) BoolT = te ds ps e IntgT /\ te ds ps f IntgT
te ds ps (Plus e f) IntgT = te ds ps e IntgT /\ te ds ps f IntgT
te ds ps (Or e f)   BoolT = te ds ps e BoolT /\ te ds ps f BoolT
te ds ps (Mult e f) IntgT = te ds ps e IntgT /\ te ds ps f IntgT
te ds ps (And e f)  BoolT = te ds ps e BoolT /\ te ds ps f BoolT
te ds ps (Negt e)   IntgT = te ds ps e IntgT
te ds ps (Not e)    BoolT = te ds ps e BoolT
te _  _  (Intg n)   IntgT = ok
te _  _  TruV       BoolT = ok
te _  _  FlsV       BoolT = ok
te ds _  (Vrbl m)   t     = tv ds (t, m)
te _  _  e           t    = bad ("Expression '"++printTree e++"' does not have type '"++printTree t++"'")

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

-- check a variable name has given type
tv :: [Dec] -> (Type, Ident) -> Result
tv ds (u, i) | typ == []     = bad ("Varable '"++printTree i++"' not declared")
             | u /= head typ = bad ("Varable '"++printTree i++"' has wrong type")
             | otherwise     = ok
  where typ = types ds i
