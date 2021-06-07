--Project discussed with Jun Wang and Jiawei Wang

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

// Part (a)
fact InBound {
  // All indexes should be greater than or equal to 0 and less than
  // the array length.
  -- TODO: Your code starts here.
  // Fix: replace "i>0" with "i>=0" and remove "or (i = 0)"
  all e:Element, i:Int |
  i->e in Array.i2e => (i>0 and i < Array.length) or (i = 0)

  // Array length should be greater than or equal to 0.
  -- TODO: Your code starts here.
  all size:Array.length | size >= 0
}

// Part (b)
pred NoConflict() {
  // Each index maps to at most one element.
  -- TODO: Your code starts here.
  all e0:Element, e1:Element, i:Int | 
  i->e0 in Array.i2e and i->e1 in Array.i2e => e0 = e1
}

run NoConflict for 5
