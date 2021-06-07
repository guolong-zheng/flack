pred test21 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Person0 + Hilary0->Person1 + Person0->Jocelyn0 + Person1->Hilary0
shaken = Jocelyn0->Person1 + Person1->Jocelyn0
}}}
}
run test21 for 4 expect 1
pred test11 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Hilary0 + Hilary0->Jocelyn0 + Person0->Person1 + Person1->Person0
shaken = Jocelyn0->Person1 + Hilary0->Person0 + Person0->Hilary0 + Person1->Jocelyn0
Puzzle[]
}}}
}
run test11 for 4 expect 0
pred test32 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Person1 + Hilary0->Person0 + Person0->Hilary0 + Person1->Jocelyn0
shaken = Hilary0->Person1 + Person1->Hilary0
}}}
}
run test32 for 4 expect 1
pred test26 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0
spouse = Jocelyn0->Person0 + Hilary0->Person0 + Person0->Person0
no shaken
}}}
}
run test26 for 4 expect 0
pred test3 {
some disj Hilary0: Hilary {some disj Hilary0, Person0, Person1, Person2: Person {
no Jocelyn
Hilary = Hilary0
Person = Hilary0 + Person0 + Person1 + Person2
spouse = Hilary0->Person2 + Person0->Person1 + Person1->Person0 + Person2->Hilary0
no shaken
}}
}
run test3 for 4 expect 0
pred test15 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0, Person1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0 + Person1
spouse = Jocelyn0->Hilary0 + Hilary0->Jocelyn0 + Person0->Person1 + Person1->Person0
shaken = Jocelyn0->Person0 + Jocelyn0->Person1 + Hilary0->Person1 + Person0->Jocelyn0 + Person1->Jocelyn0 + Person1->Hilary0
Puzzle[]
}}}
}
run test15 for 4 expect 0
pred test8 {
some disj Jocelyn0: Jocelyn {some disj Hilary0, Hilary1: Hilary {some disj Jocelyn0, Person0, Hilary0, Hilary1: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0 + Hilary1
Person = Jocelyn0 + Person0 + Hilary0 + Hilary1
spouse = Jocelyn0->Hilary1 + Person0->Hilary0 + Hilary0->Person0 + Hilary1->Jocelyn0
shaken = Jocelyn0->Hilary0 + Person0->Hilary1 + Hilary0->Jocelyn0 + Hilary1->Person0
}}}
}
run test8 for 4 expect 0
pred test31 {
some disj Jocelyn0: Jocelyn {some disj Hilary0: Hilary {some disj Jocelyn0, Hilary0, Person0: Person {
Jocelyn = Jocelyn0
Hilary = Hilary0
Person = Jocelyn0 + Hilary0 + Person0
spouse = Jocelyn0->Jocelyn0 + Hilary0->Hilary0 + Person0->Person0
no shaken
}}}
}
run test31 for 4 expect 0
pred test5 {
some disj Jocelyn0, Jocelyn1: Jocelyn {some disj Hilary0: Hilary {some disj Hilary0, Person0, Jocelyn0, Jocelyn1: Person {
Jocelyn = Jocelyn0 + Jocelyn1
Hilary = Hilary0
Person = Hilary0 + Person0 + Jocelyn0 + Jocelyn1
spouse = Hilary0->Jocelyn1 + Person0->Jocelyn0 + Jocelyn0->Person0 + Jocelyn1->Hilary0
shaken = Hilary0->Jocelyn0 + Person0->Jocelyn1 + Jocelyn0->Hilary0 + Jocelyn1->Person0
}}}
}
run test5 for 4 expect 0
