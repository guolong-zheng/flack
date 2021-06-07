pred test4 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
}}
}
run test4 for 3 expect 0
pred test3 {
some disj Node0: Node {
no List
no header
Node = Node0
no link
}
}
run test3 for 3 expect 1
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
pred test8 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node1 + List1->Node0
Node = Node0 + Node1 + Node2
link = Node2->Node0 + Node2->Node1 + Node2->Node2
}}
}
run test8 for 3 expect 0
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
pred test13 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
Acyclic[List2]
}}
}
run test13 for 3 expect 1
pred test6 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
run test6 for 3 expect 1
pred test12 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1 + Node2->Node0
Acyclic[List1]
}}
}
run test12 for 3 expect 1
