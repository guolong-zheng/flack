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
pred test70 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-4 + Node1->-4 + Node2->-4
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,-3,True0]
}}}}}
}
run test70 for 3 expect 0
pred test68 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,7,True0]
}}}}}
}
run test68 for 3 expect 0
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
pred test33 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test33 for 3 expect 1
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
pred test16 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->7 + Node1->3 + Node2->4
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test16 for 3 expect 1
pred test14 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Loop[List0]
}}}}}
}
run test14 for 3 expect 1
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
pred test31 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->-5 + Node1->-7 + Node2->-7
True = True0
False = False0
Boolean = True0 + False0
Sorted[List0]
}}}}}
}
run test31 for 3 expect 0
pred test78 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
no link
elem = Node0->7 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test78 for 3 expect 0
pred test6 {
some disj List0: List {some disj Node0, Node1: Node {some disj True0, True1: True {some disj False0: False {some disj False0, True0, True1: Boolean {
List = List0
header = List0->Node1
Node = Node0 + Node1
link = Node1->Node0
elem = Node0->6 + Node1->5
True = True0 + True1
False = False0
Boolean = False0 + True0 + True1
}}}}}
}
run test6 for 3 expect 0
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
pred test37 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node2 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
RepOk[List0]
}}}}}
}
run test37 for 3 expect 0
