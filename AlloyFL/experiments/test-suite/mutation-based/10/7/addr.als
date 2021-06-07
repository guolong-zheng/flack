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
