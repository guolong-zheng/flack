pred test3 {
some disj Address0, Address1: Address {some disj Name0: Name {some disj Name0, Address0, Address1: Listing {some disj Book0: Book {
Address = Address0 + Address1
Name = Name0
Listing = Name0 + Address0 + Address1
Book = Book0
entry = Book0->Name0
listed = Book0->Name0->Address0 + Book0->Name0->Address1
}}}}
}
run test3 for 3 expect 1
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
pred test11 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book2->Name0 + Book2->Name1
listed = Book2->Name0->Address0 + Book2->Name1->Name0
}}}}
}
run test11 for 3 expect 1
pred test17 {
some disj Name0, Name1: Name {some disj Name0, Name1: Listing {some disj Book0: Book {
no Address
Name = Name0 + Name1
Listing = Name0 + Name1
Book = Book0
entry = Book0->Name1
listed = Book0->Name1->Name0
}}}
}
run test17 for 3 expect 0
pred test16 {
some disj Name0: Name {some disj Name0: Listing {some disj Book0: Book {
no Address
Name = Name0
Listing = Name0
Book = Book0
entry = Book0->Name0
no listed
}}}
}
run test16 for 3 expect 0
pred test6 {
some disj Name0, Name1: Name {some disj Name0, Name1: Listing {some disj Book0: Book {
no Address
Name = Name0 + Name1
Listing = Name0 + Name1
Book = Book0
no entry
no listed
}}}
}
run test6 for 3 expect 1
