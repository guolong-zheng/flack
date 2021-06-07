pred test56 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-6 + Node1->-6 + Node2->-6
True = True0
False = False0
Boolean = True0 + False0
Count[List0,-7,3]
}}}}}
}
run test56 for 3 expect 0
pred test39 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
RepOk[List0]
}}}}}
}
run test39 for 3 expect 0
pred test52 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,5,1]
}}}}}
}
run test52 for 3 expect 1
pred test27 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->-5 + Node2->-5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test27 for 3 expect 1
pred test5 {
some disj List0: List {some disj Node0, Node1: Node {some disj False0: False {some disj False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->6 + Node1->5
no True
False = False0
Boolean = False0
}}}}
}
run test5 for 3 expect 0
pred test81 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->7 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test81 for 3 expect 1
pred test10 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test10 for 3 expect 1
pred test55 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,4,3]
}}}}}
}
run test55 for 3 expect 0
pred test80 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->-7 + Node0->-6 + Node0->-5 + Node0->-4 + Node0->-3 + Node0->-2 + Node0->-1 + Node0->0 + Node0->1 + Node0->2 + Node0->3 + Node0->4 + Node0->5 + Node0->6 + Node0->7 + Node1->-8 + Node1->6 + Node1->7
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test80 for 3 expect 0
pred test29 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test29 for 3 expect 1
pred test43 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,7,0]
}}}}}
}
run test43 for 3 expect 0
pred test84 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->5 + Node1->4
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test84 for 3 expect 1
pred test46 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->0 + Node1->0 + Node2->-8
True = True0
False = False0
Boolean = True0 + False0
Count[List0,0,1]
}}}}}
}
run test46 for 3 expect 0
pred test71 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
link = Node0->Node0
elem = Node0->3
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-7,False0]
}}}}}
}
run test71 for 3 expect 1
pred test36 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test36 for 3 expect 0
pred test82 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->6 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test82 for 3 expect 1
pred test30 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->5 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test30 for 3 expect 0
pred test26 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test26 for 3 expect 0
pred test62 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,7,False0]
}}}}}
}
run test62 for 3 expect 1
pred test65 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,6,False0]
}}}}}
}
run test65 for 3 expect 0
pred test73 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->-8 + Node2->-8
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,6,True0]
}}}}}
}
run test73 for 3 expect 0
pred test24 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node2->Node0
elem = Node0->5 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test24 for 3 expect 0
pred test38 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
RepOk[List0]
}}}}}
}
run test38 for 3 expect 0
pred test1 {
some disj List0: List {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
no header
no Node
no link
no elem
True = True0
False = False0
Boolean = True0 + False0
}}}}
}
run test1 for 3 expect 1
pred test21 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test21 for 3 expect 1
pred test75 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,7,False0]
}}}}}
}
run test75 for 3 expect 1
pred test51 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,6,2]
}}}}}
}
run test51 for 3 expect 1
pred test13 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test13 for 3 expect 0
pred test18 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test18 for 3 expect 0
pred test44 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,5,0]
}}}}}
}
run test44 for 3 expect 0
pred test34 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node0 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test34 for 3 expect 1
pred test87 {
some disj List0: List {some disj Node0: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0
Node = Node0
no link
elem = Node0->6 + Node0->7
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test87 for 3 expect 0
pred test63 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,6,True0]
}}}}}
}
run test63 for 3 expect 1
pred test83 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test83 for 3 expect 1
pred test22 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test22 for 3 expect 0
pred test40 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
RepOk[List0]
}}}}}
}
run test40 for 3 expect 0
pred test79 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0 + Node1->Node1
elem = Node0->5 + Node1->4
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test79 for 3 expect 0
pred test67 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,5,True0]
}}}}}
}
run test67 for 3 expect 1
pred test15 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->3 + Node2->4
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test15 for 3 expect 1
pred test60 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,7,False0]
}}}}}
}
run test60 for 3 expect 0
pred test48 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,7,7]
}}}}}
}
run test48 for 3 expect 0
pred test61 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node0->Node0 + Node1->Node0
elem = Node0->6 + Node1->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,7,True0]
}}}}}
}
run test61 for 3 expect 0
pred test53 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,6,1]
}}}}}
}
run test53 for 3 expect 1
