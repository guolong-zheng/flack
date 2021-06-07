sig List {
    header: set Node
}

sig Node {
    link: set Node, 
    elem: set Int
}

// Correct
fact CardinalityConstraints {
    all l: List | lone l.header
    all n: Node | lone n.link
    all n: Node | one n.elem
}

// Overconstraint.  no header is not allowed given the fact allNodesBelongToOneList.
// Underconstraint. link = n1 -> n2 + n2 -> n3 + n3 -> n1 is allowed.
pred Loop(This: List) {
    no This.header || one n : This.header.*link | n.^link = n.*link
}

fact allNodesBelongToOneList{
    all n: Node | one l: List | n in l.header.*link
}

// Overconstraint, l.header = n1, link = n1->n2, elem = n1->1 + n2->2, not allowed.
pred Sorted(This: List) {
    // Fix: replace "n.elem <= (n.link-This.header).elem" with "some n.link => n.elem <= n.link.elem".
    all n: Node | n.elem <= (n.link-This.header).elem
}

run Sorted

pred RepOk(This: List) { 
    Loop[This]
    Sorted[This]
}

// Correct
pred Count(This: List, x: Int, result: Int) {
    RepOk[This]
    result = #{n: Node |  n in This.header.*link && n.elem = x}
}

abstract sig Boolean {}
one sig True, False extends Boolean {}

// Correct
pred Contains(This: List, x: Int, result: Boolean) {
    RepOk[This]
    #{n: Node | n in This.header.*link && n.elem = x} > 0 => result = True else result = False
}

assert repair_assert_1 {
    all l : List | Sorted[l] <=> all n: l.header.*link | some n.link => n.elem <= n.link.elem
}
 check repair_assert_1
pred repair_pred_1 {
    all l : List | Sorted[l] <=> all n: l.header.*link | some n.link => n.elem <= n.link.elem
}
 run repair_pred_1