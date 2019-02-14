module SimplifyN where
import AbsN

simplifyN :: Stm -> Stm
simplifyN  = smpS

smpPs :: [Proc] -> [Proc]
smpPs = map smpP

smpP :: Proc -> Proc
smpP (PDcl n ins outs s) = PDcl n ins outs (smpS s)

smpS :: Stm -> Stm
smpS Skip                = Skip
smpS (Prnt e)            = Prnt (smpE e)
smpS s@(Assn v (Vrbl w)) = if v==w then Skip else s
smpS (Assn v e)          = Assn v (smpE e)
smpS (Ifte TruV th _)    = smpS th
smpS (Ifte FlsV _ el)    = smpS el
smpS (Ifte g th el)      = Ifte (smpE g) (smpS th) (smpS el)
smpS (Iter FlsV _)       = Skip
smpS (Iter g bd)         = Iter (smpE g) (smpS bd)
smpS (Blck ds ps s)      = Blck ds (smpPs ps) (smpS s)
smpS (Call n ins outs)   = Call n (map smpE ins) outs
smpS (Seqn ss)           = Seqn (map smpS ss)

smpE :: Exp -> Exp
-- relations
smpE (Eql a b)                = if a==b then TruV else Eql (smpE a) (smpE b)
smpE (Lsth a b)               = Lsth (smpE a) (smpE b)
-- +
smpE (Plus a (Intg 0))        = smpE a
smpE (Plus (Intg 0) b)        = smpE b
smpE (Plus (Intg m) (Intg n)) = Intg (m+n)
smpE (Plus a b)               = Plus (smpE a) (smpE b)
-- or
smpE (Or TruV _)              = TruV
smpE (Or _ TruV)              = TruV
smpE (Or FlsV b)              = smpE b
smpE (Or a FlsV)              = smpE a
smpE (Or a b)                 = Or (smpE a) (smpE b)
-- *
smpE (Mult _ (Intg 0))         = Intg 0
smpE (Mult (Intg 0) _)         = Intg 0
smpE (Mult a (Intg 1))         = smpE a
smpE (Mult (Intg 1) b)         = smpE b
smpE (Mult (Intg m) (Intg n))  = Intg (m * n)
smpE (Mult a b)                = Mult (smpE a) (smpE b)
-- and
smpE (And FlsV _)             = FlsV
smpE (And _ FlsV)             = FlsV
smpE (And TruV b)             = smpE b
smpE (And a TruV)             = smpE a
smpE (And a b)                = And (smpE a) (smpE b)
-- neg
smpE (Negt (Negt a))          = smpE a
smpE (Negt (Intg n))          = Intg (negate n) -- haskell unary negation
smpE (Negt a)                 = Negt (smpE a)
-- not
smpE (Not (Not a))            = smpE a
smpE (Not TruV)               = FlsV
smpE (Not FlsV)               = TruV
smpE (Not a)                  = Not (smpE a)
-- anything not matching above
smpE a                        = a -- no change
