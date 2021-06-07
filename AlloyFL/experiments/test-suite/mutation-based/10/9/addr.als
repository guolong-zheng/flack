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
pred test21 {
some disj Address0, Address1: Address {some disj Name0: Name {some disj Name0, Address0, Address1: Listing {some disj Book0: Book {
Address = Address0 + Address1
Name = Name0
Listing = Name0 + Address0 + Address1
Book = Book0
entry = Book0->Name0
listed = Book0->Name0->Address1
}}}}
}
run test21 for 3 expect 1
