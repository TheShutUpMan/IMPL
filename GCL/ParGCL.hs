{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParGCL where
import AbsGCL
import LexGCL
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn17 :: (Ident) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> (Ident)
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (Integer) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> (Integer)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: (Stm) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> (Stm)
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: ([Stm]) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> ([Stm])
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: (A) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> (A)
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Guard) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (Guard)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: (Pred) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> (Pred)
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: (Relation) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> (Relation)
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: (Id) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> (Id)
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: ([Id]) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> ([Id])
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyIn27 :: (Exp) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> (Exp)
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
happyIn28 :: ([Exp]) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> ([Exp])
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
happyIn29 :: (IntExpV) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> (IntExpV)
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyIn30 :: (IntExpV) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> (IntExpV)
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
happyIn31 :: (IntExpV) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> (IntExpV)
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
happyIn32 :: (IntExpV) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> (IntExpV)
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x40\x0d\x00\x00\x00\x00\x00\x50\x03\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x04\x60\x60\x00\x00\x00\x00\x01\x18\x18\x00\x00\x00\x40\x00\x04\x06\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x01\x10\x18\x00\x00\x00\x40\x00\x04\x06\x00\x00\x00\x10\x00\x81\x01\x00\x00\x00\x04\x40\x60\x00\x00\x00\x00\x01\x10\x18\x00\x00\x00\x40\x00\x00\x06\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x40\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x40\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x42\x00\x00\x00\x00\x00\x40\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x18\x18\x00\x00\x00\x40\x00\x06\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00\x00\x00\x00\x88\x00\x00\x00\x00\x00\x00\xd4\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x01\x10\x18\x00\x00\x00\x00\x00\x50\x03\x00\x00\x00\x10\x80\x81\x01\x00\x00\x00\x04\x60\x60\x00\x00\x00\x00\x01\x10\x18\x00\x00\x00\x40\x00\x04\x06\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x04\x40\x60\x00\x00\x00\x00\x01\x10\x18\x00\x00\x00\x40\x00\x04\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x40\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pStm","%start_pListStm","%start_pA","%start_pGuard","%start_pPred","%start_pRelation","%start_pId","%start_pListId","%start_pExp","%start_pListExp","%start_pIntExpV","%start_pIntExpV1","%start_pIntExpV2","%start_pIntExpV3","Ident","Integer","Stm","ListStm","A","Guard","Pred","Relation","Id","ListId","Exp","ListExp","IntExpV","IntExpV1","IntExpV2","IntExpV3","'('","')'","'*'","'+'","','","'->'","':='","';'","'<'","'='","'=>'","'FALSE'","'NEG'","'[]'","'do'","'fi'","'if'","'od'","'skip'","L_ident","L_integ","%eof"]
        bit_start = st * 54
        bit_end = (st + 1) * 54
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..53]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xd6\x00\xd6\x00\xf1\xff\x01\x00\x01\x00\x03\x00\xf1\xff\xf1\xff\x03\x00\x03\x00\x03\x00\x03\x00\x03\x00\x05\x00\xf1\xff\x00\x00\x00\x00\x00\x00\xf4\xff\x03\x00\x00\x00\xf4\xff\x00\x00\x03\x00\xf4\xff\x2c\x00\x07\x00\x2a\x00\x39\x00\x29\x00\x00\x00\x29\x00\x00\x00\x48\x00\x30\x00\x30\x00\x30\x00\x1a\x00\xf6\xff\x00\x00\x00\x00\xf9\xff\xfd\xff\x6a\x00\x30\x00\x46\x00\x3e\x00\x00\x00\x01\x00\x01\x00\x00\x00\x3e\x00\x62\x00\x41\x00\xd6\x00\x4c\x00\x03\x00\xd6\x00\x01\x00\x01\x00\x03\x00\x03\x00\x4c\x00\x03\x00\x03\x00\x03\x00\x00\x00\x63\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x51\x00\x5b\x00\x00\x00\x00\x00\x72\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\xeb\x00\x87\x00\xf1\x00\x1b\x00\x55\x00\x85\x00\x3d\x00\x09\x00\x8d\x00\x5d\x00\x95\x00\xcd\x00\x25\x00\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9d\x00\x00\x00\x00\x00\x00\x00\x35\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2b\x00\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdd\x00\xf2\x00\xa5\x00\xec\x00\x6d\x00\x4b\x00\xad\x00\xb5\x00\x0b\x00\x75\x00\xbd\x00\xd5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf1\xff\xd3\xff\xd4\xff\x00\x00\x00\x00\xf0\xff\x00\x00\xd5\xff\x00\x00\x00\x00\xd7\xff\x00\x00\xd9\xff\xdc\xff\x00\x00\xdd\xff\x00\x00\xe0\xff\xdf\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe3\xff\xe5\xff\x00\x00\x00\x00\x00\x00\x00\x00\xeb\xff\x00\x00\xee\xff\x00\x00\x00\x00\xef\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd6\xff\x00\x00\xd2\xff\xd8\xff\xda\xff\xdb\xff\xde\xff\xe2\xff\xe1\xff\xe6\xff\xe4\xff\xe7\xff\xe9\xff\x00\x00\xea\xff\xec\xff\xed\xff\x00\x00\xe8\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x0b\x00\x01\x00\x06\x00\x01\x00\x14\x00\x01\x00\x0e\x00\x0b\x00\x00\x00\x16\x00\x00\x00\x16\x00\x0c\x00\x0d\x00\x16\x00\x0d\x00\x08\x00\x09\x00\x08\x00\x09\x00\x14\x00\x15\x00\x14\x00\x15\x00\x14\x00\x15\x00\x00\x00\x01\x00\x16\x00\x00\x00\x01\x00\x05\x00\x06\x00\x07\x00\x09\x00\x0a\x00\x00\x00\x01\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x0f\x00\x04\x00\x03\x00\x05\x00\x06\x00\x07\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x05\x00\x16\x00\x05\x00\x06\x00\x07\x00\x0e\x00\x0f\x00\x08\x00\x16\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x05\x00\x08\x00\x0e\x00\x05\x00\x06\x00\x07\x00\x12\x00\x16\x00\x00\x00\x01\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x06\x00\x07\x00\x00\x00\x01\x00\x0e\x00\x14\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x02\x00\x0b\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x05\x00\x0e\x00\x07\x00\x10\x00\x06\x00\x07\x00\x00\x00\x01\x00\x05\x00\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\xff\xff\xff\xff\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x00\x00\xff\xff\x02\x00\x03\x00\x04\x00\x07\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\x0a\x00\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x00\x00\x01\x00\xff\xff\xff\xff\xff\xff\x0d\x00\x0e\x00\x0f\x00\x00\x00\xff\xff\x02\x00\x03\x00\x04\x00\x0d\x00\x0e\x00\x0f\x00\x0f\x00\xff\xff\x11\x00\xff\xff\x13\x00\x14\x00\x00\x00\x00\x00\x02\x00\x02\x00\x04\x00\x04\x00\x00\x00\x00\x00\xff\xff\xff\xff\x04\x00\x04\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x3b\x00\x14\x00\x3a\x00\x14\x00\x10\x00\x14\x00\x3c\x00\x3b\x00\x20\x00\xff\xff\x20\x00\xff\xff\x29\x00\x18\x00\xff\xff\x18\x00\x21\x00\x22\x00\x21\x00\x48\x00\x10\x00\x15\x00\x10\x00\x15\x00\x10\x00\x15\x00\x10\x00\x11\x00\xff\xff\x10\x00\x11\x00\x29\x00\x2a\x00\x27\x00\x3d\x00\x3e\x00\x10\x00\x11\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x12\x00\x41\x00\x42\x00\x35\x00\x2a\x00\x27\x00\x15\x00\x16\x00\x10\x00\x11\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x20\x00\x40\x00\xff\xff\x34\x00\x2a\x00\x27\x00\x42\x00\x16\x00\x23\x00\xff\xff\x25\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x3f\x00\x37\x00\x3c\x00\x4b\x00\x2a\x00\x27\x00\x52\x00\xff\xff\x10\x00\x11\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x26\x00\x27\x00\x10\x00\x11\x00\x3c\x00\x10\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x45\x00\x3b\x00\x1c\x00\x1d\x00\x1e\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x38\x00\x3c\x00\x39\x00\x53\x00\x4c\x00\x27\x00\x10\x00\x11\x00\x54\x00\x00\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x00\x00\x00\x00\x1c\x00\x47\x00\x1e\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x2b\x00\x00\x00\x2d\x00\x2e\x00\x2f\x00\x24\x00\x10\x00\x11\x00\x00\x00\x00\x00\x25\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x1f\x00\x00\x00\x1e\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x1a\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x43\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x4e\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x4a\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x49\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x46\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x54\x00\x1b\x00\x19\x00\x16\x00\x10\x00\x11\x00\x00\x00\x00\x00\x00\x00\x18\x00\x19\x00\x16\x00\x2b\x00\x00\x00\x2d\x00\x50\x00\x2f\x00\x45\x00\x19\x00\x16\x00\x31\x00\x00\x00\x32\x00\x00\x00\x33\x00\x10\x00\x2b\x00\x2b\x00\x33\x00\x4d\x00\x2f\x00\x2f\x00\x2b\x00\x2b\x00\x00\x00\x00\x00\x2c\x00\x4f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (14, 45) [
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45)
	]

happy_n_terms = 23 :: Int
happy_n_nonterms = 16 :: Int

happyReduce_14 = happySpecReduce_1  0# happyReduction_14
happyReduction_14 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn17
		 (Ident happy_var_1
	)}

happyReduce_15 = happySpecReduce_1  1# happyReduction_15
happyReduction_15 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn18
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_16 = happySpecReduce_1  2# happyReduction_16
happyReduction_16 happy_x_1
	 =  happyIn19
		 (AbsGCL.Stm_skip
	)

happyReduce_17 = happySpecReduce_1  2# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (AbsGCL.StmA happy_var_1
	)}

happyReduce_18 = happySpecReduce_3  2# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_2 of { happy_var_2 -> 
	happyIn19
		 (AbsGCL.Stm1 happy_var_2
	)}

happyReduce_19 = happySpecReduce_3  2# happyReduction_19
happyReduction_19 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_2 of { happy_var_2 -> 
	happyIn19
		 (AbsGCL.Stm2 happy_var_2
	)}

happyReduce_20 = happySpecReduce_1  3# happyReduction_20
happyReduction_20 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 ((:[]) happy_var_1
	)}

happyReduce_21 = happySpecReduce_3  3# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	case happyOut20 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_22 = happySpecReduce_3  4# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 (AbsGCL.A1 happy_var_1 happy_var_3
	)}}

happyReduce_23 = happyReduce 5# 4# happyReduction_23
happyReduction_23 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_1 of { happy_var_1 -> 
	case happyOut21 happy_x_3 of { happy_var_3 -> 
	case happyOut29 happy_x_5 of { happy_var_5 -> 
	happyIn21
		 (AbsGCL.A2 happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_24 = happySpecReduce_3  5# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn22
		 (AbsGCL.Ass happy_var_1 happy_var_3
	)}}

happyReduce_25 = happySpecReduce_3  5# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_3 of { happy_var_3 -> 
	happyIn22
		 (AbsGCL.Comp happy_var_1 happy_var_3
	)}}

happyReduce_26 = happySpecReduce_1  6# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn23
		 (AbsGCL.F
	)

happyReduce_27 = happySpecReduce_3  6# happyReduction_27
happyReduction_27 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 (AbsGCL.Imp happy_var_1 happy_var_3
	)}}

happyReduce_28 = happySpecReduce_1  6# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut24 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (AbsGCL.Rel happy_var_1
	)}

happyReduce_29 = happySpecReduce_3  7# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn24
		 (AbsGCL.Eq happy_var_1 happy_var_3
	)}}

happyReduce_30 = happySpecReduce_3  7# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn24
		 (AbsGCL.Lt happy_var_1 happy_var_3
	)}}

happyReduce_31 = happySpecReduce_1  8# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (AbsGCL.Lst happy_var_1
	)}

happyReduce_32 = happySpecReduce_1  9# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	happyIn26
		 ((:[]) happy_var_1
	)}

happyReduce_33 = happySpecReduce_3  9# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	case happyOut26 happy_x_3 of { happy_var_3 -> 
	happyIn26
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_34 = happySpecReduce_1  10# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	happyIn27
		 (AbsGCL.Els happy_var_1
	)}

happyReduce_35 = happySpecReduce_1  11# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	happyIn28
		 ((:[]) happy_var_1
	)}

happyReduce_36 = happySpecReduce_3  11# happyReduction_36
happyReduction_36 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut28 happy_x_3 of { happy_var_3 -> 
	happyIn28
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_37 = happySpecReduce_3  12# happyReduction_37
happyReduction_37 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn29
		 (AbsGCL.Add happy_var_1 happy_var_3
	)}}

happyReduce_38 = happySpecReduce_1  12# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	happyIn29
		 (happy_var_1
	)}

happyReduce_39 = happySpecReduce_3  13# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut31 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn30
		 (AbsGCL.Mul happy_var_1 happy_var_3
	)}}

happyReduce_40 = happySpecReduce_1  13# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOut31 happy_x_1 of { happy_var_1 -> 
	happyIn30
		 (happy_var_1
	)}

happyReduce_41 = happySpecReduce_2  14# happyReduction_41
happyReduction_41 happy_x_2
	happy_x_1
	 =  case happyOut31 happy_x_2 of { happy_var_2 -> 
	happyIn31
		 (AbsGCL.Neg happy_var_2
	)}

happyReduce_42 = happySpecReduce_1  14# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOut32 happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (happy_var_1
	)}

happyReduce_43 = happySpecReduce_1  15# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (AbsGCL.Nmb happy_var_1
	)}

happyReduce_44 = happySpecReduce_1  15# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (AbsGCL.Var happy_var_1
	)}

happyReduce_45 = happySpecReduce_3  15# happyReduction_45
happyReduction_45 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { happy_var_2 -> 
	happyIn32
		 (happy_var_2
	)}

happyNewToken action sts stk [] =
	happyDoAction 22# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TV happy_dollar_dollar) -> cont 20#;
	PT _ (TI happy_dollar_dollar) -> cont 21#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 22# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut19 x))

pListStm tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (happyOut20 x))

pA tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (happyOut21 x))

pGuard tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (happyOut22 x))

pPred tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (happyOut23 x))

pRelation tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (happyOut24 x))

pId tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (happyOut25 x))

pListId tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (happyOut26 x))

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (happyOut27 x))

pListExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (happyOut28 x))

pIntExpV tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (happyOut29 x))

pIntExpV1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (happyOut30 x))

pIntExpV2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (happyOut31 x))

pIntExpV3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (happyOut32 x))

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    t:_ -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 10 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc-8.6.3/include/ghcversion.h" #-}















{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc670_0/ghc_2.h" #-}
































































































































































































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 180 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
