

module AbsElement where

-- Haskell module generated by the BNF converter




newtype CIdent = CIdent String deriving (Eq, Ord, Show, Read)
newtype TeX = TeX String deriving (Eq, Ord, Show, Read)
newtype Weird = Weird String deriving (Eq, Ord, Show, Read)
newtype Subscript = Subscript String deriving (Eq, Ord, Show, Read)
data Element = Cid CIdent | Tex TeX | Wrd Weird | Sub Subscript
  deriving (Eq, Ord, Show, Read)

