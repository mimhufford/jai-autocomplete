main :: () {}
Thing1 :: struct {}
Thing2 :: struct {}
proc_a :: (a: Thing1, b: Thing2, c: Thing2, d: int) {}
proc_b :: (a: Thing1) {}
proc_c :: (a: Thing2) {}

#import "Basic";
#import "Math";
#import "Hash_Table";