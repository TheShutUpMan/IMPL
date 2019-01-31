-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParN where
import AbsN
import LexN
import ErrM

}

%name pV V
%name pT T
%name pP P
%name pListP ListP
%name pListV ListV
%name pD D
%name pS S
%name pListIdent ListIdent
%name pListE ListE
%name pListS ListS
%name pE E
%name pE1 E1
%name pE2 E2
%name pE3 E3
%name pE4 E4
%name pE5 E5
%name pE6 E6
%name pE7 E7
%name pE8 E8
%name pE9 E9
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  '*' { PT _ (TS _ 3) }
  '+' { PT _ (TS _ 4) }
  ',' { PT _ (TS _ 5) }
  ':' { PT _ (TS _ 6) }
  ':=' { PT _ (TS _ 7) }
  ';' { PT _ (TS _ 8) }
  '<' { PT _ (TS _ 9) }
  '=' { PT _ (TS _ 10) }
  'Bool' { PT _ (TS _ 11) }
  'Int' { PT _ (TS _ 12) }
  'and' { PT _ (TS _ 13) }
  'do' { PT _ (TS _ 14) }
  'else' { PT _ (TS _ 15) }
  'end' { PT _ (TS _ 16) }
  'false' { PT _ (TS _ 17) }
  'if' { PT _ (TS _ 18) }
  'neg' { PT _ (TS _ 19) }
  'not' { PT _ (TS _ 20) }
  'or' { PT _ (TS _ 21) }
  'print' { PT _ (TS _ 22) }
  'skip' { PT _ (TS _ 23) }
  'then' { PT _ (TS _ 24) }
  'true' { PT _ (TS _ 25) }
  'while' { PT _ (TS _ 26) }
  '{' { PT _ (TS _ 27) }
  '|' { PT _ (TS _ 28) }
  '}' { PT _ (TS _ 29) }

L_ident  { PT _ (TV $$) }
L_integ  { PT _ (TI $$) }


%%

Ident   :: { Ident }   : L_ident  { Ident $1 }
Integer :: { Integer } : L_integ  { (read ( $1)) :: Integer }

V :: { V }
V : Ident ':' T { AbsN.Var $1 $3 }
T :: { T }
T : 'Int' { AbsN.Int } | 'Bool' { AbsN.Bool }
P :: { P }
P : Ident ':' '{' ListV '|' ListV '|' S '}' { AbsN.Proc $1 $4 $6 $8 }
ListP :: { [P] }
ListP : {- empty -} { [] }
      | P { (:[]) $1 }
      | P ';' ListP { (:) $1 $3 }
ListV :: { [V] }
ListV : {- empty -} { [] }
      | V { (:[]) $1 }
      | V ',' ListV { (:) $1 $3 }
D :: { D }
D : V { AbsN.Dvar $1 } | P { AbsN.Dpr $1 }
S :: { S }
S : 'skip' { AbsN.Skp }
  | 'print' E { AbsN.Prn $2 }
  | Ident ':=' E { AbsN.Ass $1 $3 }
  | 'if' E 'then' S 'else' S 'end' { AbsN.Cho $2 $4 $6 }
  | 'while' E 'do' S 'end' { AbsN.Itr $2 $4 }
  | '{' D ';' S '}' { AbsN.Dcl $2 $4 }
  | Ident '{' ListE '|' ListIdent '}' { AbsN.Call $1 $3 $5 }
  | ListS { AbsN.Seq $1 }
ListIdent :: { [Ident] }
ListIdent : {- empty -} { [] }
          | Ident { (:[]) $1 }
          | Ident ',' ListIdent { (:) $1 $3 }
ListE :: { [E] }
ListE : {- empty -} { [] }
      | E { (:[]) $1 }
      | E ',' ListE { (:) $1 $3 }
ListS :: { [S] }
ListS : S { (:[]) $1 } | S ';' ListS { (:) $1 $3 }
E :: { E }
E : E1 '<' E { AbsN.Lt $1 $3 } | E1 { $1 }
E1 :: { E }
E1 : E2 '=' E1 { AbsN.Eq $1 $3 } | E2 { $1 }
E2 :: { E }
E2 : E3 'and' E2 { AbsN.And $1 $3 } | E3 { $1 }
E3 :: { E }
E3 : E4 'or' E3 { AbsN.Or $1 $3 } | E4 { $1 }
E4 :: { E }
E4 : 'not' E4 { AbsN.Not $2 } | E5 { $1 }
E5 :: { E }
E5 : 'false' { AbsN.Fls } | 'true' { AbsN.Tr } | E6 { $1 }
E6 :: { E }
E6 : E7 '+' E6 { AbsN.Sum $1 $3 } | E7 { $1 }
E7 :: { E }
E7 : E8 '*' E7 { AbsN.Mul $1 $3 } | E8 { $1 }
E8 :: { E }
E8 : 'neg' E8 { AbsN.Neg $2 } | E9 { $1 }
E9 :: { E }
E9 : Integer { AbsN.Iex $1 }
   | Ident { AbsN.Idex $1 }
   | '(' E ')' { $2 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    t:_ -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
}

