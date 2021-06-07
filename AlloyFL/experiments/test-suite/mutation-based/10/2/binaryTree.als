pred test7 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
no right
}
}
run test7 for 3 expect 1
pred test21 {
some disj Node0, Node1, Node2: Node {
Node = Node0 + Node1 + Node2
left = Node0->Node2 + Node1->Node0
no right
Acyclic[]
}
}
run test21 for 3 expect 1
pred test4 {
some disj Node0: Node {
Node = Node0
no left
no right
}
}
run test4 for 3 expect 1
