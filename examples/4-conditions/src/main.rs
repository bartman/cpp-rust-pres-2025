#[allow(unused_variables)]
fn main() {
    let number = 42;

    if number == 42 {
        println!("equal");
    } else if number < 0 {
        println!("less");
    } else {
        println!("?");
    }

    let matched = match number {
        42 => {
            println!("universe");
            true
        },
        _ => {
            println!("something else");
            false
        }
    };
}
