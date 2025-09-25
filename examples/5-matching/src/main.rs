#[allow(dead_code)]
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    Color(i32, i32, i32),
}

fn process_color(msg: Message) {
    if let Message::Color(r,g,b) = msg {
        println!("Color {},{},{}", r, g, b);
    }
}

fn process_message(msg: Message) {
    match msg {
        Message::Quit => {
            println!("no data");
        }
        Message::Move { x, y } => {
            println!("x={} y={}", x, y);
        }
        Message::Write(text) => {
            println!("Text={}", text);
        }
        Message::Color(r, g, b) => {
            println!("r,g,b={},{},{}", r, g, b);
        }
    }
}

fn main() {
    let msg1 = Message::Move { x: 10, y: 20 };
    process_message(msg1);
    let msg2 = Message::Write(String::from("hello"));
    process_message(msg2);
    let msg3 = Message::Color(255,255,255);
    process_color(msg3);
}
