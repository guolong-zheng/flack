open util/ordering[Position]

// Consider the following model of an automated production line
// The production line consists of several positions in sequence
sig Position {}

// Products are either components assembled in the production line or 
// other resources (e.g. pre-assembled products or base materials)
sig Product {}

// Components are assembled in a given position from other parts
sig Component extends Product {
    parts : set Product,
    cposition : one Position
}
sig Resource extends Product {}

// Robots work somewhere in the production line
sig Robot {
        rposition : one Position
}

// A component requires at least one part
pred inv1 { 
 all c:Component | some parts -- incorrect 4
}

// A component cannot be a part of itself
pred inv2 { 
all c:Component | c not in c.^parts -- correct
}

// The position where a component is assembled must have at least one robot
pred inv3 { 
Component.cposition in Robot.rposition -- correct
}

// The parts required by a component cannot be assembled in a later position
pred inv4 { 
all c:Component | c.parts.cposition in c.cposition.*prev  -- correct
}
/*======== IFF PERFECT ORACLE ===============*/
assert repair_assert_1 {
    inv1[] iff { all c:Component | some c.parts }
}

pred repair_pred_1 {
  inv1[] iff { all c:Component | some c.parts }
}

check repair_assert_1
run repair_pred_1

---------
assert repair_assert_2 {
    inv2[] iff { all c:Component | c not in c.^parts }
}

pred repair_pred_2 {
    inv2[] iff { all c:Component | c not in c.^parts }
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
    inv3[] iff { Component.cposition in Robot.rposition }
}

pred repair_pred_3 {
  inv3[] iff { Component.cposition in Robot.rposition }
}

check repair_assert_3
run repair_pred_3

--------
assert repair_assert_4 {
    inv4[] iff  { all c:Component | c.parts.cposition in c.cposition.*prev }
}

pred repair_pred_4 {
  inv4[] iff { all c:Component | c.parts.cposition in c.cposition.*prev }
}

check repair_assert_4
run repair_pred_4
