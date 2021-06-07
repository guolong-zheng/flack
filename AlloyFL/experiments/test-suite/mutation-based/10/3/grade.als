pred test5 {
some disj Professor0, Professor1, Professor2: Professor {some disj Professor0, Professor1, Professor2: Person {some disj Class0, Class1, Class2: Class {
no Student
Professor = Professor0 + Professor1 + Professor2
Person = Professor0 + Professor1 + Professor2
Class = Class0 + Class1 + Class2
no assistant_for
instructor_of = Class0->Professor2 + Class1->Professor1 + Class2->Professor0
no Assignment
no associated_with
no assigned_to
}}}
}
run test5 for 3 expect 1
pred test7 {
some disj Student0: Student {some disj Student0: Person {
Student = Student0
no Professor
Person = Student0
no Class
no assistant_for
no instructor_of
no Assignment
no associated_with
no assigned_to
}}
}
run test7 for 3 expect 1
pred test31 {
some disj Student0: Student {some disj Professor0, Professor1: Professor {some disj Student0, Professor0, Professor1: Person {some disj Class0, Class1, Class2: Class {some disj Assignment0: Assignment {
Student = Student0
Professor = Professor0 + Professor1
Person = Student0 + Professor0 + Professor1
Class = Class0 + Class1 + Class2
assistant_for = Class1->Student0
instructor_of = Class0->Professor0 + Class1->Professor0 + Class2->Professor1
Assignment = Assignment0
associated_with = Assignment0->Class2
assigned_to = Assignment0->Student0
PolicyAllowsGrading[Professor1,Assignment0]
}}}}}
}
run test31 for 3 expect 1
pred test15 {
some disj Student0: Student {some disj Professor0: Professor {some disj Student0, Professor0: Person {some disj Class0, Class1, Class2: Class {some disj Assignment0, Assignment1, Assignment2: Assignment {
Student = Student0
Professor = Professor0
Person = Student0 + Professor0
Class = Class0 + Class1 + Class2
assistant_for = Class0->Student0 + Class1->Student0 + Class2->Student0
instructor_of = Class0->Professor0 + Class1->Professor0
Assignment = Assignment0 + Assignment1 + Assignment2
associated_with = Assignment0->Class2 + Assignment1->Class2 + Assignment2->Class2
assigned_to = Assignment0->Student0 + Assignment1->Student0 + Assignment2->Student0
}}}}}
}
run test15 for 3 expect 0
