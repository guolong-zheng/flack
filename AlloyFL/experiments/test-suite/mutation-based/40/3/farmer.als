open util/ordering [State] as ord
pred test47 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Chicken0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State2->Grain0 + State3->Fox0 + State3->Chicken0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
}}}}}}
}
run test47 for 4 expect 0
pred test22 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State1->Chicken0 + State2->Chicken0 + State3->Farmer0 + State3->Chicken0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Grain0,Fox0 + Grain0,Fox0 + Chicken0 + Grain0,none]
}}}}}}
}
run test22 for 4 expect 0
pred test30 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Chicken0,Fox0 + Chicken0 + Grain0,Farmer0 + Fox0 + Chicken0 + Grain0]
}}}}}}
}
run test30 for 4 expect 1
pred test15 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State1->Chicken0 + State2->Chicken0 + State3->Farmer0 + State3->Chicken0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Grain0,none,Farmer0]
}}}}}}
}
run test15 for 4 expect 0
pred test53 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State0->Fox0 + State1->Farmer0 + State1->Fox0 + State1->Chicken0 + State2->Chicken0 + State3->Farmer0 + State3->Chicken0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
}}}}}}
}
run test53 for 4 expect 0
pred test49 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
}}}}}}
}
run test49 for 4 expect 1
pred test14 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Grain0,Fox0 + Grain0,Grain0,Fox0 + Chicken0]
}}}}}}
}
run test14 for 4 expect 0
pred test26 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Chicken0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State3->Fox0
far = State1->Farmer0 + State1->Fox0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Chicken0 + Grain0,Grain0,Fox0 + Chicken0 + Grain0,Farmer0 + Fox0 + Chicken0 + Grain0]
}}}}}}
}
run test26 for 4 expect 1
pred test6 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Chicken0 + State2->Farmer0 + State2->Chicken0
far = State1->Farmer0 + State1->Fox0 + State2->Fox0 + State3->Farmer0 + State3->Fox0 + State3->Chicken0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
}}}}}}
}
run test6 for 4 expect 1
pred test20 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Chicken0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State3->Chicken0
far = State1->Farmer0 + State1->Fox0 + State3->Farmer0 + State3->Fox0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0,Fox0,none,Farmer0]
}}}}}}
}
run test20 for 4 expect 1
pred test12 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Farmer0,none,Farmer0]
}}}}}}
}
run test12 for 4 expect 0
pred test42 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Fox0 + Grain0,Fox0 + Grain0,Farmer0 + Fox0]
}}}}}}
}
run test42 for 4 expect 0
pred test23 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Chicken0,none,Farmer0 + Fox0]
}}}}}}
}
run test23 for 4 expect 1
pred test16 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Chicken0 + Grain0,Chicken0,none,Farmer0]
}}}}}}
}
run test16 for 4 expect 1
pred test21 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Chicken0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State3->Fox0
far = State1->Farmer0 + State1->Fox0 + State3->Farmer0 + State3->Chicken0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Grain0,Fox0 + Grain0,none,Farmer0]
}}}}}}
}
run test21 for 4 expect 1
pred test55 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Farmer0 + State1->Grain0 + State2->Grain0 + State3->Fox0 + State3->Chicken0
far = State1->Fox0 + State1->Chicken0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State2->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
}}}}}}
}
run test55 for 4 expect 0
pred test37 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0
far = State1->Farmer0 + State3->Farmer0 + State3->Grain0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Farmer0 + Fox0 + Grain0,Fox0,none,Farmer0 + Grain0]
}}}}}}
}
run test37 for 4 expect 1
pred test11 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Grain0,Fox0,none,Farmer0 + Grain0]
}}}}}}
}
run test11 for 4 expect 1
pred test44 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State1->Grain0 + State2->Farmer0 + State2->Fox0 + State2->Chicken0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Chicken0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Grain0,none,none,Farmer0 + Grain0]
}}}}}}
}
run test44 for 4 expect 1
pred test38 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Grain0,Grain0,Fox0 + Grain0,Farmer0 + Fox0 + Grain0]
}}}}}}
}
run test38 for 4 expect 1
pred test34 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Chicken0 + State2->Farmer0 + State2->Chicken0
far = State1->Farmer0 + State1->Fox0 + State2->Fox0 + State3->Farmer0 + State3->Fox0 + State3->Chicken0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0 + Grain0,Fox0 + Grain0,Fox0 + Grain0,Farmer0 + Fox0 + Chicken0 + Grain0]
}}}}}}
}
run test34 for 4 expect 1
pred test43 {
some disj Farmer0: Farmer {some disj Fox0: Fox {some disj Chicken0: Chicken {some disj Grain0: Grain {some disj Farmer0, Fox0, Chicken0, Grain0: Object {some disj State0, State1, State2, State3: State {
Farmer = Farmer0
Fox = Fox0
Chicken = Chicken0
Grain = Grain0
Object = Farmer0 + Fox0 + Chicken0 + Grain0
eats = Fox0->Chicken0 + Chicken0->Grain0
State = State0 + State1 + State2 + State3
near = State0->Farmer0 + State0->Fox0 + State0->Chicken0 + State0->Grain0 + State1->Fox0 + State2->Farmer0 + State2->Fox0 + State2->Grain0 + State3->Fox0 + State3->Grain0
far = State1->Farmer0 + State1->Grain0 + State3->Farmer0
ord/first = State0
ord/next = State0->State1 + State1->State2 + State2->State3
crossRiver[Fox0 + Chicken0,Fox0,none,Farmer0 + Chicken0]
}}}}}}
}
run test43 for 4 expect 1
