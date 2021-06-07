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
pred test99 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->6
}}
}
run test99 for 4 expect 0
pred test12 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->-1
Sorted[]
}}
}
run test12 for 4 expect 1
pred test87 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1 + Node2->Node2
right = Node2->Node0
elem = Node0->7 + Node1->6 + Node2->4
}}
}
run test87 for 4 expect 0
pred test57 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1 + Node2->Node0
no right
elem = Node0->7 + Node1->1 + Node2->-6
Balanced[]
}}
}
run test57 for 4 expect 0
pred test85 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1 + Node2->Node0
right = Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
}}
}
run test85 for 4 expect 0
pred test40 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node0->Node2
right = Node2->Node1 + Node3->Node0
elem = Node0->7 + Node1->4 + Node2->3 + Node3->5
Sorted[]
}}
}
run test40 for 4 expect 0
pred test106 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->-5
}}
}
run test106 for 4 expect 1
pred test1 {

no BinaryTree
no root
no Node
no left
no right
no elem

}
run test1 for 4 expect 0
pred test51 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1 + Node2
left = Node1->Node2
right = Node2->Node0
elem = Node0->7 + Node1->-8 + Node2->3
HasAtMostOneChild[Node2]
}}
}
run test51 for 4 expect 1
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
pred test13 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->3 + Node1->0
Sorted[]
}}
}
run test13 for 4 expect 0
pred test72 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node1
right = Node2->Node0
elem = Node0->3 + Node1->3 + Node2->2
RepOk[]
}}
}
run test72 for 4 expect 0
pred test11 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->4 + Node1->4
Sorted[]
}}
}
run test11 for 4 expect 0
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
pred test30 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->2 + Node1->2
Sorted[]
}}
}
run test30 for 4 expect 0
pred test41 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1
right = Node2->Node0
elem = Node0->-5 + Node1->-8 + Node2->-8
Sorted[]
}}
}
run test41 for 4 expect 0
pred test73 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->5 + Node2->5 + Node3->4
RepOk[]
}}
}
run test73 for 4 expect 0
pred test83 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node0
elem = Node0->-5 + Node1->-6
}}
}
run test83 for 4 expect 0
pred test6 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
no left
right = Node2->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->-8
}}
}
run test6 for 4 expect 0
pred test10 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->-8 + Node0->-7 + Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node0->4 + Node0->5 + Node0->6 + Node0->7
}}
}
run test10 for 4 expect 0
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
pred test96 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->7 + Node1->5
}}
}
run test96 for 4 expect 1
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
pred test38 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-2 + Node1->-3
Sorted[]
}}
}
run test38 for 4 expect 1
pred test23 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->0 + Node1->-2
Sorted[]
}}
}
run test23 for 4 expect 0
pred test55 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node1->Node2
elem = Node0->2 + Node1->-8 + Node2->7
HasAtMostOneChild[Node2]
}}
}
run test55 for 4 expect 1
pred test102 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node1->Node0 + Node2->Node1
no right
elem = Node0->5 + Node1->5 + Node2->-1
}}
}
run test102 for 4 expect 1
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
pred test75 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->7
Depth[Node0] = 1
}}
}
run test75 for 4 expect 1
