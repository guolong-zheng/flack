pred test32 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-7 + Node1->-8 + Node2->-7
Sorted[]
}}
}
run test32 for 3 expect 0
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
pred test23 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-6 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test23 for 3 expect 1
pred test24 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-4 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test24 for 3 expect 1
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
pred test45 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node0 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->-7 + Node2->-8
RepOk[]
}}
}
run test45 for 3 expect 0
pred test18 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->7 + Node1->6
UniqueElem[]
}}
}
run test18 for 3 expect 1
pred test36 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
pre = Node0->Node1
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
ConsistentPreAndNxt[]
}}
}
run test36 for 3 expect 1
pred test21 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-1 + Node1->-1
UniqueElem[]
}}
}
run test21 for 3 expect 0
pred test20 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-5 + Node1->-2
UniqueElem[]
}}
}
run test20 for 3 expect 1
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
pred test5 {
some disj DLL0: DLL {
DLL = DLL0
no header
no Node
no pre
no nxt
no elem
}
}
run test5 for 3 expect 1
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
pred test1 {

no DLL
no header
no Node
no pre
no nxt
no elem

}
run test1 for 3 expect 0
pred test39 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node2 + Node1->Node0
nxt = Node0->Node1 + Node2->Node0
elem = Node0->5 + Node1->4 + Node2->5
ConsistentPreAndNxt[]
}}
}
run test39 for 3 expect 1
pred test10 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->5 + Node1->6
}}
}
run test10 for 3 expect 1
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
pred test43 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node1 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-7 + Node1->-7 + Node2->-8
RepOk[]
}}
}
run test43 for 3 expect 0
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
pred test4 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node0 + DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node0->Node1
elem = Node0->7 + Node1->6
}}
}
run test4 for 3 expect 0
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
pred test27 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test27 for 3 expect 1
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
pred test47 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->-7 + Node1->-8
}}
}
run test47 for 3 expect 1
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
pred test26 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
no pre
nxt = Node1->Node0 + Node2->Node1
elem = Node0->0 + Node1->-7 + Node2->-8
Sorted[]
}}
}
run test26 for 3 expect 1
pred test42 {
some disj DLL0: DLL {some disj Node0, Node1, Node2: Node {
DLL = DLL0
header = DLL0->Node2
Node = Node0 + Node1 + Node2
pre = Node0->Node0 + Node1->Node2
nxt = Node1->Node0 + Node2->Node1
elem = Node0->-2 + Node1->-7 + Node2->-8
RepOk[]
}}
}
run test42 for 3 expect 0
