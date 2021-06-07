pred test11 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
Acyclic[]
}}
}
run test11 for 3 expect 0
pred test25 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0
ObjectNoExt[]
}}
}
run test25 for 3 expect 0
