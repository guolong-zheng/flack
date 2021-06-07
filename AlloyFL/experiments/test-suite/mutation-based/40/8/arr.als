pred test11 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->1->Element0
length = Array0->5
NoConflict[]
}}
}
run test11 for 3 expect 1
pred test18 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->-6
}
}
run test18 for 3 expect 0
pred test25 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0 + Array0->2->Element0
length = Array0->3
}}
}
run test25 for 3 expect 1
pred test22 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0
length = Array0->0
}}
}
run test22 for 3 expect 0
pred test30 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->4->Element0 + Array0->5->Element0
length = Array0->3
}}
}
run test30 for 3 expect 0
pred test24 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->3->Element0
length = Array0->4
}}
}
run test24 for 3 expect 1
pred test19 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0 + Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element0 + Array0->6->Element0 + Array0->7->Element0
length = Array0->0
}}
}
run test19 for 3 expect 0
pred test28 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0
length = Array0->4
}}
}
run test28 for 3 expect 1
pred test15 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0 + Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element0 + Array0->6->Element0 + Array0->7->Element0
length = Array0->-8
}}
}
run test15 for 3 expect 0
pred test10 {
some disj Element0, Element1, Element2: Element {some disj Array0: Array {
Element = Element0 + Element1 + Element2
Array = Array0
i2e = Array0->0->Element0 + Array0->0->Element1 + Array0->0->Element2
length = Array0->5
NoConflict[]
}}
}
run test10 for 3 expect 0
pred test37 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0
length = Array0->0
}}
}
run test37 for 3 expect 0
pred test3 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->0
}
}
run test3 for 3 expect 1
pred test4 {

no Element
no Array
no i2e
no length

}
run test4 for 3 expect 0
pred test26 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0 + Array0->2->Element1 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element1 + Array0->6->Element0
length = Array0->7
}}
}
run test26 for 3 expect 1
pred test17 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0 + Array0->7->Element0
length = Array0->0
}}
}
run test17 for 3 expect 0
