pred test37 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node1->Node1
right = Node0->Node0 + Node0->Node1 + Node1->Node1
}
}
run test37 for 3 expect 0
pred test42 {
some disj Node0: Node {
Node = Node0
left = Node0->Node0
right = Node0->Node0
}
}
run test42 for 3 expect 1
pred test1 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
left = Node0->Node1 + Node1->Node1
right = Node0->Node1 + Node1->Node1
}
}
run test1 for 3 expect 1
pred test23 {
some disj Node0, Node1: Node {
Node = Node0 + Node1
no left
right = Node0->Node1 + Node1->Node0
makeFull[]
}
}
run test23 for 3 expect 0
