pred test47 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->0
col = Queen0->0 + Queen1->0 + Queen2->2 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test47 for 4 expect 1
pred test39 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->3 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test39 for 4 expect 0
pred test8 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
no col
}
}
run test8 for 4 expect 0
pred test6 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->-7 + Queen1->1 + Queen1->6 + Queen2->-7 + Queen2->0 + Queen2->2 + Queen2->5
col = Queen0->1 + Queen1->1 + Queen2->1
}
}
run test6 for 4 expect 0
pred test72 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->1
col = Queen0->0
}
}
run test72 for 4 expect 0
pred test31 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->2 + Queen2->2 + Queen3->1
col = Queen0->3 + Queen1->2 + Queen2->2 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test31 for 4 expect 1
pred test18 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->3 + Queen2->0 + Queen3->0
col = Queen0->3 + Queen1->1 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test18 for 4 expect 0
pred test22 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->1 + Queen2->2 + Queen3->0
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test22 for 4 expect 1
pred test67 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->-5
col = Queen0->0
}
}
run test67 for 4 expect 0
pred test5 {
some disj Queen0: Queen {
Queen = Queen0
no row
col = Queen0->0
}
}
run test5 for 4 expect 0
pred test7 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->1 + Queen2->0 + Queen3->0
col = Queen0->-2 + Queen0->-1 + Queen0->1 + Queen0->5 + Queen1->-6 + Queen1->-1 + Queen1->3 + Queen1->4 + Queen2->-6 + Queen2->-1 + Queen2->0 + Queen2->7 + Queen3->-3 + Queen3->-1 + Queen3->0 + Queen3->7
}
}
run test7 for 4 expect 0
pred test12 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->3
col = Queen0->1 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test12 for 4 expect 0
pred test56 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->1 + Queen1->0
col = Queen0->1 + Queen1->0
valid[]
}
}
run test56 for 4 expect 0
pred test37 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->0 + Queen2->1 + Queen3->0
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test37 for 4 expect 1
pred test13 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->2 + Queen2->2 + Queen3->3
col = Queen0->2 + Queen1->1 + Queen2->3 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test13 for 4 expect 0
pred test20 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->2 + Queen2->0
col = Queen0->2 + Queen1->0 + Queen2->1
nothreat[Queen2,Queen1]
}
}
run test20 for 4 expect 1
pred test62 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->7 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->2 + Queen2->2
}
}
run test62 for 4 expect 0
pred test74 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->3
}
}
run test74 for 4 expect 0
pred test51 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->1 + Queen2->1 + Queen3->0
col = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test51 for 4 expect 1
pred test55 {

no Queen
no row
no col
valid[]

}
run test55 for 4 expect 1
pred test59 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->-8 + Queen2->-8
}
}
run test59 for 4 expect 0
pred test48 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->2 + Queen3->0
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test48 for 4 expect 1
pred test9 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->-3 + Queen0->-2 + Queen0->-1 + Queen0->1 + Queen0->2 + Queen0->3
}
}
run test9 for 4 expect 0
pred test1 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->0 + Queen1->0
col = Queen0->0 + Queen1->0
}
}
run test1 for 4 expect 1
pred test35 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->2 + Queen3->3
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test35 for 4 expect 1
pred test66 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->0
}
}
run test66 for 4 expect 1
pred test32 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->3 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test32 for 4 expect 1
pred test61 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->-4
col = Queen0->0
}
}
run test61 for 4 expect 0
pred test19 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->2 + Queen3->1
col = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test19 for 4 expect 1
pred test70 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->4 + Queen1->4 + Queen2->4 + Queen3->3
col = Queen0->1 + Queen1->1 + Queen2->1 + Queen3->1
}
}
run test70 for 4 expect 0
pred test3 {

no Queen
no row
no col

}
run test3 for 4 expect 1
pred test71 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->6 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->2 + Queen2->2
}
}
run test71 for 4 expect 0
pred test16 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->2 + Queen2->3 + Queen3->2
col = Queen0->3 + Queen1->1 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test16 for 4 expect 1
pred test49 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->0 + Queen1->2 + Queen2->0
col = Queen0->1 + Queen1->1 + Queen2->0
nothreat[Queen2,Queen1]
}
}
run test49 for 4 expect 1
pred test65 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->0 + Queen2->0
col = Queen0->0 + Queen1->0 + Queen2->0
}
}
run test65 for 4 expect 1
pred test45 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test45 for 4 expect 1
pred test46 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->0 + Queen2->3 + Queen3->0
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test46 for 4 expect 1
pred test42 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->0 + Queen3->3
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->3
nothreat[Queen3,Queen2]
}
}
run test42 for 4 expect 1
pred test60 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->6 + Queen2->5
col = Queen0->2 + Queen1->1 + Queen2->1
}
}
run test60 for 4 expect 0
pred test52 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->0 + Queen1->0
col = Queen0->1 + Queen1->0
valid[]
}
}
run test52 for 4 expect 0
pred test36 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->1 + Queen2->0
col = Queen0->2 + Queen1->1 + Queen2->0
nothreat[Queen2,Queen1]
}
}
run test36 for 4 expect 0
pred test73 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->0 + Queen1->0
col = Queen0->1 + Queen1->0
}
}
run test73 for 4 expect 1
pred test33 {
some disj Queen0, Queen1, Queen2: Queen {
Queen = Queen0 + Queen1 + Queen2
row = Queen0->2 + Queen1->1 + Queen2->0
col = Queen0->0 + Queen1->0 + Queen2->2
nothreat[Queen2,Queen1]
}
}
run test33 for 4 expect 1
pred test21 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->2 + Queen1->0 + Queen2->2 + Queen3->0
col = Queen0->3 + Queen1->0 + Queen2->0 + Queen3->1
nothreat[Queen3,Queen2]
}
}
run test21 for 4 expect 1
pred test29 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->3
col = Queen0->2 + Queen1->1 + Queen2->2 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test29 for 4 expect 0
pred test38 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->0 + Queen1->2 + Queen2->2 + Queen3->3
col = Queen0->2 + Queen1->0 + Queen2->0 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test38 for 4 expect 1
pred test28 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->2 + Queen2->0 + Queen3->2
col = Queen0->0 + Queen1->0 + Queen2->1 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test28 for 4 expect 1
pred test10 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->0 + Queen3->0
col = Queen0->0 + Queen1->0 + Queen2->2 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test10 for 4 expect 0
pred test53 {
some disj Queen0: Queen {
Queen = Queen0
row = Queen0->0
col = Queen0->0
valid[]
}
}
run test53 for 4 expect 1
pred test69 {
some disj Queen0, Queen1: Queen {
Queen = Queen0 + Queen1
row = Queen0->6 + Queen1->5
col = Queen0->0 + Queen1->0
}
}
run test69 for 4 expect 0
pred test15 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->1 + Queen2->2 + Queen3->1
col = Queen0->1 + Queen1->0 + Queen2->1 + Queen3->2
nothreat[Queen3,Queen2]
}
}
run test15 for 4 expect 0
pred test41 {
some disj Queen0, Queen1, Queen2, Queen3: Queen {
Queen = Queen0 + Queen1 + Queen2 + Queen3
row = Queen0->3 + Queen1->0 + Queen2->3 + Queen3->0
col = Queen0->2 + Queen1->0 + Queen2->3 + Queen3->0
nothreat[Queen3,Queen2]
}
}
run test41 for 4 expect 0
