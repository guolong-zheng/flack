// skip, a false positive error
sig Element {}

one sig Array {
  // Maps indexes to elements of Element.
  i2e: Int -> Element,
  // Represents the length of the array.
  length: Int
}

// Assume all objects are in the array.
fact Reachable {
  Element = Array.i2e[Int]
}

fact InBound {
  // All indexes should be greater than or equal to 0
  // and less than the array length
  all i:Array.i2e.Element | i >= 0
  all i:Array.i2e.Element | i < Array.length

  // Array length should be greater than equal to 0,
  // but also since there is a one-to-one mapping from
  // index to element, we restrict the array length to the
  // number of elements.
  Array.length >= 0
}

pred NoConflict() {
  // Each index maps to at most on element
  // Fix: replace "#Array.i2e[i] = 1" with "#Array.i2e[i] <= 1".
  all i:Array.i2e.Element | #Array.i2e[i] = 1
}

run NoConflict for 3

assert repair_assert_1 {
  NoConflict <=> all i:Array.i2e.Element | #Array.i2e[i] <= 1
}
 check repair_assert_1
pred repair_pred_1 {
  NoConflict <=> all i:Array.i2e.Element | #Array.i2e[i] <= 1
}
 run repair_pred_1
