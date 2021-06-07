pred test15 {
some disj Person0: Person {some disj alas0: alas {some disj peds0: peds {some disj alas0, peds0: Group {some disj seclab0, seclab1: seclab {some disj seclab0, seclab1, Room0: Room {
Person = Person0
member_of = Person0->alas0 + Person0->peds0
alas = alas0
peds = peds0
Group = alas0 + peds0
seclab = seclab0 + seclab1
Room = seclab0 + seclab1 + Room0
located_in = seclab0->peds0 + seclab1->alas0 + Room0->peds0
}}}}}}
}
run test15 for 3 expect 0
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
