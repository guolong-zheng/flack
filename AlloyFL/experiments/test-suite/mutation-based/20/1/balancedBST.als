pred test80 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
left = Node0->Node0
no right
elem = Node0->1
}}
}
run test80 for 4 expect 0
pred test78 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->7 + Node1->6
Depth[Node1] = 1
}}
}
run test78 for 4 expect 1
pred test31 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->6 + Node1->-8
Sorted[]
}}
}
run test31 for 4 expect 0
pred test26 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->4 + Node1->5
Sorted[]
}}
}
run test26 for 4 expect 1
pred test95 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1
right = Node2->Node0
elem = Node0->7 + Node1->6 + Node2->3
}}
}
run test95 for 4 expect 1
pred test105 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->6 + Node2->5
}}
}
run test105 for 4 expect 0
pred test94 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->-4
}}
}
run test94 for 4 expect 1
pred test44 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->1 + Node1->1
Sorted[]
}}
}
run test44 for 4 expect 0
pred test29 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node0->Node2 + Node1->Node0
right = Node3->Node1
elem = Node0->7 + Node1->6 + Node2->4 + Node3->3
Sorted[]
}}
}
run test29 for 4 expect 0
pred test9 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
no elem
}}
}
run test9 for 4 expect 0
pred test7 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1 + Node2->Node0
no right
elem = Node0->7 + Node1->3 + Node2->2
}}
}
run test7 for 4 expect 1
pred test60 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node1->Node0
right = Node2->Node1
elem = Node0->7 + Node1->2 + Node2->1
Balanced[]
}}
}
run test60 for 4 expect 0
pred test91 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
right = Node0->Node0
elem = Node0->-8
}}
}
run test91 for 4 expect 0
pred test15 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
no left
right = Node0->Node1 + Node2->Node0
elem = Node0->4 + Node1->2 + Node2->1
Sorted[]
}}
}
run test15 for 4 expect 0
pred test81 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
right = Node0->Node0
elem = Node0->-1
}}
}
run test81 for 4 expect 0
pred test58 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->6 + Node2->-7 + Node3->-8
Balanced[]
}}
}
run test58 for 4 expect 1
pred test65 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->-6 + Node2->-7 + Node3->-8
Balanced[]
}}
}
run test65 for 4 expect 1
pred test3 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0 + BinaryTree0->Node1
Node = Node0 + Node1
left = Node0->Node1
no right
elem = Node0->7 + Node1->6
}}
}
run test3 for 4 expect 0
pred test4 {
some disj BinaryTree0: BinaryTree {
BinaryTree = BinaryTree0
no root
no Node
no left
no right
no elem
}
}
run test4 for 4 expect 1
pred test34 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-7 + Node1->-8
Sorted[]
}}
}
run test34 for 4 expect 1
pred test77 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0 + Node1
no left
right = Node0->Node1
elem = Node0->7 + Node1->6
Depth[Node1] = 2
}}
}
run test77 for 4 expect 1
pred test54 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->-6 + Node1->-5
HasAtMostOneChild[Node1]
}}
}
run test54 for 4 expect 1
