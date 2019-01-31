module CompSmall where

import AbsSmall
import ParSmall
import TypeSmall
import ErrM

handleErr :: Err a -> a -- simple handling of error messages
handleErr (Ok t)  = t
handleErr (Bad s) = error s

check :: String -> P
check = handleErr . tx . handleErr . pP . myLexer

-- Examples

s0, s1, s2, s3, s4, s5, s6 :: String
s0 = "(a,b; c,d,e; a => c=d+e)"    -- OK
s1 = "(a,b; c,d,e; c => a)"        -- Bad
s2 = "(a; b,c; (b<c => F) => a)" -- OK
s3 = "(a,b; c,d,e; a => c=d+b)"    -- Bad
s4 = "(a; b,c; (b<c => F) => c)" -- Bad
s5 = "(;;4=>F)"                  -- Bad
s6 = "(a,b; c; a<F => c => 5)"   -- Bad
