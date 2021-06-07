pred test8 {
some disj FSM0: FSM {some disj State0, State1, State2: State {
FSM = FSM0
start = FSM0->State2
no stop
State = State0 + State1 + State2
transition = State1->State1 + State2->State0 + State2->State1
}}
}
run test8 for 3 expect 0
