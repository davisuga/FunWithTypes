type tree<f, a> = 
			| Leaf(a)
			-- tree<f, a> is recursive
			| Node (f<tree<f, a>>)

type pair<t> = Pair (t, t)

type binaryTree<i> = tree < pair, i>

type roseTree<i> = tree <[], i>

-- infers pairTree: tree<pair, int>
pairTree = Pair (1, 2)

-- infers sumStuff<a: Numeric & Stringable>: binaryTree<a> -> a
rec sumStuff = (pTree) =>
	match pTre with:    
		|Leaf(num) -> 
			print(num);
			num
		|Node (Pair ((Leaf(a)), (Leaf(b)))) -> a + b
		|Node (Pair (l, r)) -> sumStuff l + sumStuff r


type treeBasic<a>
  = LeafBasic(a)
  | NodeBasic(treeBasic<a>)