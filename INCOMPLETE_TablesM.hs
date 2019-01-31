module TablesM where

import AbsM
import CFG -- Control Flow Graph model
import Data.List (nub) -- to shrink lists to single occurence of an element

instr :: [Cmd] -> Int -> Instr -- instruction on line n
instr cs n = i
  where (Com _ i) = cs !! n

cfg :: [Cmd] -> CFG -- construct control flow graph from M
cfg cs = (length cs, adjlist)
  where
    adjlist n -- adjlist at line n
      = case instr cs n of
        Hlt        -> [] -- no outgoing arcs
        Jmp  _     -> undefined -- as the register can hold any value
        Jmpi l     -> [target l]  -- line containing label l
        Beq  l _ _ -> brOrFth l
        Beqi l _ _ -> brOrFth l
        Bne  l _ _ -> brOrFth l
        Bnei l _ _ -> brOrFth l
        Blt  l _ _ -> brOrFth l
        Blti l _ _ -> brOrFth l
        Bge  l _ _ -> brOrFth l
        Bgei l _ _ -> brOrFth l
        _          -> fallthrough -- all other instructions
      where
        target l -- calculate address of first line labelled l
          = head [k | k<-[0..length cs-1], Com ll _<-[cs!!k], l `elem` ll]
        fallthrough = [n+1] -- next line
        brOrFth l = target l : fallthrough -- branch to l or fall through

-- list of assigned variables (one or none) in an instruction
assigned :: Instr -> [String]
assigned (Mov r _)    = [r]
assigned (Movi r _)   = error "TBD"
assigned (Add r _ _)  = error "TBD"
assigned (Addi r _ _) = error "TBD"
assigned (Mul r _ _)  = error "TBD"
assigned (Muli r _ _) = error "TBD"
assigned (Neg r _)    = error "TBD"
assigned (Negi r _)   = error "TBD"
assigned _            = [] -- all other instructions

-- list of read variables (two, one or none) in an instruction
accessed :: Instr -> [String]
accessed = error "TBD"

-- singleton set of last read register of istruction or emptyset if none
replaceable :: Instr -> [String]
replaceable = error "TBD"

-- immediate version of an indirect
replace :: Instr -> Integer -> Instr
replace = error "TBD"

-- replace registers according to predicate p & function f
-- assumes:
--   f converts logical register to physical register, if not spilt
--   p says when register is spilt
--   assigned temporary variable is "T0",
--   accessed temporary variables are either just "T1" or both "T1" & "T2"
repreg :: (String -> Bool) -> (String -> String) -> Instr -> Instr
repreg p f = rr
  where
    rr (Pnt x)      = Pnt (nv1 x)
    rr (Mov x y)    = Mov (nv0 x) (nv1 y)
    rr (Movi x n)   = Movi (nv0 x) n
    rr (Add x y z)  = Add (nv0 x) (nv1 y) (nv2 y z)
    rr (Addi x y m) = Addi (nv0 x) (nv1 y) m
    rr (Mul x y z)  = Mul (nv0 x) (nv1 y) (nv2 y z)
    rr (Muli x y m) = Muli (nv0 x) (nv1 y) m
    rr (Neg x y)    = Neg (nv0 x) (nv1 y)
    rr (Negi x n)   = Negi (nv0 x) n
    rr (Jmp x)      = Jmp (nv1 x)
    rr (Beq l x y)  = Beq l (nv1 x) (nv2 x y)
    rr (Beqi l x n) = Beqi l (nv1 x) n
    rr (Bne l x y)  = Bne l (nv1 x) (nv2 x y)
    rr (Bnei l x n) = Bnei l (nv1 x) n
    rr (Blt l x y)  = Blt l (nv1 x) (nv2 x y)
    rr (Bgei l x n) = Bgei l (nv1 x) n
    rr (Bge l x y)  = Bge l (nv1 x) (nv2 x y)
    rr instr        = instr
    nv0 x | p v       = "T0"
          | otherwise = v
      where v = f x
    nv1 y | p v       = "T1"
          | otherwise = v
      where v = f y
    nv2 y z | p v   = if y/=z && p (f y) then "T2" else "T1"
            | otherwise = v
      where v = f z
