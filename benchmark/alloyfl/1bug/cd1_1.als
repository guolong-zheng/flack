sig Class {
  ext: lone Class
}

one sig Object extends Class {}

pred ObjectNoExt() {
  // Object does not extend any class.
  all c: Class | Object !in c.^~ext
}

pred Acyclic() {
  // No class is a sub-class of itself (transitively).
  all c: Class | c !in c.^ext
}

pred AllExtObject() {
  // Each class other than Object is a sub-class of Object.
  // The body of the formula is wrong.
  // Fix: replace "c.*ext" with "Object.^~ext" or replace "c in c.*ext" with "Object in c.*ext".
  all c: Class - Object | c in c.*ext
}

pred ClassHierarchy() {
  ObjectNoExt
  Acyclic
  AllExtObject
}

run ClassHierarchy for 3
assert repair_assert_1 {
  AllExtObject <=> all c: Class - Object | c in Object.^~ext
}
 check repair_assert_1
pred repair_pred_1 {
  AllExtObject <=> all c: Class - Object | c in Object.^~ext
}
 run repair_pred_1
