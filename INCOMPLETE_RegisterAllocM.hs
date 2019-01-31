module RegisterAllocM where

import AbsM -- Abstract syntax of M
import TablesM(assigned, accessed, repreg) -- useful functions on M
import OptimiseM(liveOut, use, def) -- to calculate live-in sets
import Data.List(union, (\\), sort) -- treat lists as sets; sort lists

-- Live in sets, calculated from Live Out sets.
-- Formula from slides.
liveIn :: [Cmd] -> [[String]]
liveIn cs = error "TBD"

-- registers present in code.
-- Take care that a used register is recorded exactly once.
registers :: [Cmd] -> [String]
registers cs = error "TBD"

-- two registers interfere if they both occur in any live-in set
interfere :: [Cmd] -> String -> String -> Bool
interfere cs m n = or [error "TBD" | li<-liveIn cs]

type IntG = [(String,[String])] -- adjacency list representation

-- sort graph, fewest neighbours first, alphabetical within same neighbours.
sortIG :: IntG -> IntG
sortIG ig = [(t, al) | (_, t, al)<-sort [(length al, t, al) | (t, al) <- ig]]

-- compute interference graph
interferenceG :: [Cmd] -> IntG
interferenceG cs = sortIG [(t, [u | u<-rs, u/=t, interfere cs t u] ) | t<-rs]
  where
    rs = registers cs

-- pseudo-colour, with n colours, nodes in graph g
-- using Chaitin's algorithm
-- `Colours' have form "Rk", for `k' a Natural number.
-- `No colour' is unadorned register name.
chaitin :: Int -> IntG -> String -> String
chaitin n g = alloc g
  where -- note mutual recursion between alloc & ar
    -- alloc g s : return 'colour' allocated to register s in graph g
    alloc []           _             = error "Attempt to allocate registers to an empty graph"
    alloc ((t, a):tas) s
      -- if register is next to be considered pick a colour having allocated colours in sub-graph
      | s==t      = pick (allRegs\\[alsg t tas r | r<-a]) t
      -- else allocate according to sub-graph
      | otherwise = alsg t tas s
    -- allocate in subgraph made by removing t from tas
    alsg t tas = alloc (sortIG [(u, b\\[t]) | (u, b) <- tas])
    -- names of physical registers to be allocated
    allRegs = ['R':show k | k<-[0..n-1]]
    -- pick a `colour' for t
    pick [] t = error "TBD" -- no colour allocatable, so use register name to indicate `no colour'
    pick rs _ = error "TBD" -- some colour allocatable, so use `smallest' colour in rs

-- physical registers (`colours') start with 'R'; anything else is for spilling
isSpilt :: String -> Bool
isSpilt r = error "TBD" -- True if spilt, False otherwise

-- Given a colouring (rm) and a memory map for spilt registers (mm)
-- replace instructions by a sequence of instruction that use registers R0, R1...
-- and temporary registers T0, T1 & T2.
spill :: (String -> String) -> (String -> Integer) -> Cmd -> [Cmd]
spill rm mm (Com ls instr) = Com ls (head ins) : map (Com []) (tail ins)
  where ins = ([Loadi tr (mm r) | (r, tr) <- zip (sv accessed) ["T1", "T2"]])
              ++ [repreg isSpilt rm instr]
              ++ [Storei "T0" (mm r) | r <- sv assigned]
        sv f = [r | r <- [rm s | s <- f instr], isSpilt r]

-- Build a memory map for registers `xs', that starts at `start'
memoryMap :: Integer -> [String] -> String -> Integer
memoryMap start xs x = error "TBD"

-- main function, that applies spill to each instruction.
allocateReg :: Int -> Integer -> M -> M
allocateReg n start (Obj cs)
  = Obj (concat [spill rm mm c | c <- cs])
    where
      rm = chaitin n (interferenceG cs)
      mm = memoryMap start [r | r <- registers cs, isSpilt (rm r)]
