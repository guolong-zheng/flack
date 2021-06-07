pred test19 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1
Acyclic[List0]
}}
}
run test19 for 3 expect 1
pred test22 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1 + Node2->Node0
Acyclic[List0]
}}
}
run test22 for 3 expect 1
