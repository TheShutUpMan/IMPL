-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParIntExp where
import AbsIntExp
import LexIntExp
import ErrM

}

%name pIntExp IntExp
%name pIntExp1 IntExp1
%name pIntExp2 IntExp2
%name pIntExp3 IntExp3
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  '*' { PT _ (TS _ 3) }
  '+' { PT _ (TS _ 4) }
  'NEG' { PT _ (TS _ 5) }

L_integ  { PT _ (TI $$) }


%%

Integer :: { Integer } : L_integ  { (read ( $1)) :: Integer }

IntExp :: { IntExp }
IntExp : IntExp1 '+' IntExp { AbsIntExp.Add $1 $3 }
       | IntExp1 { $1 }
IntExp1 :: { IntExp }
IntExp1 : IntExp2 '*' IntExp1 { AbsIntExp.Mul $1 $3 }
        | IntExp2 { $1 }
IntExp2 :: { IntExp }
IntExp2 : 'NEG' IntExp2 { AbsIntExp.Neg $2 } | IntExp3 { $1 }
IntExp3 :: { IntExp }
IntExp3 : Integer { AbsIntExp.Nmb $1 } | '(' IntExp ')' { $2 }
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

