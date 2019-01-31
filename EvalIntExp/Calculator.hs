module Calculator where

import ParIntExpV
import EvalIntExpV
import ErrM

handleErr :: Err a -> a -- simple handling of error messages
handleErr (Ok t) = t
handleErr (Bad s) = error s

calc :: String -> Integer --variable-free expressions
calc = eval . handleErr. pIntExp . myLexer
