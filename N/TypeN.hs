module TypeN where

import AbsN
import Data.List
import ErrM

tx :: P -> Err P
tx p = if msg then Ok else Bad msg
  where msg = tp p

tp :: P -> String
tp ( )
