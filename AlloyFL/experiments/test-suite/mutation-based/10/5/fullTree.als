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
