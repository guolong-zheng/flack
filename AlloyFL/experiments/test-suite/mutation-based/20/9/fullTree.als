pred test5 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0
right = Node0->Node0
}
}
run test5 for 3 expect 1
pred test15 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
Acyclic[]
}
}
run test15 for 3 expect 0
pred test23 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
makeFull[]
}
}
run test23 for 3 expect 0
pred test38 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0 + Node0->Node1 + Node1->Node0 + Node1->Node1
right = Node1->Node1
}
}
run test38 for 3 expect 0
pred test6 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
}
}
run test6 for 3 expect 1
pred test30 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node0
makeFull[]
}
}
run test30 for 3 expect 1
pred test22 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
no left
right = Node0->Node2 + Node1->Node0
Acyclic[]
}
}
run test22 for 3 expect 1
pred test13 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node1->Node1
Acyclic[]
}
}
run test13 for 3 expect 0
