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
pred test14 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node1
right = Node2->Node0
elem = Node0->7 + Node1->0 + Node2->-5
Sorted[]
}}
}
run test14 for 4 expect 1
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
pred test22 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node0
no right
elem = Node0->1 + Node1->4
Sorted[]
}}
}
run test22 for 4 expect 1
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
pred test43 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
no left
right = Node1->Node2 + Node2->Node0 + Node3->Node1
elem = Node0->7 + Node1->3 + Node2->2 + Node3->-2
Sorted[]
}}
}
run test43 for 4 expect 0
pred test93 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node0->Node2
right = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->5 + Node2->5
}}
}
run test93 for 4 expect 0
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
pred test48 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-7 + Node1->-8
HasAtMostOneChild[Node1]
}}
}
run test48 for 4 expect 1
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
pred test104 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
no left
right = Node1->Node0 + Node2->Node1
elem = Node0->5 + Node1->5 + Node2->-1
}}
}
run test104 for 4 expect 1
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
pred test28 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node1->Node0
right = Node2->Node1
elem = Node0->7 + Node1->7 + Node2->-2
Sorted[]
}}
}
run test28 for 4 expect 0
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
pred test17 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-3 + Node1->-1
Sorted[]
}}
}
run test17 for 4 expect 0
pred test62 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->4 + Node1->4 + Node2->4 + Node3->0
Balanced[]
}}
}
run test62 for 4 expect 1
pred test1 {

no BinaryTree
no root
no Node
no left
no right
no elem

}
run test1 for 4 expect 0
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
pred test8 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node2
Node = Node0 + Node1 + Node2
left = Node1->Node0 + Node2->Node1
no right
elem = Node0->-7 + Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node0->4 + Node0->5 + Node0->6 + Node0->7 + Node1->-8 + Node1->7 + Node2->-7 + Node2->-6 + Node2->-5 + Node2->-4 + Node2->-3 + Node2->-2 + Node2->-1 + Node2->0 + Node2->1 + Node2->2 + Node2->3 + Node2->4 + Node2->5 + Node2->6 + Node2->7
}}
}
run test8 for 4 expect 0
pred test64 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1, Node2, Node3: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node3
Node = Node0 + Node1 + Node2 + Node3
left = Node2->Node1 + Node3->Node2
right = Node3->Node0
elem = Node0->7 + Node1->0 + Node2->-2 + Node3->-5
Balanced[]
}}
}
run test64 for 4 expect 1
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
pred test47 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-8 + Node1->5
HasAtMostOneChild[Node1]
}}
}
run test47 for 4 expect 1
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
pred test39 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
no left
right = Node1->Node0
elem = Node0->-3 + Node1->-2
Sorted[]
}}
}
run test39 for 4 expect 0
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
pred test84 {
some disj BinaryTree0: BinaryTree {some disj Node0, Node1: Node {
BinaryTree = BinaryTree0
root = BinaryTree0->Node1
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node0
elem = Node0->-4 + Node1->-5
}}
}
run test84 for 4 expect 0
