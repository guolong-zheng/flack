pred test54 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->1
col = Queen0->3 + Queen1->2 + Queen2->1 + Queen3->0
valid[]
}
}
run test54 for 4 expect 1
pred test73 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->0 + Queen1->0
col = Queen0->1 + Queen1->0
}
}
run test73 for 4 expect 1
pred test4 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen1->-5 + Queen1->-1 + Queen1->0 + Queen1->1 + Queen1->2 + Queen1->3
col = Queen0->2 + Queen1->0 + Queen2->2
}
}
run test4 for 4 expect 0
pred test23 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->1 + Queen2->2 + Queen3->2
col = Queen0->3 + Queen1->2 + Queen2->2 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test23 for 4 expect 0
pred test24 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->3 + Queen2->0 + Queen3->2
col = Queen0->3 + Queen1->2 + Queen2->0 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test24 for 4 expect 1
pred test33 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->1 + Queen2->0
col = Queen0->0 + Queen1->0 + Queen2->2
nothreat[Queen2,Queen1]
}
}
run test33 for 4 expect 1
pred test50 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->3
col = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test50 for 4 expect 1
