pred test19 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Red0 + Node1->Red0 + Node2->Red0
}}}}
}
run test19 for 3 expect 1
pred test11 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
no color
}}}}
}
run test11 for 3 expect 0
pred test3 {
some disj Red0, Red1: Red {some disj Blue0: Blue {some disj Blue0, Red0, Red1: Color {some disj Node0, Node1, Node2: Node {
Red = Red0 + Red1
Blue = Blue0
Color = Blue0 + Red0 + Red1
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Red1 + Node1->Red0 + Node2->Red0
}}}}
}
run test3 for 3 expect 0
pred test16 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
no neighbors
color = Node0->Red0 + Node1->Red0
}}}}
}
run test16 for 3 expect 0
pred test5 {
some disj Red0: Red {some disj Blue0, Blue1: Blue {some disj Red0, Blue0, Blue1: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0 + Blue1
Color = Red0 + Blue0 + Blue1
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue1 + Node1->Blue0 + Node2->Blue0
}}}}
}
run test5 for 3 expect 0
pred test1 {
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
color = Node0->Blue0
}}}}
}
run test1 for 3 expect 1
