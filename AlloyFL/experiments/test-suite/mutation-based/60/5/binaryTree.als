pred test5 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0
right = Node0->Node0
}
}
run test5 for 3 expect 1
pred test8 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
Acyclic[]
}
}
run test8 for 3 expect 0
pred test29 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node0 + Node1->Node1
}
}
run test29 for 3 expect 0
pred test25 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node1
}
}
run test25 for 3 expect 1
pred test20 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
left = Node2->Node1
right = Node0->Node2
Acyclic[]
}
}
run test20 for 3 expect 1
pred test6 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
}
}
run test6 for 3 expect 1
pred test2 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node1
right = Node0->Node1
}
}
run test2 for 3 expect 1
pred test1 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node1
right = Node0->Node1 + Node1->Node1
}
}
run test1 for 3 expect 1
pred test10 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node0->Node0
Acyclic[]
}
}
run test10 for 3 expect 0
pred test32 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
right = Node0->Node0
}
}
run test32 for 3 expect 1
pred test27 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1 + Node1->Node1
}
}
run test27 for 3 expect 0
pred test18 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
no right
Acyclic[]
}
}
run test18 for 3 expect 1
pred test23 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1
}
}
run test23 for 3 expect 0
pred test15 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
Acyclic[]
}
}
run test15 for 3 expect 0
pred test28 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0 + Node0->Node1 + Node1->Node0 + Node1->Node1
right = Node1->Node1
}
}
run test28 for 3 expect 0
pred test14 {
some disj Node0: Node {
Node = Node0
no left
no right
Acyclic[]
}
}
run test14 for 3 expect 1
pred test3 {

no Node
no left
no right

}
run test3 for 3 expect 1
pred test24 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0 + Node1->Node1
right = Node1->Node1
}
}
run test24 for 3 expect 0
pred test22 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
no left
right = Node0->Node2 + Node1->Node0
Acyclic[]
}
}
run test22 for 3 expect 1
pred test16 {
some disj Node0: Node {
Node = Node0
no left
right = Node0->Node0
Acyclic[]
}
}
run test16 for 3 expect 0
