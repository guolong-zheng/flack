pred test8 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ObjectNoExt[]
}}
}
run test8 for 3 expect 0
pred test22 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
ClassHierarchy[]
}}
}
run test22 for 3 expect 0
pred test23 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
ClassHierarchy[]
}}
}
run test23 for 3 expect 0
pred test6 {
some disj Object0, Object1: Object {some disj Class0, Object0, Object1: Class {
Object = Object0 + Object1
Class = Class0 + Object0 + Object1
ext = Class0->Object1 + Object0->Object0 + Object1->Class0
}}
}
run test6 for 3 expect 0
pred test20 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Object0
AllExtObject[]
}}
}
run test20 for 3 expect 1
