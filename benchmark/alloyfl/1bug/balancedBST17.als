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
	n !in n.^(left + right)

    // A node cannot have more than one parent.
    -- TODO: Your code starts here.
	(some t : BinaryTree | t.root = n and no n.~(left + right)) or one n.~(left + right)

    // A node cannot have another node as both its left child and
    // right child.
    -- TODO: Your code starts here.
	some n.(left+right) => n.left != n.right
  }
}

// Part (b)
pred Sorted() {
  all n: Node {
    // All elements in the n's left subtree are smaller than the n's elem.
    -- TODO: Your code starts here.
	some n.left => all subNode : n.left.^(left+right) + n.left | n.elem > subNode.elem
    // All elements in the n's right subtree are bigger than the n's elem.
    -- TODO: Your code starts here.
	some n.right => all subNode : n.right.^(left+right) + n.right | n.elem < subNode.elem
  }
}

// Part (c.1)
pred HasAtMostOneChild(n: Node) {
  // Node n has at most one child.
  -- TODO: Your code starts here.
  // Fix: remove ^
  # n.^(left + right) <= 1
}

// Part (c.2)
fun Depth(n: Node): one Int {
  // The number of nodes from the tree's root to n.
  -- TODO: Your code starts here.
  # n.*(~(left + right))
}

// Part (c.3)
pred Balanced() {
  all n1, n2: Node {
    // If n1 has at most one child and n2 has at most one child,
    // then the depths of n1 and n2 differ by at most 1.
    // Hint: Be careful about the operator priority.
    -- TODO: Your code starts here.
    HasAtMostOneChild[n1] and HasAtMostOneChild[n2] => { minus[Depth[n1], Depth[n2]] <= 1 or
    minus[Depth[n1], Depth[n2]] >= -1}
  }
}

pred RepOk() {
  Sorted
  Balanced
}

run RepOk for 5
assert repair_assert_1 {
  all n : Node | HasAtMostOneChild[n] <=> #n.(left + right) <= 1
}
 check repair_assert_1
pred repair_pred_1 {
  all n : Node | HasAtMostOneChild[n] <=> #n.(left + right) <= 1
}
 run repair_pred_1
