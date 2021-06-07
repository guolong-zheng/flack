pred test29 {
some disj Node0: Node {
Node = Node0
no left
no right
makeFull[]
}
}
run test29 for 3 expect 1
pred test3 {

no Node
no left
no right

}
run test3 for 3 expect 1
pred test39 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node0 + Node1->Node1
}
}
run test39 for 3 expect 0
pred test7 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
no right
}
}
run test7 for 3 expect 1
pred test14 {
some disj Node0: Node {
Node = Node0
no left
no right
Acyclic[]
}
}
run test14 for 3 expect 1
pred test44 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node1 + Node1->Node0
}
}
run test44 for 3 expect 1
pred test1 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node1
right = Node0->Node1 + Node1->Node1
}
}
run test1 for 3 expect 1
pred test16 {
some disj Node0: Node {
Node = Node0
no left
right = Node0->Node0
Acyclic[]
}
}
run test16 for 3 expect 0
pred test41 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node0
no right
}
}
run test41 for 3 expect 1
pred test19 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node1->Node0
Acyclic[]
}
}
run test19 for 3 expect 1
pred test5 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0
right = Node0->Node0
}
}
run test5 for 3 expect 1
pred test22 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
no left
right = Node0->Node2 + Node1->Node0
Acyclic[]
}
}
run test22 for 3 expect 1
pred test23 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
makeFull[]
}
}
run test23 for 3 expect 0
