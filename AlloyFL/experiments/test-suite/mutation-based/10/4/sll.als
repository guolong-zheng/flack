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
pred test11 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node2->Node2
Acyclic[List1]
}}
}
run test11 for 3 expect 0
