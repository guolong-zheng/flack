pred test15 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
Acyclic[]
}
}
run test15 for 3 expect 0
pred test3 {

no Node
no left
no right

}
run test3 for 3 expect 1
pred test14 {
some disj Node0: Node {
Node = Node0
no left
no right
Acyclic[]
}
}
run test14 for 3 expect 1
