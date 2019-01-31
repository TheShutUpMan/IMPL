module SkelAB where

-- Haskell module generated by the BNF converter

import AbsAB
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transA :: A -> Result
transA x = case x of
  AAdd a1 a2 -> failure x
  AMul a1 a2 -> failure x
  ANmb integer -> failure x
  ABrk a -> failure x
