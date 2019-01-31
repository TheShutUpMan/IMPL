module SkelSl where

-- Haskell module generated by the BNF converter

import AbsSl
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transBIdent :: BIdent -> Result
transBIdent x = case x of
  BIdent string -> failure x
transIIdent :: IIdent -> Result
transIIdent x = case x of
  IIdent string -> failure x
transProg :: Prog -> Result
transProg x = case x of
  Pgm stms -> failure x
transStm :: Stm -> Result
transStm x = case x of
  Assb bident bval -> failure x
  Assi iident ival -> failure x
  Putb bval -> failure x
  Puti ival -> failure x
transBVal :: BVal -> Result
transBVal x = case x of
  BValBIdent bident -> failure x
  BVal_TRUE -> failure x
  BVal_FALSE -> failure x
transIVal :: IVal -> Result
transIVal x = case x of
  IValIIdent iident -> failure x
  IValInteger integer -> failure x
