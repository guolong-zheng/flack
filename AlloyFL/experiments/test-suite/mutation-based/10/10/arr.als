pred test36 {
some disj Array0: Array {
no Element
Array = Array0
no i2e
length = Array0->-1
}
}
run test36 for 3 expect 0
pred test28 {
some disj Element0: Element {some disj Array0: Array {
Element = Element0
Array = Array0
i2e = Array0->0->Element0 + Array0->1->Element0 + Array0->2->Element0 + Array0->3->Element0
length = Array0->4
}}
}
run test28 for 3 expect 1
pred test7 {
some disj Element0, Element1: Element {some disj Array0: Array {
Element = Element0 + Element1
Array = Array0
i2e = Array0->0->Element1 + Array0->1->Element0
length = Array0->-3 + Array0->0 + Array0->6
}}
}
run test7 for 3 expect 0
