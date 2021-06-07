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
pred test2 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Object0 + Class0->Class0
}}
}
run test2 for 3 expect 0
pred test14 {
some disj Object0: Object {some disj Object0: Class {
Object = Object0
Class = Object0
no ext
Acyclic[]
}}
}
run test14 for 3 expect 1
pred test9 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
ObjectNoExt[]
}}
}
run test9 for 3 expect 1
pred test11 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Object0 + Class0->Class0
Acyclic[]
}}
}
run test11 for 3 expect 0
pred test1 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
}}
}
run test1 for 3 expect 1
pred test10 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Class0
Acyclic[]
}}
}
run test10 for 3 expect 0
pred test24 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
no ext
ClassHierarchy[]
}}
}
run test24 for 3 expect 0
pred test23 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Class0->Class0
ClassHierarchy[]
}}
}
run test23 for 3 expect 0
pred test15 {
some disj Object0: Object {some disj Object0, Class0, Class1: Class {
Object = Object0
Class = Object0 + Class0 + Class1
ext = Object0->Class1 + Class0->Class1 + Class1->Class0
Acyclic[]
}}
}
run test15 for 3 expect 0
pred test25 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0
ObjectNoExt[]
}}
}
run test25 for 3 expect 0
pred test12 {
some disj Object0: Object {some disj Object0, Class0: Class {
Object = Object0
Class = Object0 + Class0
ext = Object0->Class0 + Class0->Object0
Acyclic[]
}}
}
run test12 for 3 expect 0
pred test17 {
some disj Object0: Object {some disj Object0: Class {
Object = Object0
Class = Object0
no ext
AllExtObject[]
}}
}
run test17 for 3 expect 1
