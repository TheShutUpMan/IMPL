

module AbsIntExpV where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data IntExp
    = Add IntExp IntExp
    | Mul IntExp IntExp
    | Neg IntExp
    | Nmb Integer
    | Var Ident
  deriving (Eq, Ord, Show, Read)

