pred test25 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node1
right = Node1->Node0
elem = Node0->-3 + Node1->-7 + Node2->-3
Sorted[]
}}
}
run test25 for 4 expect 0
pred test71 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->7 + Node1->-4
RepOk[]
}}
}
run test71 for 4 expect 0
pred test45 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->5 + Node1->5
Sorted[]
}}
}
run test45 for 4 expect 0
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
pred test97 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node2->Node1
elem = Node0->7 + Node1->6 + Node2->2
}}
}
run test97 for 4 expect 1
pred test109 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1
right = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->6 + Node2->3
}}
}
run test109 for 4 expect 0
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
pred test74 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node0->Node2
right = Node2->Node1 + Node3->Node0
elem = Node0->7 + Node1->5 + Node2->4 + Node3->2
RepOk[]
}}
}
run test74 for 4 expect 0
pred test110 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node1->Node0 + Node2->Node1
right = Node2->Node1
elem = Node0->7 + Node1->7 + Node2->-2
}}
}
run test110 for 4 expect 0
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
pred test69 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->7 + Node2->6 + Node3->-1
Balanced[]
}}
}
run test69 for 4 expect 1
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
pred test103 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->7 + Node1->0
}}
}
run test103 for 4 expect 1
pred test2 {
some disj BinaryTree0, BinaryTree1: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0 + BinaryTree1
root = BinaryTree1->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node1->Node0 + Node3->Node1
right = Node3->Node2
elem = Node0->6 + Node1->5 + Node2->1 + Node3->-8
}}
}
run test2 for 4 expect 0
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
pred test88 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
no right
elem = Node0->-1
}}
}
run test88 for 4 expect 1
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
pred test101 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->7 + Node1->0
}}
}
run test101 for 4 expect 1
pred test20 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->-7 + Node1->-4
Sorted[]
}}
}
run test20 for 4 expect 1
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
pred test79 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
no left
right = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->7 + Node2->6
Depth[Node2] = 1
}}
}
run test79 for 4 expect 1
pred test61 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->-2 + Node2->-4 + Node3->-5
Balanced[]
}}
}
run test61 for 4 expect 1
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
pred test5 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->7 + Node1->6
}}
}
run test5 for 4 expect 1
pred test35 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->0 + Node1->2
Sorted[]
}}
}
run test35 for 4 expect 0
pred test50 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node2->Node1
elem = Node0->1 + Node1->-7 + Node2->-6
HasAtMostOneChild[Node2]
}}
}
run test50 for 4 expect 0
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
pred test82 {
some disj BinaryTree0: BinaryTree {some disj Node0: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node0
Node = Node0
no left
right = Node0->Node0
elem = Node0->-2
}}
}
run test82 for 4 expect 0
pred test21 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->3 + Node1->2
Sorted[]
}}
}
run test21 for 4 expect 0
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
pred test36 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->0 + Node1->-4
Sorted[]
}}
}
run test36 for 4 expect 1
pred test59 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->3 + Node2->0 + Node3->-5
Balanced[]
}}
}
run test59 for 4 expect 1
pred test100 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
}}
}
run test100 for 4 expect 0
pred test46 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node2->Node0
right = Node2->Node1
elem = Node0->1 + Node1->-2 + Node2->-1
HasAtMostOneChild[Node2]
}}
}
run test46 for 4 expect 0
pred test37 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
no left
right = Node0->Node1 + Node2->Node0 + Node3->Node2
elem = Node0->6 + Node1->6 + Node2->4 + Node3->-4
Sorted[]
}}
}
run test37 for 4 expect 0
pred test92 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node2
right = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->4 + Node2->0
}}
}
run test92 for 4 expect 0
