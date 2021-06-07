pred test16 {
some disj Node0: Node {
Node = Node0
no left
right = Node0->Node0
Acyclic[]
}
}
run test16 for 3 expect 0
pred test33 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1
}
}
run test33 for 3 expect 0
pred test23 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
makeFull[]
}
}
run test23 for 3 expect 0
pred test11 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
left = Node2->Node1
right = Node0->Node1
Acyclic[]
}
}
run test11 for 3 expect 0
pred test40 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node1
}
}
run test40 for 3 expect 1
pred test32 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node1->Node0
FullTree[]
}
}
run test32 for 3 expect 0
pred test29 {
some disj Node0: Node {
Node = Node0
no left
no right
makeFull[]
}
}
run test29 for 3 expect 1
pred test22 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
no left
right = Node0->Node2 + Node1->Node0
Acyclic[]
}
}
run test22 for 3 expect 1
