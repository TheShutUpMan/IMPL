module TypeSmall where

import AbsSmall -- Abstract syntax of small expressions
import Data.List -- usueful functions on lists, including union, intersect
import ErrM

data TypeName = B | I
data Context = Context [Ident] [Ident] -- list of B, list of I

-- type check & collect errors, if any
tx :: P -> Err P
tx p = if msg == "" then Ok p else Bad msg
  where msg = tp p

-- deal with top-level expressions
tp :: P -> String
tp (Top bs ns e) = (if bs `intersect` ns == [] then "" else "Doubly declared variables") -- side condition
                   ++ te (Context bs ns) e B -- antecedent

-- deal with proper expressions
-- te c e t = does e have type t in context c? 
-- note use of underscore in patterns where value is not needed on RHS
te :: Context  -> E -> TypeName-> String
te c              (Implies e f) B = te c e B ++ te c f B
te c              (Rel e _ f)   B = te c e I ++ te c f I
te c              (Plus e f)    I = te c e I ++ te c f I
te _              Fls           B = ""
te _              Fls           I = "False used as integer\n"
te _              (Nmb _)       I = "" -- axiom (side condition dealt with by the parser) te (Context bs _) (Var v)       B = v `elem` bs -- only side condition
te _              (Nmb _)       B = "Integer used as boolean\n" -- axiom (side condition dealt with by the parser) 
te (Context _ ns) (Var v@(Ident n))    I
   | v `elem` ns = "" -- only side condition
   | otherwise = "non-integer variable "++show n++" used as integer\n"
   
te (Context bs _) (Var v@(Ident n))    B
   | v `elem` bs = ""
   | otherwise = "non-boolean variable "++show n++" used as boolean\n"

te _ _ _ = "Invalid expression\n"
-- No rules about brackets because the parser eliminates them

