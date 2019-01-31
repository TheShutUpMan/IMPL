module SimplifyN where

import AbsN

simplifyN :: Blk -> Blk
simplifyN  = smpS

smpPs :: [Proc] -> [Proc]
smpPs = map smpP

smpP :: Proc -> Proc
smpP (PDcl n ins outs s) = PDcl n ins outs (smpS s)

smpS :: Stm -> Stm
smpS Skip                = error "TBD"
smpS (Prnt e)            = Prnt (smpE e)
smpS s@(Assn v (Vrbl w)) = if v==w then Skip else s
smpS (Assn v e)          = error "TBD"
smpS (Ifte TruV th _)    = error "TBD"
smpS (Ifte FlsV _ el)    = smpS el
smpS (Ifte g th el)      = Ifte (error "TBD") (error "TBD") (error "TBD")
smpS (Iter FlsV _)       = error "TBD"
smpS (Iter g bd)         = Iter (smpE g) (smpS bd)
smpS (Blck ds ps s)      = error "TBD"
smpS (Call n ins outs)   = Call n (map smpE ins) outs
smpS (Seqn ss)           = Seqn (map smpS ss)

smpE :: Exp -> Exp
-- relations
smpE (Eql a b)                = if a==b then TruV else Eql (smpE a) (smpE b)
smpE (Lsth a b)               = Lsth (smpE a) (smpE b)
-- +
smpE (Plus a (Intg 0))        = error "TBD"
smpE (Plus (Intg 0) b)        = error "TBD"
smpE (Plus (Intg m) (Intg n)) = error "TBD"
smpE (Plus a b)               = error "TBD"
-- or
smpE (Or TruV _)              = TruV
smpE (Or _ TruV)              = TruV
smpE (Or FlsV b)              = smpE b
smpE (Or a FlsV)              = smpE a
smpE (Or a b)                 = Or (smpE a) (smpE b)
-- *
smpE (Mul _ (Intg 0))         = error "TBD"
smpE (Mul (Intg 0) _)         = error "TBD"
smpE (Mul a (Intg 1))         = error "TBD"
smpE (Mul (Intg 1) b)         = error "TBD"
smpE (Mul (Intg m) (Intg n))  = error "TBD"
smpE (Mul a b)                = error "TBD"
-- and
smpE (And FlsV _)             = error "TBD"
smpE (And _ FlsV)             = error "TBD"
smpE (And TruV b)             = error "TBD"
smpE (And a TruV)             = error "TBD"
smpE (And a b)                = error "TBD"
-- neg
smpE (Negt (Negt a))          = error "TBD"
smpE (Negt (Intg n))          = Intg (negate n) -- haskell unary negation
smpE (Negt a)                 = error "TBD"
-- not
smpE (Not (Not a))            = error "TBD"
smpE (Not TruV)               = error "TBD"
smpE (Not FlsV)               = error "TBD"
smpE (Not a)                  = error "TBD"
-- anything not matching above
smpE a                        = a -- no change
