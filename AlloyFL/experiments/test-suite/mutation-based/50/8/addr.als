pred test23 {
some disj Name0, Name1, Name2: Name {some disj Name0, Name1, Name2: Listing {some disj Book0: Book {
no Address
Name = Name0 + Name1 + Name2
Listing = Name0 + Name1 + Name2
Book = Book0
entry = Book0->Name2
listed = Book0->Name2->Name0 + Book0->Name2->Name1
}}}
}
run test23 for 3 expect 0
pred test4 {
some disj Name0: Name {some disj Name0: Listing {some disj Book0: Book {
no Address
Name = Name0
Listing = Name0
Book = Book0
no entry
no listed
}}}
}
run test4 for 3 expect 1
pred test18 {
some disj Name0, Name1, Name2: Name {some disj Name0, Name1, Name2: Listing {
no Address
Name = Name0 + Name1 + Name2
Listing = Name0 + Name1 + Name2
no Book
no entry
no listed
}}
}
run test18 for 3 expect 1
pred test10 {
some disj Address0: Address {some disj Name0: Name {some disj Name0, Address0: Listing {
Address = Address0
Name = Name0
Listing = Name0 + Address0
no Book
no entry
no listed
}}}
}
run test10 for 3 expect 1
pred test26 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Address0 + Book0->Name1->Name0 + Book0->Name1->Address0 + Book1->Name0->Address0 + Book1->Name1->Name0 + Book1->Name1->Name1 + Book1->Name1->Address0 + Book2->Name0->Name1 + Book2->Name1->Name0 + Book2->Name1->Name1
}}}}
}
run test26 for 3 expect 0
pred test28 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Address0 + Book0->Name1->Name0 + Book0->Name1->Name1 + Book0->Name1->Address0 + Book1->Name0->Address0 + Book1->Name1->Name0 + Book1->Name1->Name1 + Book1->Name1->Address0 + Book2->Name0->Address0 + Book2->Name1->Name0 + Book2->Name1->Name1 + Book2->Name1->Address0
}}}}
}
run test28 for 3 expect 0
pred test9 {
some disj Name0: Name {some disj Name0: Listing {
no Address
Name = Name0
Listing = Name0
no Book
no entry
no listed
}}
}
run test9 for 3 expect 1
pred test15 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Address0, Name1: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Address0 + Name1
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Name1 + Book0->Name1->Address0 + Book1->Name0->Name1 + Book1->Name1->Address0 + Book2->Name0->Address0 + Book2->Name1->Name0
lookup[Book2,Name1] = Name0 + Address0
}}}}
}
run test15 for 3 expect 1
pred test27 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Name0 + Book0->Name0->Address0 + Book0->Name1->Name0 + Book0->Name1->Name1 + Book0->Name1->Address0 + Book1->Name0->Name0 + Book1->Name0->Address0 + Book1->Name1->Name0 + Book1->Name1->Name1 + Book1->Name1->Address0 + Book2->Name0->Name0 + Book2->Name0->Name1 + Book2->Name1->Name0 + Book2->Name1->Name1
}}}}
}
run test27 for 3 expect 0
pred test2 {

no Address
no Name
no Listing
no Book
no entry
no listed

}
run test2 for 3 expect 1
pred test22 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0
entry = Book0->Name0 + Book0->Name1
listed = Book0->Name0->Address0 + Book0->Name1->Name0
}}}}
}
run test22 for 3 expect 1
pred test24 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Name1 + Book0->Name1->Name0 + Book0->Name1->Name1 + Book0->Name1->Address0 + Book1->Name0->Name1 + Book1->Name1->Name0 + Book1->Name1->Name1 + Book1->Name1->Address0 + Book2->Name0->Name0 + Book2->Name0->Address0 + Book2->Name1->Name0 + Book2->Name1->Name1
}}}}
}
run test24 for 3 expect 0
pred test5 {
some disj Name0, Name1, Name2: Name {some disj Name0, Name1, Name2: Listing {some disj Book0: Book {
no Address
Name = Name0 + Name1 + Name2
Listing = Name0 + Name1 + Name2
Book = Book0
no entry
no listed
}}}
}
run test5 for 3 expect 1
pred test1 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0
no entry
no listed
}}}}
}
run test1 for 3 expect 1
pred test29 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1
entry = Book1->Name0 + Book1->Name1
listed = Book1->Name0->Name0 + Book1->Name1->Name1
}}}}
}
run test29 for 3 expect 0
