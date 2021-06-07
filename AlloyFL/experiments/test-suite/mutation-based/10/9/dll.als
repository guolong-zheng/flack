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
pred test15 {
some disj DLL0: DLL {some disj Node0, Node1: Node {
DLL = DLL0
header = DLL0->Node1
Node = Node0 + Node1
no pre
nxt = Node1->Node0
elem = Node0->2 + Node1->2
UniqueElem[]
}}
}
run test15 for 3 expect 0
