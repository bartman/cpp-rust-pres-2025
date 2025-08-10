fn main() {
    let s1 = String::from("hello");
    // s1 owns the String

    let s2 = s1;
    // Ownership is moved to s2

    // println!("{}", s1);
    // Error! s1 no longer owns the value

    println!("{}", s2);

    let s3 = String::from("world");
    let s4 = &s3;
    // s4 borrows s3, it's immutable

    println!("{}", s3);
    // Valid, s3 still owns the value

    println!("{}", s4);
}
