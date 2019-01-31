module SemN where

import AbsN

-- model store as function 
data Value = IsBool Bool | IsInt Integer
stripBool :: Value -> Bool -- turn a Value into a Bool, if appropriate
stripBool (IsBool b) = b
stripInt :: Value -> Integer -- turn a value into an Integer, if appropriate
stripInt (IsInt n) = n
type Store = Ident -> Value -- Stores are functions
override :: Store -> (Ident, Value) -> Store -- s[i <-- v]
override s (i, v) j | i == j    = v
                    | otherwise = s j
movr :: Store -> [Ident] -> [Exp] -> Store -- multiple override
movr s js es = foldl override s (zip js (map (evalN s) es))
empty :: Store -- initial empty store
empty (Ident v) = error ("No such identifier:" ++ v)
----------------

-- extract procedure from list of declarations
findproc :: Ident -> [Proc] -> Proc
findproc p ps = head [q | q@(PDcl j _ _ _)<-ps, j==p]

-- evaluate an expression in the context of a store
evalN :: Store -> Exp -> Value -- evalN t e is t[[e]]
evalN t = et
  where
    et (Eql a b)  = bii (==)   a b
    et (Lsth a b) = bii (<)    a b
    et (Plus a b) = iii (+)    a b
    et (Or a b)   = bbb (||)   a b
    et (Mult a b) = error "TBD"
    et (And a b)  = error "TBD"
    et (Negt a)   = ii  negate a
    et (Not a)    = error "TBD"
    et (Intg n)   = error "TBD"
    et TruV       = IsBool True
    et FlsV       = IsBool False
    et (Vrbl v)   = t v
    -- helper functions
    siet          = stripInt . et
    sbet          = stripBool . et
    bbb op a b    = IsBool (op (sbet a) (sbet b))
    bii op a b    = IsBool (op (siet a) (siet b))
    iii op a b    = IsInt  (op (siet a) (siet b))
    ii  op a      = IsInt  (op (siet a))
    bb  op a      = IsBool (op (sbet a))

---------------- semantic rule for programs \"/\"/
semN :: Stm -> [Integer]
semN s = outs -- NprogD
  where (_, outs) = bigstepN [] [] s empty

---------------- semantic rules for statements \"/
bigstepN :: [Dec] -> [Proc] -> Stm -> Store -> (Store, [Integer])
bigstepN ds ps = bdp -- ds ps |- bdp
  where
    -- style follows rules closely
    -- bdp s t = (u, o) is (s,t)\"/(u,o)
    -- where clause contains antecedents
    -- guards contain side conditions in reverse
    bdp Skip       t   = error "TBD"                                -- NskipD
    bdp (Prnt e)   t   = (t, [stripInt (evalN t e)])                -- NprintD
    bdp (Assn v e) t   = error "TBD"                                -- NassD
    bdp (Ifte g s r) t | stripBool (evalN t g) = (tu, to)           -- NifTD
                       | otherwise             = (fu, fo)           -- NifFD
      where (tu, to)       = error "TBD"
            (fu, fo)       = error "TBD"
    bdp (Iter g s) t   | stripBool (evalN t g) = (t'', out'++out'') -- NdoTD
                       | otherwise             = (t, [])            -- NdoFD
      where (t',  out')    = bdp s t
            (t'', out'')   = bdp (Iter g s) t'
    bdp (Blck (Block es qs s)) t = (u, out)                         -- NblockD
      where (u, out) = bigstepN (es++ds) (qs++ps) s t
    bdp (Call p es ws) t = (u', outs)                               -- NcallD
      where (PDcl _ vs qs s) = findproc p ps
            (u, outs) = error "TBD"
            t' = movr t [v | (Dcl v _)<-vs] es -- set inputs
            u' = movr u ws [Vrbl q | (Dcl q _)<-qs] -- set outputs
    bdp (Seqn [])     t = (t, [])                                   -- NseqD
    bdp (Seqn (s:ss)) t = (t'', outs'++outs'')                      -- NseqD
      where (t', outs')   = bdp s t
            (t'', outs'') = error "TBD"
-- Note: the NseqD rule allows us to split a sequence of statements
-- anywhere.  This implementation always splits after the first atomic
-- statement
