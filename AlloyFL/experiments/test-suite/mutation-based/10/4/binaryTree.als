pred test33 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node1 + Node1->Node1
}
}
run test33 for 3 expect 1
pred test8 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
no right
Acyclic[]
}
}
run test8 for 3 expect 0
pred test16 {
some disj Node0: Node {
Node = Node0
no left
right = Node0->Node0
Acyclic[]
}
}
run test16 for 3 expect 0
