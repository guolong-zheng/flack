pred test2 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node1
right = Node0->Node1
}
}
run test2 for 3 expect 1
pred test17 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0
right = Node0->Node1
Acyclic[]
}
}
run test17 for 3 expect 0
pred test24 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node0 + Node1->Node1
right = Node1->Node1
}
}
run test24 for 3 expect 0
pred test3 {

no Node
no left
no right

}
run test3 for 3 expect 1
pred test28 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node0 + Node0->Node1 + Node1->Node0 + Node1->Node1
right = Node1->Node1
}
}
run test28 for 3 expect 0
pred test32 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
right = Node0->Node0
}
}
run test32 for 3 expect 1
