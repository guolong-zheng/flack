pred test28 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0
length = Array0->4
}}
}
run test28 for 3 expect 1
pred test34 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->1->Element0
length = Array0->1
}}
}
run test34 for 3 expect 0
pred test20 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0 + Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element0 + Array0->6->Element0 + Array0->7->Element0
length = Array0->1
}}
}
run test20 for 3 expect 0
pred test18 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->-6
}
}
run test18 for 3 expect 0
pred test16 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->-4
}
}
run test16 for 3 expect 0
pred test3 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->0
}
}
run test3 for 3 expect 1
pred test12 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0 + Array0->1->Element0
length = Array0->3
NoConflict[]
}}
}
run test12 for 3 expect 1
pred test33 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->6->Element0
length = Array0->0
}}
}
run test33 for 3 expect 0
pred test25 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0 + Array0->2->Element0
length = Array0->3
}}
}
run test25 for 3 expect 1
pred test2 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->2->Element0 + Array0->4->Element0 + Array0->6->Element0
length = Array0->7
}}
}
run test2 for 3 expect 1
pred test38 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0
length = Array0->2
NoConflict[]
}}
}
run test38 for 3 expect 1
