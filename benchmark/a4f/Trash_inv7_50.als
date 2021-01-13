
/* The set of files in the file system. */
sig File {
  	/* A file is potentially a link to other files. */
	link : set File
}
/* The set of files in the trash. */
sig Trash extends File {}

/* The set of protected files. */
sig Protected extends File {}

/* The trash is empty. */
pred inv1 {
no Trash -- correct
}

/* All files are deleted. */
pred inv2 {
File in Trash -- correct
}

/* Some file is deleted. */
pred inv3 {
some Trash -- correct
}

/* Protected files cannot be deleted. */
pred inv4 {
no Protected & Trash -- correct
}

/* All unprotected files are deleted.. */
pred inv5 {
File - Protected in Trash -- correct
}

/* A file links to at most one file. */
pred inv6 {
~link . link in iden -- correct
}

/* There is no deleted link. */
pred inv7 {
 no Trash.link  -- incorrect 50
}

/* There are no links. */
pred inv8 {
no link -- correct
}

/* A link does not link to another link. */
pred inv9 {
no link.link -- correct
}

/* If a link is deleted, so is the file it links to. */
pred inv10 {
Trash.link in Trash -- correct
}
/*======== IFF PERFECT ORACLE ===============*/

assert repair_assert_1 {
    inv1[] iff { no Trash }
}

pred repair_pred_1 {
    inv1[] iff { no Trash } 
}

check repair_assert_1
run repair_pred_1

---------
assert repair_assert_2 {
    inv2[] iff { File in Trash }
}

pred repair_pred_2 {
    inv2[] iff { File in Trash } 
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
    inv3[] iff { some Trash }
}

pred repair_pred_3 {
    inv3[] iff { some Trash }
}

check repair_assert_3
run repair_pred_3

--------
assert repair_assert_4 {
    inv4[] iff { no Protected & Trash }
}

pred repair_pred_4 {
    inv4[] iff { no Protected & Trash }
}

check repair_assert_4
run repair_pred_4

--------
assert repair_assert_5 {
    inv5[] iff { File - Protected in Trash }
}

pred repair_pred_5 {
    inv5[] iff { File - Protected in Trash }
}

check repair_assert_5
run repair_pred_5

--------
assert repair_assert_6 {
    inv6[] iff { ~link . link in iden }
}

pred repair_pred_6 {
    inv6[] iff { ~link . link in iden }
}

check repair_assert_6
run repair_pred_6

--------
assert repair_assert_7 {
    inv7[] iff { no link.Trash }
}

pred repair_pred_7 {
   inv7[] iff { no link.Trash }
}

check repair_assert_7
run repair_pred_7

--------
assert repair_assert_8 {
    inv8[] iff { no link }
}

pred repair_pred_8 {
  inv8[] iff { no link }
}

check repair_assert_8
run repair_pred_8

--------
assert repair_assert_9 {
    inv9[] iff { no link.link }
}

pred repair_pred_9 {
  inv9[] iff { no link.link }
}

check repair_assert_9
run repair_pred_9

--------
assert repair_assert_10 {
    inv10[] iff { Trash.link in Trash }
}

pred repair_pred_10 {
  inv10[] iff { Trash.link in Trash }
}

check repair_assert_10
run repair_pred_10
