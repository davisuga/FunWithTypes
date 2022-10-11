case class Pair[A](left: A, Right: A)

enum LowBinaryTree[A]:
  case LowLeaf(value: A)
  case LowNode(value: Pair[LowBinaryTree[A]])

enum Tree[F[_], A]:
  case Leaf(value: A)
  case Node(value: F[Tree[F, A]])

case class AnnPair[A](label: String, left: A, right: A)

type RoseTree[A] = Tree[List, A]

type BinaryTree[A] = Tree[Pair, A]

type AnnTree[A] = Tree[AnnPair, A]

val pairTree =
  Tree.Node(Pair(Tree.Leaf(1), Tree.Node(Pair(Tree.Leaf(2), Tree.Leaf(3)))))

def sumStuff(x: BinaryTree[Int]): Int = {
  x match
    case Tree.Leaf(x) =>
      print(x)
      x
    case Tree.Node(Pair(Tree.Leaf(a), Tree.Leaf(b))) => a + b
    case Tree.Node(Pair(l, r)) => sumStuff(l) + sumStuff(r)
}
