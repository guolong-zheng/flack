
abstract sig Source {}
sig User extends Source {
    profile : set Work,
    visible : set Work
}
sig Institution extends Source {}

sig Id {}
sig Work {
    ids : some Id,
    source : one Source
}

// The works publicly visible in a curriculum must be part of its profile
pred inv1 { 
all u:User | u.visible in u.profile -- correct
}

// A user profile can only have works added by himself or some external institution
pred inv2 { 
 all w : Work | w.source in Source  -- incorrect 8
}

// The works added to a profile by a given source cannot have common identifiers
pred inv3 { 
all w1, w2 : Work, u : User | w1 != w2 and (w1 + w2) in u.profile and (w1.source = w2.source) implies no w1.ids & w2.ids -- correct
}
/*======== IFF PERFECT ORACLE ===============*/
assert repair_assert_1 {
    inv1[] iff { all u:User | u.visible in u.profile }
}
pred repair_pred_1 {
  inv1[] iff  { all u:User | u.visible in u.profile }
}

check repair_assert_1
run repair_pred_1

---------
assert repair_assert_2 {
    inv2[] iff { all u:User, w:Work | w in u.profile implies (u in w.source or some i:Institution | i in w.source) }
}
pred repair_pred_2 {
    inv2[] iff { all u:User, w:Work | w in u.profile implies (u in w.source or some i:Institution | i in w.source) }
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
    inv3[] iff { all w1, w2 : Work, u : User | w1 != w2 and (w1 + w2) in u.profile and (w1.source = w2.source) implies no w1.ids & w2.ids }
}
pred repair_pred_3 {
    inv3[] iff { all w1, w2 : Work, u : User | w1 != w2 and (w1 + w2) in u.profile and (w1.source = w2.source) implies no w1.ids & w2.ids }
}

check repair_assert_3
run repair_pred_3
