pred test11 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
Acyclic[]
}}
}
run test11 for 3 expect 0
pred test15 {
some disj Object0: Object {some disj Object0, Class0, Class1: Class {
Object = Object0
Class = Object0 + Class0 + Class1
ext = Object0->Class1 + Class0->Class1 + Class1->Class0
Acyclic[]
}}
}
run test15 for 3 expect 0
pred test24 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
ClassHierarchy[]
}}
}
run test24 for 3 expect 0
pred test3 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
}}
}
run test3 for 3 expect 1
pred test14 {
some disj Object0: Object {some disj Object0: Class {
Object = Object0
Class = Object0
no ext
Acyclic[]
}}
}
run test14 for 3 expect 1
pred test20 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Object0
AllExtObject[]
}}
}
run test20 for 3 expect 1
pred test17 {
some disj Object0: Object {some disj Object0: Class {
Object = Object0
Class = Object0
no ext
AllExtObject[]
}}
}
run test17 for 3 expect 1
