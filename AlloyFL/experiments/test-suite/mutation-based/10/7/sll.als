pred test20 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node2 + List2->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
Acyclic[List2]
}}
}
run test20 for 3 expect 1
pred test18 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
Acyclic[List0]
}}
}
run test18 for 3 expect 0
