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
