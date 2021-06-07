pred test15 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
Acyclic[]
}
}
run test15 for 3 expect 0
pred test32 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node1->Node0
FullTree[]
}
}
run test32 for 3 expect 0
pred test43 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node1 + Node1->Node1
}
}
run test43 for 3 expect 1
pred test31 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
FullTree[]
}
}
run test31 for 3 expect 0
pred test8 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
Acyclic[]
}
}
run test8 for 3 expect 0
pred test10 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node0->Node0
Acyclic[]
}
}
run test10 for 3 expect 0
pred test14 {
some disj Node0: Node {
Node = Node0
no left
no right
Acyclic[]
}
}
run test14 for 3 expect 1
pred test33 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1
}
}
run test33 for 3 expect 0
