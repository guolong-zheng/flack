sig List {
    header: set Node
}

sig Node {
    link: set Node,
    elem: set Int
}

// Correct
fact CardinalityConstraints {
    all l : List | lone l.header
    all n : Node | lone n.link
    all n : Node | one n.elem
}

// Correct
pred Loop ( This : List ) {
    no This.header || one n : This.header.*link | n.^link = n.*link
}

// Underconstraint.  Should be true if no n.link.
pred Sorted ( This : List ) {
    // Fix: replace "n.elem <= n.link.elem" with "some n.link => n.elem <= n.link.elem"
    all n: This.header.*link | n.elem <= n.link.elem
}

pred RepOk ( This : List ) {
    Loop [This]
    Sorted [This]
}

// Correct
pred Count ( This : List , x : Int , result : Int ) {
    RepOk [This]
    result = #{ n:This.header.*link | n.elem = x }
}

abstract sig Boolean {}
one sig True , False extends Boolean {}

// Underconstraint as result can always be true.
pred Contains ( This : List , x : Int , result : Boolean ) {
    RepOk [ This ]
    ( x ! in This.header.*link.elem => result=False else result = True)
}

assert repair_assert_1 {
    all l : List | Sorted[l] <=> all n: l.header.*link | some n.link => n.elem <= n.link.elem
}
 check repair_assert_1
pred repair_pred_1 {
    all l : List | Sorted[l] <=> all n: l.header.*link | some n.link => n.elem <= n.link.elem
}
 run repair_pred_1
