pred test72 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->1
col = Queen0->0
}
}
run test72 for 4 expect 0
pred test50 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->3
col = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test50 for 4 expect 1
pred test9 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->-3 + Queen0->-2 + Queen0->-1 + Queen0->1 + Queen0->2 + Queen0->3
}
}
run test9 for 4 expect 0
pred test64 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->1
}
}
run test64 for 4 expect 0
pred test46 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->0
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test46 for 4 expect 1
pred test32 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->3 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test32 for 4 expect 1
pred test75 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->4
}
}
run test75 for 4 expect 0
