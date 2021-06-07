pred test40 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node1
}
}
run test40 for 3 expect 1
pred test29 {
some disj Node0: Node {
Node = Node0
no left
no right
makeFull[]
}
}
run test29 for 3 expect 1
pred test20 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
left = Node2->Node1
right = Node0->Node2
Acyclic[]
}
}
run test20 for 3 expect 1
pred test35 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node1->Node1
}
}
run test35 for 3 expect 1
pred test17 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node0->Node1
Acyclic[]
}
}
run test17 for 3 expect 0
pred test30 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node0
makeFull[]
}
}
run test30 for 3 expect 1
pred test6 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
}
}
run test6 for 3 expect 1
pred test26 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node1->Node0
makeFull[]
}
}
run test26 for 3 expect 0
