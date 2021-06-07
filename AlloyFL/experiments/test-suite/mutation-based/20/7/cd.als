pred test18 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
AllExtObject[]
}}
}
run test18 for 3 expect 0
pred test21 {
some disj Object0: Object {some disj Object0, Class0, Class1: Class {
Object = Object0
Class = Object0 + Class0 + Class1
ext = Class0->Class1 + Class1->Object0
AllExtObject[]
}}
}
run test21 for 3 expect 1
pred test13 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
Acyclic[]
}}
}
run test13 for 3 expect 1
pred test8 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ObjectNoExt[]
}}
}
run test8 for 3 expect 0
pred test3 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
}}
}
run test3 for 3 expect 1
