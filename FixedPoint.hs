module FixedPoint(fixp, convergentSeq) where

-- these definitions use laziness; `seq' is an infinite list

-- generate just the solution
fixp :: Eq a => (a->a) -> a -> a
fixp f z = head [ a | (a, b) <- zip seq (tail seq), a==b]
  where seq = iterate f z

-- generate the table of approximations

convergentSeq :: Eq a => (a->a) -> a -> [a]
convergentSeq f z = head seq : map snd (takeWhile neq [ab | ab <- zip seq (tail seq)])
  where seq = iterate f z
        neq (a, b) = a /= b
