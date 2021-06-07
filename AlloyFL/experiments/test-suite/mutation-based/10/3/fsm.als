pred test4 {
some disj FSM0: FSM {some disj State0, State1, State2: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1 + State2
transition = State1->State2 + State2->State0 + State2->State2
}}
}
run test4 for 3 expect 1
