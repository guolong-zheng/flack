pred test21 {
some disj Object0: Object {some disj Object0, Class0, Class1: Class {
Object = Object0
Class = Object0 + Class0 + Class1
ext = Class0->Class1 + Class1->Object0
AllExtObject[]
}}
}
run test21 for 3 expect 1
pred test16 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
AllExtObject[]
}}
}
run test16 for 3 expect 0
pred test23 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
ClassHierarchy[]
}}
}
run test23 for 3 expect 0
pred test4 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Object0->Class0 + Class0->Object0 + Class0->Class0
}}
}
run test4 for 3 expect 0
pred test22 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ClassHierarchy[]
}}
}
run test22 for 3 expect 0
pred test9 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
ObjectNoExt[]
}}
}
run test9 for 3 expect 1
pred test12 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Object0
Acyclic[]
}}
}
run test12 for 3 expect 0
pred test8 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ObjectNoExt[]
}}
}
run test8 for 3 expect 0
pred test25 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0
ObjectNoExt[]
}}
}
run test25 for 3 expect 0
pred test18 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
AllExtObject[]
}}
}
run test18 for 3 expect 0
