module OptimiseM (cfg, propagateM, dead2NopM, liveOut, use, def) where
-- liveOut, use and def are needed to calculate Live In sets for register allocation

import AbsM
import TablesM -- Various values for M instructions
import CFG
import FixedPoint
import Data.List -- to treat lists as sets [a better engineered solution should use a better set implementation]

-- analysis algorithm
analyseM :: Eq a
            => (Int -> Int -> Bool) -- (<) or (>)
            -> (CFG -> CFG) -- opposite or id
            -> ([Cmd] -> Int -> [a]) -- elements to add (gen or use)
            -> ([Cmd] -> Int -> [a]) -- elements to delete (kill or def)
            -> [Cmd] -- statements to analyse
            -> [[a]] -- result
analyseM ord grapht pos neg cs = fixp improve start
  where
    (size, adjlist) = grapht (cfg cs)
    improve old = new
      where new = [uNION (\n->step (if n `ord` l then new else old) n) (adjlist l)
                  | l<-[0..size-1]]
    step f n = sort (pos cs n `union` (f !! n \\ neg cs n))
    start = replicate size []

-------------------------------------------------------------

-- Reach-in

gen, kill :: [Cmd] -> Int -> [Int] -- gen/kill set of line n of statements cs
gen cs n = error "TBD"
kill cs n = error "TBD"

reachIn :: [Cmd] -> [[Int]]
reachIn = analyseM (<) opposite gen kill

assignsIn :: [Cmd] -> [[Int]] -- matching assignments that reach in
assignsIn cs = [rel n | n<-[0..length cs-1]]
  where
    rel n = [k | k <- reachIn cs !! n,
                 aim k /= [],
                 aim k == replaceable (instr cs n)]
    aim k = assigned (instr cs k)

propagateM :: M -> M -- version of code with indirects replaced by immediates
propagateM (Obj cs) = Obj [update cl | cl <- zip cs (assignsIn cs)]
  where
    update (Com l i, [k]) | (Movi _ d) <- instr cs k = Com l (replace i d) -- exactly one Movi reaching in
    update (c      , _  )                            = c

-------------------------------------------------------------------------
    
-- Live-out

use, def :: [Cmd] -> Int -> [String] -- use/def set of line n of statements cs
use cs n = error "TBD"
def cs n = error "TBD"

liveOut :: [Cmd] -> [[String]]
liveOut = analyseM (>) id use def

registersOut :: [Cmd] -> [Bool] -- True iff assigned register is live out
registersOut cs = [reg n | n<-[0..length cs-1]]
  where reg n | (Movi x _)<-instr cs n = x `notElem` liveOut cs !! n
              | otherwise              = False

dead2NopM :: M -> M -- replace dead instruction by Nop
dead2NopM (Obj cs) = Obj [update cl | cl <- zip cs (registersOut cs)]
  where
    update (Com ls (Movi _ _), True) = Com ls Nop
    update (c                , _   ) = c
