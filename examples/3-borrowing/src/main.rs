fn thief(t: String) {
    println!("thief: {}", t);
}

fn main() {
    let s = String::from("hello");

    println!("before: {}", s);

    // transfer of ownership
    thief(s);

    // this will not compile...
    println!("after: {}", s);
}

/*
src/main.rs|13 col 28 error 382| borrow of moved value: `s`
||    |
|| 6  |     let s = String::from("hello");
||    |         - move occurs because `s` has type `String`,
||    |           which does not implement the `Copy` trait
|| ...
|| 11 |     thief(s);
||    |           - value moved here
|| ...
|| 14 |     println!("after: {}", s);
||    |                            ^ value borrowed here
||    |                              after move
*/
