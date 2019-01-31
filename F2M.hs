module F2M where

import AbsN
import AbsM
import Fresh (fresh)

pF2M :: Stm -> M
pF2M s = Obj (main++[Com [] Hlt])
  where main = sF2M s

sF2M :: Stm -> [Cmd]
sF2M (Assn (Ident v) e) = aF2M v e
sF2M (Prnt e) = c ++ [Com [] (Pnt t)]
  where t = fresh ()
        c = aF2M t e
sF2M (Seqn ss) = concat mn
  where mn = [sF2M s | s <- ss]
sF2M (Blck _ _ s) = sF2M s -- does not need declaration information

eF2M :: Exp -> ([Cmd],String)
eF2M (Vrbl (Ident v)) = ([], v) -- ExpVar
eF2M e                = (c, t)  -- ExpNonVar
  where t = fresh()
        c = aF2M t e

aF2M :: String -> Exp -> [Cmd]
aF2M v = av
  where
    av (Intg n)         = [Com [] (Movi v n)] -- NMassConst
    av (Vrbl (Ident w)) = [Com [] (Mov v w)]
    -------- sophisticated rules
    av (Plus e (Intg n)) = c ++ [Com [] (Addi v t n)]
      where (c, t) = eF2M e
    av (Plus e f)        = c ++ d ++ [Com [] (Add v t u)]
      where (c, t) = eF2M e
            (d, u) = eF2M f
    av (Mult e (Intg n)) = c ++ [Com [] (Muli v t n)]
      where (c, t) = eF2M e
    av (Mult e f)        = c ++ d ++ [Com [] (Mul v t u)]
      where (c, t) = eF2M e
            (d, u) = eF2M f
    av (Negt e)          = c ++ [Com [] (Neg v t)]
      where (c, t) = eF2M e
