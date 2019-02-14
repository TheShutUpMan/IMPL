{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for PrintN.
--   Generated by the BNF converter.

module PrintN where

import AbsN
import Data.Char

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : ts@(p:_) | closingOrPunctuation p -> showString t . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else ' ':s)

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Ident where
  prt _ (Ident i) = doc (showString i)
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print Stm where
  prt i e = case e of
    Skip -> prPrec i 0 (concatD [doc (showString "skip")])
    Prnt exp -> prPrec i 0 (concatD [doc (showString "print"), prt 0 exp])
    Assn id exp -> prPrec i 0 (concatD [prt 0 id, doc (showString ":="), prt 0 exp])
    Ifte exp stm1 stm2 -> prPrec i 0 (concatD [doc (showString "if"), prt 0 exp, doc (showString "then"), prt 0 stm1, doc (showString "else"), prt 0 stm2, doc (showString "end")])
    Iter exp stm -> prPrec i 0 (concatD [doc (showString "while"), prt 0 exp, doc (showString "do"), prt 0 stm, doc (showString "end")])
    Blck decs procs stm -> prPrec i 0 (concatD [doc (showString "{"), prt 0 decs, doc (showString "|"), prt 0 procs, doc (showString "|"), prt 0 stm, doc (showString "}")])
    Call id exps ids -> prPrec i 0 (concatD [prt 0 id, doc (showString "{"), prt 0 exps, doc (showString "|"), prt 0 ids, doc (showString "}")])
    Seqn stms -> prPrec i 0 (concatD [prt 0 stms])
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Stm] where
  prt = prtList

instance Print Dec where
  prt i e = case e of
    Dcl id type_ -> prPrec i 0 (concatD [prt 0 id, doc (showString ":"), prt 0 type_])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Dec] where
  prt = prtList

instance Print Type where
  prt i e = case e of
    IntgT -> prPrec i 0 (concatD [doc (showString "Int")])
    BoolT -> prPrec i 0 (concatD [doc (showString "Bool")])

instance Print Proc where
  prt i e = case e of
    PDcl id decs1 decs2 stm -> prPrec i 0 (concatD [prt 0 id, doc (showString ":"), doc (showString "{"), prt 0 decs1, doc (showString "|"), prt 0 decs2, doc (showString "|"), prt 0 stm, doc (showString "}")])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Proc] where
  prt = prtList

instance Print [Ident] where
  prt = prtList

instance Print Exp where
  prt i e = case e of
    Eql exp1 exp2 -> prPrec i 0 (concatD [prt 0 exp1, doc (showString "="), prt 0 exp2])
    Lsth exp1 exp2 -> prPrec i 0 (concatD [prt 0 exp1, doc (showString "<"), prt 0 exp2])
    Plus exp1 exp2 -> prPrec i 1 (concatD [prt 2 exp1, doc (showString "+"), prt 1 exp2])
    Or exp1 exp2 -> prPrec i 1 (concatD [prt 2 exp1, doc (showString "or"), prt 1 exp2])
    Mult exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "*"), prt 2 exp2])
    And exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "and"), prt 2 exp2])
    Negt exp -> prPrec i 3 (concatD [doc (showString "neg"), prt 3 exp])
    Not exp -> prPrec i 3 (concatD [doc (showString "not"), prt 3 exp])
    Intg n -> prPrec i 4 (concatD [prt 0 n])
    TruV -> prPrec i 4 (concatD [doc (showString "true")])
    FlsV -> prPrec i 4 (concatD [doc (showString "false")])
    Vrbl id -> prPrec i 4 (concatD [prt 0 id])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [Exp] where
  prt = prtList

