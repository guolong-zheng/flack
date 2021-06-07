pred test12 {
some disj FSM0: FSM {some disj State0, State1: State {
FSM = FSM0
start = FSM0->State1
stop = FSM0->State0
State = State0 + State1
transition = State0->State0 + State1->State0
}}
}
run test12 for 3 expect 0
