module SkelSl where

-- Haskell module generated by the BNF converter

import AbsSl
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transIdent :: Ident -> Result
transIdent x = case x of
  Ident string -> failure x
transStatement :: Statement -> Result
transStatement x = case x of
  Statement1 ident intexp -> failure x
  Statement2 ident -> failure x
  Statement3 statement1 statement2 -> failure x
transIntExp :: IntExp -> Result
transIntExp x = case x of
  Add intexp1 intexp2 -> failure x
  Mul intexp1 intexp2 -> failure x
  Neg intexp -> failure x
  Nmb integer -> failure x
  Var ident -> failure x

