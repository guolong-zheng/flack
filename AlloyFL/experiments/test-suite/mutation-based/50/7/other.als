pred test14 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0
}}}}}}
}
run test14 for 3 expect 1
pred test19 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0 + Room0->alas0 + Room0->peds0
CanEnter[Person0,Room0]
}}}}}}
}
run test19 for 3 expect 1
pred test3 {
some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
no Person
no member_of
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0 + Room0->alas0 + Room0->peds0
}}}}}
}
run test3 for 3 expect 1
pred test17 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0, Group0: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0 + Person0->Group0
alas = alas0
peds = peds0
Group = alas0 + peds0 + Group0
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0 + Room0->alas0 + Room0->peds0
CanEnter[Person0,Room0]
}}}}}}
}
run test17 for 3 expect 0
pred test16 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0, seclab1: seclab {some disj seclab0, seclab1, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0 + seclab1
Room = seclab0 + seclab1 + Room0
located_in = seclab1->alas0 + seclab1->peds0
}}}}}}
}
run test16 for 3 expect 0
pred test9 {
some disj Person0, Person1: Person {some disj peds0: peds {some disj peds0, Group0: Group {some disj seclab0: seclab {some disj seclab0, Room0, Room1: Room {
Person = Person0 + Person1
member_of = Person0->peds0 + Person1->peds0 + Person1->Group0
no alas
peds = peds0
Group = peds0 + Group0
seclab = seclab0
Room = seclab0 + Room0 + Room1
located_in = seclab0->peds0 + Room1->peds0
}}}}}
}
run test9 for 3 expect 0
pred test7 {
some disj Person0, Person1: Person {some disj peds0: peds {some disj peds0, Group0: Group {some disj seclab0: seclab {some disj seclab0: Room {
Person = Person0 + Person1
member_of = Person0->peds0 + Person1->peds0 + Person1->Group0
no alas
peds = peds0
Group = peds0 + Group0
seclab = seclab0
Room = seclab0
located_in = seclab0->peds0
}}}}}
}
run test7 for 3 expect 0
pred test6 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0 + Room0->alas0 + Room0->peds0
}}}}}}
}
run test6 for 3 expect 1
pred test4 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0: seclab {some disj seclab0: Room {
Person = Person0
no member_of
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0
Room = seclab0
located_in = seclab0->alas0 + seclab0->peds0
}}}}}}
}
run test4 for 3 expect 0
pred test11 {
some disj Person0, Person1: Person {some disj alas0: alas {some disj peds0, peds1: peds {some disj alas0, peds0, peds1: Group {some disj seclab0: seclab {some disj seclab0, Room0: Room {
Person = Person0 + Person1
member_of = Person0->peds0 + Person1->alas0 + Person1->peds1
alas = alas0
peds = peds0 + peds1
Group = alas0 + peds0 + peds1
seclab = seclab0
Room = seclab0 + Room0
located_in = seclab0->alas0 + seclab0->peds0 + seclab0->peds1 + Room0->alas0 + Room0->peds0
}}}}}}
}
run test11 for 3 expect 0
