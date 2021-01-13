
/* The registered persons. */
sig Person  {
	/* Each person tutors a set of persons. */
	Tutors : set Person,
	/* Each person teaches a set of classes. */
	Teaches : set Class
}

/* The registered groups. */
sig Group {}

/* The registered classes. */
sig Class  {
	/* Each class has a set of persons assigned to a group. */
	Groups : Person -> Group
}

/* Some persons are teachers. */
sig Teacher extends Person  {}

/* Some persons are students. */
sig Student extends Person  {}

/* Every person is a student. */
pred inv1 {
Person in Student -- correct
}

/* There are no teachers. */
pred inv2 {
no Teacher -- correct
}

/* No person is both a student and a teacher. */
pred inv3 {
no Student & Teacher -- correct
}

/* No person is neither a student nor a teacher. */
pred inv4 {
Person in (Student + Teacher) -- correct
}

/* There are some classes assigned to teachers. */
pred inv5 {
some Teacher.Teaches -- correct
}

/* Every teacher has classes assigned. */
pred inv6 {
Teacher in Teaches.Class -- correct
}

/* Every class has teachers assigned. */
pred inv7 {
Class in Teacher.Teaches -- correct
}

/* Teachers are assigned at most one class. */
pred inv8 {
all t:Teacher | lone t.Teaches -- correct
}

/* No class has more than a teacher assigned. */
pred inv9 {
all c:Class | lone Teaches.c & Teacher -- correct
}

/* For every class, every student has a group assigned. */
pred inv10 {
 some Student & ((Class . Groups) . Group)  -- incorrect 36
}

/* A class only has groups if it has a teacher assigned. */
pred inv11 {
all c : Class | (some c.Groups) implies some Teacher & Teaches.c -- correct
}

/* Each teacher is responsible for some groups. */
pred inv12 {
all t : Teacher | some (t.Teaches).Groups -- correct
}

/* Only teachers tutor, and only students are tutored. */
pred inv13 {
Tutors.Person in Teacher and Person.Tutors in Student -- correct
}

/* Every student in a class is at least tutored by all the teachers
 * assigned to that class. */
pred inv14 {
all s : Person, c : Class, t : Person, g : Group | (c -> s -> g in Groups) and t -> c in Teaches implies t -> s in Tutors -- correct
}

/* The tutoring chain of every person eventually reaches a Teacher. */
pred inv15 {
all s : Person | some Teacher & ^Tutors.s -- correct
}
/*======== IFF PERFECT ORACLE ===============*/
assert repair_assert_1 {
    inv1[] iff { Person in Student }
}
pred repair_pred_1 {
  inv1[] iff { Person in Student }
}

check repair_assert_1
run repair_pred_1

---------
assert repair_assert_2 {
    inv2[] iff  { no Teacher }
}
pred repair_pred_2 {
  inv2[] iff { no Teacher }
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
    inv3[] iff { no Student & Teacher }
}
pred repair_pred_3 {
   inv3[] iff { no Student & Teacher }
}

check repair_assert_3
run repair_pred_3

--------
assert repair_assert_4 {
    inv4[] iff { Person in (Student + Teacher) }
}
pred repair_pred_4 {
  inv4[] iff { Person in (Student + Teacher) }
}

check repair_assert_4
run repair_pred_4

--------
assert repair_assert_5 {
    inv5[] iff { some Teacher.Teaches }
}
pred repair_pred_5 {
  inv5[] iff { some Teacher.Teaches }
}

check repair_assert_5
run repair_pred_5

--------
assert repair_assert_6 {
    inv6[] iff { Teacher in Teaches.Class }
}
pred repair_pred_6 {
   inv6[] iff { Teacher in Teaches.Class }
}

check repair_assert_6
run repair_pred_6

--------
assert repair_assert_7 {
    inv7[] iff { Class in Teacher.Teaches }
}
pred repair_pred_7 {
   inv7[] iff { Class in Teacher.Teaches }
}

check repair_assert_7
run repair_pred_7

--------
assert repair_assert_8 {
    inv8[] iff { all t:Teacher | lone t.Teaches }
}
pred repair_pred_8 {
  inv8[] iff { all t:Teacher | lone t.Teaches }
}

check repair_assert_8
run repair_pred_8

--------
assert repair_assert_9 {
    inv9[] iff { all c:Class | lone Teaches.c & Teacher }
}
pred repair_pred_9 {
   inv9[] iff { all c:Class | lone Teaches.c & Teacher }
}

check repair_assert_9
run repair_pred_9

--------
assert repair_assert_10 {
    inv10[] iff { all c:Class, s:Student | some s.(c.Groups) }
}
pred repair_pred_10 {
    inv10[] iff  { all c:Class, s:Student | some s.(c.Groups) }
}

check repair_assert_10
run repair_pred_10

--------
assert repair_assert_11 {
    inv11[] iff { all c : Class | (some c.Groups) implies some Teacher & Teaches.c }
}
pred repair_pred_11 {
  inv11[] iff { all c : Class | (some c.Groups) implies some Teacher & Teaches.c }
}

check repair_assert_11
run repair_pred_11

--------
assert repair_assert_12 {
  inv12[] iff  { all t : Teacher | some (t.Teaches).Groups }
}
pred repair_pred_12 {
  inv12[] iff  { all t : Teacher | some (t.Teaches).Groups }
}

check repair_assert_12
run repair_pred_12

--------
assert repair_assert_13 {
    inv13[] iff { Tutors.Person in Teacher and Person.Tutors in Student  }
}
pred repair_pred_13 {
  inv13[] iff { Tutors.Person in Teacher and Person.Tutors in Student  }
}

check repair_assert_13
run repair_pred_13

--------
assert repair_assert_14 {
    inv14[] iff { all s : Person, c : Class, t : Person, g : Group | (c -> s -> g in Groups) and t -> c in Teaches implies t -> s in Tutors }
}
pred repair_pred_14 {
    inv14[] iff { all s : Person, c : Class, t : Person, g : Group | (c -> s -> g in Groups) and t -> c in Teaches implies t -> s in Tutors }
}

check repair_assert_14
run repair_pred_14

--------
assert repair_assert_15 {
    inv15[] iff { all s : Person | some Teacher & ^Tutors.s }
}
pred repair_pred_15 {
  inv15[] iff { all s : Person | some Teacher & ^Tutors.s }
}

check repair_assert_15
run repair_pred_15

--------
