one sig BinaryTree {
	root: lone Node
}

sig Node {
	left, right: lone Node,
	elem: Int
}

// All nodes are in the tree.
fact Reachable {
	Node = BinaryTree.root.*(left + right)
}

// Part (a)
fact Acyclic {
	all n : Node {
	// There are no directed cycles, i.e., a node is not reachable
	// from itself along one or more traversals of left or right.
	-- TODO: Your code starts here.
	n ! in n.^(left + right)
	// A node cannot have more than one parent.
	-- TODO: Your code starts here.
	no (n.^left.*(left + right) & n.^right.*(left + right))
	// A node cannot have another node as both its left child and
	// right child.
	-- TODO: Your code starts here.
	no (n.^left.*(left + right) & n.^right.*(left + right))
	}
}

// Part (b)
pred Sorted() {
	all n: Node {
	// All elements in the n’s left subtree are smaller than the n’s elem.
	-- TODO: Your code starts here.
	all i : n.^left.*(left + right).elem | i < n.elem
	// All elements in the n’s right subtree are bigger than the n’s elem.
	-- TODO: Your code starts here.
	all i : n.^right.*(left + right).elem | i > n.elem
	}
}

// Part (c.1)
pred HasAtMostOneChild(n: Node) {
	// Node n has at most one child.
	-- TODO: Your code starts here.
	(lone n.left && no n.right) or (no n.left && lone n.right)
}

// Part (c.2)
fun Depth(n: Node): one Int {
	// The number of nodes from the tree’s root to n.
	-- TODO: Your code starts here.
        // Fix: replace ^ with *
	#(n.^~(left + right))
}

// Part (c.3)
pred Balanced() {
	all n1, n2: Node {
	// If n1 has at most one child and n2 has at most one child,
	// then the depths of n1 and n2 differ by at most 1.
		HasAtMostOneChild[n1] && HasAtMostOneChild[n2] =>
		Depth[n1].sub[Depth[n2]] <= 1 && Depth[n1].sub[Depth[n2]] >= -1
	}
}

pred RepOk() {
	Sorted
	Balanced
}

run RepOk for 5
