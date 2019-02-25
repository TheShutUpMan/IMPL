module CompN where

import AbsN
import ParN
import TypeN
import ErrM
import SimplifyN

handleErr :: Err a -> a
handleErr (Ok t)  = t
handleErr (Bad s) = error s

check :: String -> Stm
check = simplifyN . handleErr . typecheckN . handleErr . pStm . myLexer

