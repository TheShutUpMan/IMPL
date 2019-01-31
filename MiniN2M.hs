module MiniN2M where

import AbsN
import AbsM
import Fresh (fresh) -- for generating fresh values
import Data.List (insert, intersect) -- for quick & dirty sets as lists

type Context = [String]
emptyContext :: Context
emptyContext = []

pN2M :: Stm -> M
pN2M s = Obj (main ++ [Com [] Hlt])
  where main = sN2M emptyContext s

sN2M :: Context -> Stm ->           [Cmd]
sN2M    _          Skip           = [] -- NMskip
sN2M    _          (Prnt e)       = c ++ [Com [] (Pnt t)] -- NMprint
  where (c, t) = eN2M e
sN2M    g          (Seqn ss)      = concat mn
  where mn = [sN2M g s | s <- ss] -- NMseq
sN2M    _ (Assn (Ident v) e) = aN2M v e -- pass to helper function
---------------- Commands with conditional branches
sN2M g (Ifte b s t) -- NMif
  = c
    ++ d
    ++ [Com [] (Jmpi end),
        Com [els] Nop]
    ++ e
    ++ [Com [end] Nop]
  where els = fresh ()
        end = fresh ()
        c = bnN2M g b els
        d = sN2M g s
        e = sN2M g t
sN2M g (Iter b s) -- NMLoopB
  = [Com [] (Jmpi tst),
      Com [top] Nop]
     ++ c
     ++ [Com [tst] Nop]
     ++ d
     ++ [Com [end] Nop]
  where top = fresh ()
        tst = fresh ()
        end = fresh ()
        c = sN2M g s
        d = brN2M g b top
------------------- blocks
sN2M g (Blck vs [] s) = concat [push v | v <- vs']
                        ++ c
                        ++ concat [pop v | v <- reverse vs']
  where c = sN2M (vs'++g) s
        vs' = [v | Dcl (Ident v) _ <- vs] `intersect` g
sN2M g (Blck _ _ _) = error "No procedures in N-"
sN2M _ (Call _ _ _) = error "No procedures in N-"

-------------- eN2M 
eN2M :: Exp -> ([Cmd],String)
eN2M (Vrbl (Ident v)) = ([], v) -- ExpVar
eN2M e                = (c, t)  -- ExpNonVar
  where t = fresh()
        c = aN2M t e

brN2M, bnN2M :: Context -> Exp -> String -> [Cmd]
brN2M _ FlsV _ = [] -- NMbrF
brN2M _ TruV l = [Com [] (Jmpi l)] -- NMbrT
brN2M g (Not e) l = c -- BNbrNot
  where c = bnN2M g e l
brN2M _ (Vrbl (Ident v)) l = [Com [] (Beqi end v 0), -- NMbrVar
                              Com [] (Jmpi l),
                              Com [end] Nop]
  where end = fresh ()
brN2M g (Or x y) l = c ++ d -- NMbrOr
  where c = brN2M g x l
        d = brN2M g y l
brN2M g (And x y) l = c ++ d ++ [Com [end] Nop] -- NMbrAnd
  where end = fresh ()
        c = bnN2M g x end
        d = brN2M g y l
brN2M g (Eql x y) l = c ++ d ++ [Com [] (Beq l v w)] -- NMbrEq
  where (c, v) = eN2M x
        (d, w) = eN2M y
brN2M g (Lsth x y) l = c ++ d ++ [Com [] (Blt l v w)] -- NMbrLt
  where (c, v) = eN2M x
        (d, w) = eN2M y


bnN2M _ FlsV l = [Com [] (Jmpi l)] -- NMbnF
bnN2M _ TruV _ = [] -- NMbnT
bnN2M g (Not e) l = c -- NMbnNot
  where c = brN2M g e l
bnN2M g (Vrbl (Ident v)) l = [Com [] (Bnei end v 0), -- NMbnVar
                              Com [] (Jmpi l),
                              Com [end] Nop]
  where end = fresh ()
bnN2M g (Or x y) l = c ++ d ++ [Com [end] Nop] -- NMbnOr
  where end = fresh ()
        c = brN2M g x end
        d = bnN2M g y l
bnN2M g (And x y) l = c ++ d -- NMbnAnd
  where c = bnN2M g x l
        d = bnN2M g x l
bnN2M g (Eql x y) l = c ++ d ++ [Com [] (Bne l v w)]
  where (c, v) = eN2M x
        (d, w) = eN2M y
bnN2M g (Lsth x y) l = c ++ d ++ [Com [] (Bge l v w)] -- NMbrLt
  where (c, v) = eN2M x
        (d, w) = eN2M y

aN2M :: String -> Exp -> [Cmd] -- assign to variable with name `v'
aN2M v = av
  where
    av (Intg n)         = [Com [] (Movi v n)] -- NMassConst
    av (Vrbl (Ident w)) = [Com [] (Mov v w)]
    -------- sophisticated rules
    av (Plus e (Intg n)) = c ++ [Com [] (Addi v t n)]
      where (c, t) = eN2M e
    av (Plus e f)        = c ++ d ++ [Com [] (Add v t u)]
      where (c, t) = eN2M e
            (d, u) = eN2M f
    av (Mult e (Intg n)) = c ++ [Com [] (Muli v t n)]
      where (c, t) = eN2M e
    av (Mult e f)        = c ++ d ++ [Com [] (Mul v t u)]
      where (c, t) = eN2M e
            (d, u) = eN2M f
    av (Negt e)          = c ++ [Com [] (Neg v t)]
      where (c, t) = eN2M e
    ---------- Boolean assignment
    av FlsV              = [Com [] (Movi v 0)]
    av TruV              = [Com [] (Movi v 1)]
    av (Not e)           = [Com [] (Beqi fls t 0),
                            Com [] (Movi v 0),
                            Com [] (Jmpi end),
                            Com [fls] (Movi v 1),
                            Com [end] Nop]
      where (c, t) = eN2M e
            fls = fresh ()
            end = fresh ()
    av (And e f)        = c
                          ++ [Com [] (Beqi fls t 0)]
                          ++ d
                          ++ [Com [] (Beqi fls u 0),
                              Com [] (Movi v 1),
                              Com [] (Jmpi end),
                              Com [fls] (Movi v 0),
                              Com [end] Nop]
      where (c, t) = eN2M e
            (d, u) = eN2M f
            fls = fresh ()
            end = fresh ()
    av (Or e f)         = c
                          ++ [Com [] (Bnei tru t 0)]
                          ++ d
                          ++ [Com [] (Bnei tru u 0),
                              Com [] (Movi v 0),
                              Com [] (Jmpi end),
                              Com [tru] (Movi v 1),
                              Com [end] Nop]
      where (c, t) = eN2M e
            (d, u) = eN2M f
            tru = fresh ()
            end = fresh ()
------------------------------------------------
wir, nwir :: Integer -- words in register
wir = 1 -- for illustration; a typical value is 4
nwir = negate wir
stacktop :: String
stacktop = "stacktop" -- name of register holding stackpointer

push, pop :: String -> [Cmd]
push r = [Com [] (Addi stacktop stacktop nwir), Com [] (Store r stacktop)]
pop r = [Com [] (Load r stacktop), Com [] (Addi stacktop stacktop wir)]
------------------------------------------------

