module D2M where

import AbsN
import AbsM
import Fresh (fresh)

pD2M :: Stm -> M
pD2M (Prnt e) = Obj (main
                     ++[Com [] (Pnt t),
                        Com [] Hlt])
  where (main, t) = eD2M e

eD2M :: Exp -> ([Cmd],String)
eD2M (Vrbl (Ident v)) = ([], v) -- ExpVar
eD2M e                = (c, t)  -- ExpNonVar
  where t = fresh()
        c = aD2M t e

aD2M :: String -> Exp -> [Cmd] -- assign to `v'
aD2M v = av
  where
    av (Intg n)         = [Com [] (Movi v n)] -- NMassConst
    -------- sophisticated rules
    av (Plus e (Intg n)) = c ++ [Com [] (Addi v t n)]
      where (c, t) = eD2M e
    av (Plus e f)        = c ++ d ++ [Com [] (Add v t u)]
      where (c, t) = eD2M e
            (d, u) = eD2M f
    av (Mult e (Intg n)) = c ++ [Com [] (Muli v t n)]
      where (c, t) = eD2M e
    av (Mult e f)        = c ++ d ++ [Com [] (Mul v t u)]
      where (c, t) = eD2M e
            (d, u) = eD2M f
    av (Negt e)          = c ++ [Com [] (Neg v t)]
      where (c, t) = eD2M e
