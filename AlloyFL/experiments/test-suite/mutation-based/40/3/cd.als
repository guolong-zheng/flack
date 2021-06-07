pred test22 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ClassHierarchy[]
}}
}
run test22 for 3 expect 0
pred test19 {
some disj Object0: Object {some disj Object0, Class0, Class1: Class {
Object = Object0
Class = Object0 + Class0 + Class1
ext = Class0->Object0 + Class1->Object0
AllExtObject[]
}}
}
run test19 for 3 expect 1
pred test2 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Object0 + Class0->Class0
}}
}
run test2 for 3 expect 0
pred test18 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
AllExtObject[]
}}
}
run test18 for 3 expect 0
pred test6 {
some disj Object0, Object1: Object {some disj Class0, Object0, Object1: Class {
Object = Object0 + Object1
Class = Class0 + Object0 + Object1
ext = Class0->Object1 + Object0->Object0 + Object1->Class0
}}
}
run test6 for 3 expect 0
pred test3 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
}}
}
run test3 for 3 expect 1
pred test12 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Object0
Acyclic[]
}}
}
run test12 for 3 expect 0
pred test24 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
ClassHierarchy[]
}}
}
run test24 for 3 expect 0
pred test13 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
Acyclic[]
}}
}
run test13 for 3 expect 1
pred test16 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
AllExtObject[]
}}
}
run test16 for 3 expect 0
