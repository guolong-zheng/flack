pred test5 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
no header
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
run test5 for 3 expect 1
pred test14 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node1->Node0 + Node2->Node2
Acyclic[List1]
}}
}
run test14 for 3 expect 1
