pred test62 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->7 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->2 + Queen2->2
}
}
run test62 for 4 expect 0
pred test36 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->1 + Queen2->0
col = Queen0->2 + Queen1->1 + Queen2->0
nothreat[Queen2,Queen1]
}
}
run test36 for 4 expect 0
pred test41 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->3 + Queen3->0
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test41 for 4 expect 0
pred test57 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->5 + Queen1->6
col = Queen0->-7 + Queen1->-8
}
}
run test57 for 4 expect 0
pred test18 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->3 + Queen2->0 + Queen3->0
col = Queen0->3 + Queen1->1 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test18 for 4 expect 0
pred test17 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->2 + Queen2->2 + Queen3->3
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test17 for 4 expect 1
pred test48 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->2 + Queen3->0
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test48 for 4 expect 1
