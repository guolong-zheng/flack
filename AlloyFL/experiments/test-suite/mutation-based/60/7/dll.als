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
pred test30 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-3 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test30 for 3 expect 1
pred test33 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
pre = Node0->Node0
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
ConsistentPreAndNxt[]
}}
}
run test33 for 3 expect 0
pred test9 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->6 + Node1->5
}}
}
run test9 for 3 expect 1
pred test22 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-8 + Node1->0
Sorted[]
}}
}
run test22 for 3 expect 0
pred test34 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
ConsistentPreAndNxt[]
}}
}
run test34 for 3 expect 0
pred test3 {
some disj DLL0, DLL1: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0 + DLL1
header = DLL1->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node0->Node1 + Node2->Node0
elem = Node0->6 + Node1->5 + Node2->4
}}
}
run test3 for 3 expect 0
pred test46 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node0->Node1 + Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test46 for 3 expect 0
pred test8 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node0
Node = Node0 + Node1
pre = Node1->Node0 + Node1->Node1
nxt = Node0->Node1
elem = Node0->6 + Node1->7
}}
}
run test8 for 3 expect 0
pred test13 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node1->-8 + Node1->-7 + Node1->-1
}}
}
run test13 for 3 expect 0
pred test14 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-6 + Node1->-6
UniqueElem[]
}}
}
run test14 for 3 expect 0
pred test1 {

no DLL
no header
no Node
no pre
no nxt
no elem

}
run test1 for 3 expect 0
pred test11 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-8 + Node0->-7 + Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node0->4
}}
}
run test11 for 3 expect 0
pred test19 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->6 + Node1->7
UniqueElem[]
}}
}
run test19 for 3 expect 1
pred test6 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node0 + DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test6 for 3 expect 0
pred test28 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-7 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test28 for 3 expect 1
