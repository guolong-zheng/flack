pred test12 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
no elem
}}
}
run test12 for 3 expect 0
pred test44 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node1 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-7 + Node1->-8 + Node2->0
RepOk[]
}}
}
run test44 for 3 expect 0
pred test41 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node0
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-2 + Node1->-7 + Node2->-8
RepOk[]
}}
}
run test41 for 3 expect 0
pred test25 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->3 + Node2->7
Sorted[]
}}
}
run test25 for 3 expect 0
pred test38 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node2 + Node1->Node0
nxt = Node0->Node1 + Node2->Node0
elem = Node0->4 + Node1->3 + Node2->-2
ConsistentPreAndNxt[]
}}
}
run test38 for 3 expect 1
pred test2 {
some disj DLL0, DLL1: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0 + DLL1
header = DLL1->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node0->Node1 + Node2->Node0
elem = Node0->6 + Node1->5 + Node2->0
}}
}
run test2 for 3 expect 0
pred test48 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node0->Node0 + Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test48 for 3 expect 0
pred test35 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
pre = Node0->Node1 + Node1->Node0
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
ConsistentPreAndNxt[]
}}
}
run test35 for 3 expect 0
pred test16 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
UniqueElem[]
}}
}
run test16 for 3 expect 1
pred test40 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node2 + Node1->Node0
nxt = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->-7 + Node2->-8
ConsistentPreAndNxt[]
}}
}
run test40 for 3 expect 1
pred test37 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node2 + Node1->Node0
nxt = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->5 + Node2->4
ConsistentPreAndNxt[]
}}
}
run test37 for 3 expect 1
pred test49 {
some disj DLL0: DLL {some disj Node0: Node {
DLL = DLL0
header = DLL0->Node0
Node = Node0
pre = Node0->Node0
no nxt
elem = Node0->5
}}
}
run test49 for 3 expect 1
pred test29 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test29 for 3 expect 1
pred test17 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->7 + Node1->7
UniqueElem[]
}}
}
run test17 for 3 expect 0
