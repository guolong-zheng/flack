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
