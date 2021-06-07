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
pred test7 {
some disj FSM0: FSM {some disj State0, State1, State2: State {
FSM = FSM0
start = FSM0->State1 + FSM0->State2
stop = FSM0->State0
State = State0 + State1 + State2
transition = State1->State0 + State2->State0
}}
}
run test7 for 3 expect 0
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
