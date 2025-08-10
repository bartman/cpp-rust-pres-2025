fn thief(s: String) {
    println!("thief: {}", s);

}

fn main() {
    let s = String::from("hello");

    println!("before: {}", s);

    // transfer of ownership to the function
    thief(s);

    // this will not compile...
    // println!("before: {}", s);
}

/*
src/main.rs|13 col 28 error 382| borrow of moved value: `s`
||    |
|| 7  |     let s = String::from("hello");
||    |         - move occurs because `s` has type `String`, which does not implement the `Copy` trait
|| ...
|| 11 |     thief(s);
||    |           - value moved here
|| 12 |
|| 13 |     println!("before: {}", s);
||    |                            ^ value borrowed here after move
*/
