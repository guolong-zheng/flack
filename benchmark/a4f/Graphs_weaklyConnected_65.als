/*  Each node as a set of outgoing edges, representing a directed graph without multiple edged. */
sig Node {
	adj : set Node
}

/* The graph is undirected, ie, edges are symmetric.
http://mathworld.wolfram.com/UndirectedGraph.html */
pred undirected {
adj = ~adj -- correct
}

/* The graph is oriented, ie, contains no symmetric edges.
http://mathworld.wolfram.com/OrientedGraph.html */
pred oriented {
no adj & ~adj -- correct	
}

/* The graph is acyclic, ie, contains no directed cycles.
http://mathworld.wolfram.com/AcyclicDigraph.html */
pred acyclic {
all a:Node | a not in a.^adj -- correct
}

/* The graph is complete, ie, every node is connected to every other node.
http://mathworld.wolfram.com/CompleteDigraph.html */
pred complete {
all n:Node | Node in n.adj -- correct
}

/* The graph contains no loops, ie, nodes have no transitions to themselves.
http://mathworld.wolfram.com/GraphLoop.html */
pred noLoops {
no (iden & adj) -- correct
}

/* The graph is weakly connected, ie, it is possible to reach every node from every node ignoring edge direction.
http://mathworld.wolfram.com/WeaklyConnectedDigraph.html */
pred weaklyConnected {
 all n:Node | Node in n.*adj + n.*~adj -- incorrect 65
}

/* The graph is strongly connected, ie, it is possible to reach every node from every node considering edge direction.
http://mathworld.wolfram.com/StronglyConnectedDigraph.html */
pred stronglyConnected {
all n:Node | Node in n.*adj -- correct
}

/* The graph is transitive, ie, if two nodes are connected through a third node, they also are connected directly.
http://mathworld.wolfram.com/TransitiveDigraph.html */
pred transitive {
adj.adj in adj -- correct
}
/*======== IFF PERFECT ORACLE ===============*/
assert repair_assert_1 {
    undirected[] iff { adj = ~adj }
}
pred repair_pred_1 {
  undirected[] iff { adj = ~adj }
}

check repair_assert_1
run repair_pred_1

--------
assert repair_assert_2 {
    oriented[] iff { no adj & ~adj }
}
pred repair_pred_2 {
  oriented[] iff { no adj & ~adj }
}

check repair_assert_2
run repair_pred_2

--------
assert repair_assert_3 {
   acyclic[]  iff { all a:Node | a not in a.^adj }
}
pred repair_pred_3 {
  acyclic[]  iff { all a:Node | a not in a.^adj }
}

check repair_assert_3
run repair_pred_3

--------
assert repair_assert_4 {
    complete[] iff { all n:Node | Node in n.adj }
}
pred repair_pred_4 {
  complete[] iff { all n:Node | Node in n.adj }
}

check repair_assert_4
run repair_pred_4

--------
assert repair_assert_5 {
   noLoops[]  iff  { no (iden & adj) }
}
pred repair_pred_5 {
  noLoops[]  iff { no (iden & adj) }
}

check repair_assert_5
run repair_pred_5

--------
assert repair_assert_6 {
   weaklyConnected[]  iff { all n:Node | Node in n.*(adj+~adj) }
}
pred repair_pred_6 {
   weaklyConnected[]  iff { all n:Node | Node in n.*(adj+~adj) }
}

check repair_assert_6
run repair_pred_6

--------
assert repair_assert_7 {
  stronglyConnected[]  iff { all n:Node | Node in n.*adj }
}
pred repair_pred_7 {
  stronglyConnected[]  iff { all n:Node | Node in n.*adj }
}

check repair_assert_7
run repair_pred_7

--------
assert repair_assert_8 {
  transitive[] iff { adj.adj in adj }
}
pred repair_pred_8 {
  transitive[] iff { adj.adj in adj }
}

check repair_assert_8
run repair_pred_8

