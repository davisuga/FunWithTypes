{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use newtype instead of data" #-}
import GHC.Float (asinDouble)
import GHC.Platform (Arch (armABI))

data TreeBasic a
  = LeafBasic a
  | NodeBasic (TreeBasic a)

-- data ([]) a = [] | a : [a]
data Pair a = MakePair a a

data LowBinaryTree a
  = LowLeaf a
  | LowNode (Pair (LowBinaryTree a))

data Tree f a
  = Leaf a
  | Node (f (Tree f a))

data AnnPair a = MakeAnnPair String a a

type RoseTree a = Tree [] a

type BinTree a = Tree Pair a

type AnnTree a = Tree AnnPair a

pairTree =
  Node
    ( MakePair
        (Leaf 1)
        ( Node
            ( MakePair
                (Leaf 2)
                (Leaf 3)
            )
        )
    )

--   1
-- -<  2
--   -<
--     3
sumStuff x =
  case x of
    (Leaf x) ->
      let xString = show x
       in x
    (Node (MakePair (Leaf a) (Leaf b))) -> a + b
    (Node (MakePair l r)) -> sumStuff l + sumStuff r

-- sumT2 F x =
--   case x of
--     (Leaf x) -> x
--     (Node (F (Leaf a) (Leaf b))) -> a + b
--     (Node (F l r)) -> sumT l + sumT r

class (Applicative m, Functor m) => Monad m

main = print (sumStuff pairTree)

data Apply f a = MkApply (f a)

-- data Maybe a = Nothing | Just a
type T1 = Apply Maybe Int

data ApplyOnInt f = MkApplyOnInt (f Int)

type F = ApplyOnInt Maybe

type T2 = Apply ApplyOnInt Maybe