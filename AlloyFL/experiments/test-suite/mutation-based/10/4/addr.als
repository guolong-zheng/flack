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
