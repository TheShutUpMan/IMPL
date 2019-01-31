module SkelSmall where

-- Haskell module generated by the BNF converter

import AbsSmall
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transIdent :: Ident -> Result
transIdent x = case x of
  Ident string -> failure x
transP :: P -> Result
transP x = case x of
  Top idents1 idents2 e -> failure x
transE :: E -> Result
transE x = case x of
  Implies e1 e2 -> failure x
  Rel e1 r e2 -> failure x
  Plus e1 e2 -> failure x
  Nmb integer -> failure x
  Var ident -> failure x
  Fls -> failure x
transR :: R -> Result
transR x = case x of
  Eql -> failure x
  Lth -> failure x

