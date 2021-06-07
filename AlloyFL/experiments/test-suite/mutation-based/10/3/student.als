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
pred test77 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
no link
elem = Node0->4 + Node0->5 + Node0->6 + Node1->3 + Node2->-8 + Node2->-7 + Node2->-6 + Node2->-5 + Node2->-4 + Node2->-3 + Node2->-2 + Node2->-1 + Node2->0 + Node2->1 + Node2->2 + Node2->4 + Node2->5 + Node2->6
True = True0
False = False0
Boolean = True0 + False0
}}}}}
}
run test77 for 3 expect 0
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
pred test49 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Count[List0,6,-5]
}}}}}
}
run test49 for 3 expect 0
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
pred test66 {
some disj List0: List {some disj Node0, Node1, Node2: Node {some disj True0: True {some disj False0: False {some disj True0, False0: Boolean {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node0 + Node1->Node0 + Node2->Node1
elem = Node0->6 + Node1->6 + Node2->5
True = True0
False = False0
Boolean = True0 + False0
Contains[List0,6,True0]
}}}}}
}
run test66 for 3 expect 1
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
