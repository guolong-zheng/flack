pred test7 {
some disj Address0: Address {some disj Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
no Name
Listing = Address0
Book = Book0 + Book1 + Book2
no entry
no listed
}}}
}
run test7 for 3 expect 1
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
pred test14 {
some disj Name0, Name1, Name2: Name {some disj Name0, Name1, Name2: Listing {some disj Book0: Book {
no Address
Name = Name0 + Name1 + Name2
Listing = Name0 + Name1 + Name2
Book = Book0
no entry
no listed
lookup[Book0,Name2] = none
}}}
}
run test14 for 3 expect 1
pred test12 {
some disj Address0: Address {some disj Name0: Name {some disj Name0, Address0: Listing {some disj Book0, Book1: Book {
Address = Address0
Name = Name0
Listing = Name0 + Address0
Book = Book0 + Book1
no entry
no listed
}}}}
}
run test12 for 3 expect 1
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
pred test25 {
some disj Address0: Address {some disj Name0, Name1: Name {some disj Name0, Name1, Address0: Listing {some disj Book0, Book1, Book2: Book {
Address = Address0
Name = Name0 + Name1
Listing = Name0 + Name1 + Address0
Book = Book0 + Book1 + Book2
entry = Book0->Name0 + Book0->Name1 + Book1->Name0 + Book1->Name1 + Book2->Name0 + Book2->Name1
listed = Book0->Name0->Name1 + Book0->Name1->Name0 + Book0->Name1->Name1 + Book0->Name1->Address0 + Book1->Name0->Name0 + Book1->Name0->Address0 + Book1->Name1->Name0 + Book1->Name1->Name1 + Book1->Name1->Address0 + Book2->Name0->Name0 + Book2->Name0->Name1 + Book2->Name1->Name0 + Book2->Name1->Name1
}}}}
}
run test25 for 3 expect 0
