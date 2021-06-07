pred test3 {
some disj FSM0: FSM {some disj State0, State1: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1
transition = State1->State0
}}
}
run test3 for 3 expect 1
pred test15 {
some disj FSM0: FSM {some disj State0, State1, State2: State {
FSM = FSM0
start = FSM0->State2
stop = FSM0->State1
State = State0 + State1 + State2
transition = State0->State0 + State2->State0 + State2->State1
}}
}
run test15 for 3 expect 0
pred test10 {
some disj FSM0: FSM {some disj State0: State {
FSM = FSM0
start = FSM0->State0
stop = FSM0->State0
State = State0
no transition
}}
}
run test10 for 3 expect 0
pred test14 {
some disj FSM0: FSM {some disj State0, State1, State2: State {
FSM = FSM0
start = FSM0->State2
stop = FSM0->State1
State = State0 + State1 + State2
transition = State0->State1 + State2->State1
}}
}
run test14 for 3 expect 0
pred test13 {
some disj FSM0: FSM {some disj State0, State1: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1
no transition
}}
}
run test13 for 3 expect 0
pred test11 {
some disj FSM0: FSM {some disj State0, State1: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1
transition = State1->State0 + State1->State1
}}
}
run test11 for 3 expect 0
pred test9 {
some disj FSM0: FSM {some disj State0, State1: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1
transition = State0->State0 + State1->State0 + State1->State1
}}
}
run test9 for 3 expect 0
