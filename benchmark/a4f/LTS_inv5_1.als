/*
A labeled transition system (LTS) is comprised by States, a sub-set
of which are Initial, connected by transitions, here represented by 
Events.
*/
sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}

/* The LTS does not contain deadlocks, ie, each state has at least a transition. */
pred inv1 {
all s: State | some s.trans -- correct
}

/* There is a single initial state. */
pred inv2 {
one Init -- correct
}

/* The LTS is deterministic, ie, each state has at most a transition for each event. */
pred inv3 {
all s : State, e : Event | lone e.(s.trans) -- correct
}

/* All states are reachable from an initial state. */
pred inv4 {
let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |   State in Init.^tr -- correct
}

/* All the states have the same events available. */
pred inv5 {
 all s : State | Event = s.(State->Event) -- incorrect 1
}

/* Each event is available in at least a state. */
pred inv6 {
all e:Event | some s1,s2:State | s1->e->s2 in trans -- correct
}

/* The LTS is reversible, ie, from a reacheable state it is always possible to return to an initial state. */
pred inv7 {
let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } | all s : Init.^tr | some i : Init | i in s.^tr -- correct
}
/*======== IFF PERFECT ORACLE ===============*/

assert repair_assert_1 {
    inv1[] iff { all s: State | some s.trans }
}
pred repair_pred_1 {
  inv1[] iff { all s: State | some s.trans }
}

check repair_assert_1
run repair_pred_1

---------
assert repair_assert_2 {
    inv2[] iff { one Init }
}
pred repair_pred_2 {
  inv2[] iff { one Init }
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
   inv3[] iff { all s : State, e : Event | lone e.(s.trans) }
}
pred repair_pred_3 {
   inv3[] iff { all s : State, e : Event | lone e.(s.trans) }
}

check repair_assert_3
run repair_pred_3

--------
assert repair_assert_4 {
  inv4[] iff { let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
  State in Init.^tr }
}
pred repair_pred_4 {
  inv4[] iff { let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
  State in Init.^tr }
}

check repair_assert_4
run repair_pred_4

--------
assert repair_assert_5 {
  inv5[] iff { all s:State, s1:State | s.trans.State = s1.trans.State }
}
pred repair_pred_5 {
  inv5[] iff  { all s:State, s1:State | s.trans.State = s1.trans.State }
}

check repair_assert_5
run repair_pred_5

--------
assert repair_assert_6 {
 inv7[] iff { let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
  all s : Init.^tr | some i : Init | i in s.^tr }
}
pred repair_pred_6 {
 inv7[] iff { let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
  all s : Init.^tr | some i : Init | i in s.^tr }
}

check repair_assert_6
run repair_pred_6

