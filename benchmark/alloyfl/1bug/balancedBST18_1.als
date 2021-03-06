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
  n !in n.^(left+right)

  // A node cannot have more than one parent. 
  -- TODO: Your code starts here.
  all p0: Node, p1:Node | n in p0.(left+right) and p0 != p1 => (n !in p1.left) and (n !in p1.right)

// A node cannot have another node as both its left child and 
// right child.
-- TODO: Your code starts here.
  no child:Node |
  child in n.left and child in n.right

  }
}

// Part (b)
pred Sorted() {
  all n: Node {
// All elements in the n’s left subtree are smaller than the n’s elem. 
-- TODO: Your code starts here.
   all ln: n.left.*(left+right) |
   ln.elem < n.elem

// All elements in the n’s right subtree are bigger than the n’s elem.
-- TODO: Your code starts here.
  all rn: n.right.*(left+right) |
   rn.elem > n.elem

  } 
}

// Part (c.1)
pred HasAtMostOneChild(n: Node) {
// Node n has at most one child. 
-- TODO: Your code starts here.
  all c0: Node, c1: Node | c0 in n.left => c1 !in n.right

}

// Part (c.2)
fun Depth(n: Node): one Int {
  // The number of nodes from the tree's root to n.
  -- TODO: Your code starts here.
  // Fix: replace ^ with *
  #(n.^~(left+right))
}

// Part (c.3)
pred Balanced() {
  all n1, n2: Node {
    // If n1 has at most one child and n2 has at most one child,
    // then the depths of n1 and n2 differ by at most 1.
    // Hint: Be careful about the operator priority.
    -- TODO: Your code starts here.
   (HasAtMostOneChild[n1] and HasAtMostOneChild[n2]) => 
   (sub[Depth[n1], Depth[n2]] <= 1)  and (sub[Depth[n1], Depth[n2]] >= -1)
  }
}

pred RepOk() {
  Sorted
  Balanced
}

run RepOk for 11 Node

pred depthok {
	all n : Node | Depth[n] = #(n.*~(left + right))
}

run RepOk for 5
assert repair_assert_1 {
 depthok
}
 check repair_assert_1
pred repair_pred_1 {
  some Node
  depthok
}
 run repair_pred_1