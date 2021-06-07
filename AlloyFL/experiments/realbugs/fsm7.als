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
  -- TODO: Your code starts here.
	#FSM.start = 1

  // FSM only has one stop state.
  -- TODO: Your code starts here.
	#FSM.stop = 1
}

// Part (b)
fact ValidStartAndStop {
  // The start state is different from the stop state.
  -- TODO: Your code starts here.
	FSM.start != FSM.stop

  // No transition ends at the start state.
  -- TODO: Your code starts here.
  // Fix: #transition.(FSM.start) = 0
	#FSM.start.transition != 0

  // No transition begins at the stop state.
  -- TODO: Your code starts here.
	#FSM.stop.transition = 0
}

// Part (c)
fact Reachability {
  // All states are reachable from the start state.
  -- TODO: Your code starts here.
	State in FSM.start.*transition

  // The stop state is reachable from any state.
  -- TODO: Your code starts here.
  // Fix: all n: State | FSM.stop in n.*transition
	FSM.stop in State.*transition
}

run {} for 5
