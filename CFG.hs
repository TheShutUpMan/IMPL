module CFG where

type CFG = (Int, -- Number of nodes
            Int -> [Int]) -- Adjacency list representation
-- Assumes:
-- nodes numbered 0..size-1, without gaps;
-- adjacency list defined for numbers in range [0..size-1] and no others;
-- each adjecency list is a subset of [0..size-1]

opposite :: CFG -> CFG
opposite (size, adjlist) = (size, revadj)
  where revadj n | 0<=n && n<size = [m | m<-[0..size-1], n `elem` adjlist m]
  -- undefined if called out of range
