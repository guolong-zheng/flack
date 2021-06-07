pred test63 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->-8
}
}
run test63 for 4 expect 0
pred test14 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->0
col = Queen0->2 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test14 for 4 expect 0
pred test21 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->0 + Queen2->2 + Queen3->0
col = Queen0->3 + Queen1->0 + Queen2->0 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test21 for 4 expect 1
pred test59 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->-8 + Queen2->-8
}
}
run test59 for 4 expect 0
pred test16 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->2 + Queen2->3 + Queen3->2
col = Queen0->3 + Queen1->1 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test16 for 4 expect 1
pred test71 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->6 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->2 + Queen2->2
}
}
run test71 for 4 expect 0
pred test9 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->-3 + Queen0->-2 + Queen0->-1 + Queen0->1 + Queen0->2 + Queen0->3
}
}
run test9 for 4 expect 0
