pred test14 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element0 + Array0->0->Element1
length = Array0->4
NoConflict[]
}}
}
run test14 for 3 expect 0
pred test4 {

no Element
no Array
no i2e
no length

}
run test4 for 3 expect 0
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
pred test15 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->-8->Element0 + Array0->-7->Element0 + Array0->-6->Element0 + Array0->-5->Element0 + Array0->-4->Element0 + Array0->-3->Element0 + Array0->-2->Element0 + Array0->-1->Element0 + Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element0 + Array0->6->Element0 + Array0->7->Element0
length = Array0->-8
}}
}
run test15 for 3 expect 0
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
pred test33 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->6->Element0
length = Array0->0
}}
}
run test33 for 3 expect 0
pred test6 {
some disj Element0, Element1, Element2: Element {some disj Array0, Array1: Array {
Element = Element0 + Element1 + Element2
Array = Array0 + Array1
i2e = Array0->0->Element2 + Array0->1->Element1 + Array0->2->Element0 + Array0->2->Element2 + Array0->3->Element0 + Array0->3->Element2 + Array0->4->Element0 + Array0->4->Element2 + Array0->5->Element0 + Array0->5->Element2 + Array1->1->Element0 + Array1->1->Element1 + Array1->3->Element1
length = Array0->6 + Array1->0
}}
}
run test6 for 3 expect 0
pred test36 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->-1
}
}
run test36 for 3 expect 0
pred test34 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->1->Element0
length = Array0->1
}}
}
run test34 for 3 expect 0
pred test1 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0 + Array0->4->Element0 + Array0->5->Element0 + Array0->6->Element0
length = Array0->7
}}
}
run test1 for 3 expect 1
