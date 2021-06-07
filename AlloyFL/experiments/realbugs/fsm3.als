one sig FSM {
  start: set State,
  stop: set State
}

sig State {
  transition: set State
}

// Part (a)
fact OneStartAndStop {
  // FSM only has one start state.
  one FSM.start

  // FSM only has one stop state.
  one FSM.stop
}

// Part (b)
fact ValidStartAndStop {
  // The start state is different from the stop state.
  no FSM.start & FSM.stop

  // No transition ends at the start state.
  all s: State | FSM.start !in s.^transition

  // No transition begins at the stop state.
  all s: State | FSM.stop !in s.~transition
}

// Part (c)
fact Reachability {
  // All states are reachable from the start state.
  State = FSM.start.*transition

  // The stop state is reachable from any state.
  // Fix: all n: State | FSM.stop in n.*transition 
  FSM.stop = State.*transition.^transition
}

run {} for 5