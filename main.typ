#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#import "@preview/touying:0.6.1" as ty
#import "@preview/gentle-clues:1.2.0" as ad

// Font settings
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")

#let title = [Rust, first impressions]
#let subtitle = [for this C/C++ veteran]

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: title,
    subtitle: subtitle,
    author: [Bart Trojanowski],
    date: datetime.today(),
    institution: [CppOttawa],
    logo: emoji.crab,
  ),
  config-colors(
    primary: rgb("#005bac"),
    primary-dark: rgb("#004078"),
    secondary: rgb("#ffffff"),
    tertiary: rgb("#005bac"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#000000"),
  )
)

#let codeblock(
  fill: rgb(30, 30, 30),                   // rectangle fill color
  stroke: 1pt + rgb(192, 192, 192),        // bounding box color
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  color: rgb(255, 255, 192),               // text color
  size: 1em,                               // text size
  line-numbers: false,                     // new param, off by default
  body
) = {
  let the_raw = none
  if body.func() == raw {
    the_raw = body
  } else if body.has("children") {
    the_raw = body.children.find(c => c.func() == raw)
  }

  let content = if line-numbers and the_raw != none {
    let lines = the_raw.text.split("\n")
    let num_lines = lines.len()
    let lang = the_raw.lang
    if num_lines > 0 {
      grid(
        columns: (auto, 1fr),
        align: (right + horizon, left + horizon),
        gutter: 0.5em,
        ..array.zip(
          range(1, num_lines + 1).map(n => text(fill: luma(70%), str(n))),
          lines.map(line => raw(line, lang: lang, block: false))
        ).flatten()
      )
    } else {
      body
    }
  } else {
    body
  }
  block(
    fill: fill,
    stroke: stroke,
    radius: radius,
    inset: inset,
    width: width,
    {
      show raw: set text(fill: color, size: size)
      content
    }
  )
}

#show raw: set text(fill: rgb(0,92,0))

#let cpp_logo = [#align(left)[#text(size: 2em, fill: blue)[#"\u{e61d}"]]#v(-2.0em)]
#let rust_logo = [#align(left)[#text(size: 2em, fill: rgb(206,66,43))[#"\u{e7a8}"]]#v(-2.0em)]

// ------------------------- title -------------------------

//#title-slide()
#page(
  background: image("images/crab-rust-first-impressions-5.png", width: 100%, height: 100%, fit: "cover"),
)[
    #set text(size: 1.8em, weight: "bold", fill: rgb("#CEa22B"), stroke: rgb("#CE422B"))
    #place(top, dy: 90%)[
        #box(width: 100%, align(center, subtitle))
    ]
]

// ------------------------- intro -------------------------

#set text(size: .8em)

= About

== about me

#columns(4)[
  #table(
    columns: (25%, 75%),
    align: (left, left),
    stroke: none,

    table.cell(colspan: 2, fill: yellow)[
      #text(size:1.5em)[OS]
    ],
    table.cell(colspan: 2)[],

    [#text(size: 2em)[#"\u{f17c}"]], [30yr],
    [#text(size: 2em, stroke: red)[#"\u{e77d}"]],   [20yr],
    [#text(size: 2em, stroke: blue)[#"\u{e843}"]],  [$1/2$yr],
  )

  #colbreak()
  #table(
    columns: (25%, 75%),
    align: (left, left),
    stroke: none,

    table.cell(colspan: 2, fill: yellow)[
      #text(size:1.5em)[TOOLS]
    ],
    table.cell(colspan: 2)[],

    [#text(size: 2em, fill: rgb(241,80,47))[#"\u{e702}"]],   [20yr],
    [#text(size: 2em, fill: rgb(0,0,0))[#"\u{ebc8}"]],       [15yr],
    [#text(size: 2em, fill: rgb(0,77,113))[#"\u{e7c5}"]],    [15yr],
    [#text(size: 2em, fill: rgb(84,150,84))[#"\u{e6ae}"]],   [11yr],
  )

  #colbreak()
  #table(
    columns: (25%, 75%),
    align: (left, left),
    stroke: none,

    table.cell(colspan: 2, fill: yellow)[
      #text(size:1.5em)[CODING]
    ],
    table.cell(colspan: 2)[],

    [#text(size: 2em, fill: navy)[#"\u{e61e}"]], [25yr],
    [#text(size: 2em, fill: blue)[#"\u{e61d}"]], [6yr, #text(style: "italic", fill: gray)[srsly] 4yr],
    [#text(size: 2em, fill: rgb(206,66,43))[#"\u{e7a8}"]], [$1/12$yr],

    table.cell(colspan: 2)[],
    table.cell(colspan: 2, align: left)[
      #text(size: 2em, fill: rgb(78,100,37))[#"\u{e760}"] #sym.space
      #text(size: 2em, fill: rgb(0,0,127))[#"\u{e826}"] #sym.space
      #text(size: 2em, fill: rgb(69,132,182))[#"\u{e73c}"] #sym.space
      #text(size: 2em, fill: rgb(255,69,0))[#"\u{e881}"] #sym.space
      #text(size: 2em, fill: rgb(160,82,45))[#"\u{e67e}"] #sym.space
      #text(size: 2em, fill: rgb(248,152,32), stroke: rgb(83,130,161))[#"\u{e738}"] #sym.space
      #text(size: 2em, fill: rgb(240,219,79), stroke: black)[#"\u{f2ee}"] #sym.space
    ]
  )

  #colbreak()
  #table(
    columns: (25%, 75%),
    align: (left, left),
    stroke: none,

    table.cell(colspan: 2, fill: yellow)[
      #text(size:1.5em)[OTHER]
    ],
    table.cell(colspan: 2)[],

    [#text(size: 2em, fill: aqua, stroke: black)[#"\u{f115d}"]], [10yr],
    [#text(size: 2em, fill: white, stroke: gray)[#"\u{f0b7c}"]], [11yr],

    table.cell(colspan: 2)[],
    table.cell(colspan: 2, align: left)[
      #text(size: 2em, fill: rgb(78,100,37))[#"\u{ed61}"] #sym.space
      #text(size: 2em, fill: rgb(78,100,37))[#"\u{f15c7}"] #sym.space
      #text(size: 2em, fill: rgb(78,100,37))[#"\u{f0508}"] #sym.space
      #text(size: 2em, fill: rgb(78,100,37))[#"\u{f00a3}"] #sym.space
    ]
  )
]

== about the tool

it's 2010
- working as contractor
- invoicing monthly
- LibreOffice calc/writer

unrelated
- switched from `bash` to `zsh`
- wanted to learn `zsh` better

#ad.idea[
  write an invoicing app in `zsh`
]

== clinvoice-zsh <touying:hidden>

#columns(2)[

  #codeblock(color: green, [
    ```
    ❯ cli generate -t pdf -s 1 201011
    ...
    Output written on bnl-20101103-1.pdf.
    ```
  ])

  #codeblock(color: yellow, [
    ```
    2010.11.01
      2h = meeting with SUPPLY-R
      6h = repair lamp spire

    2010.11.02
      10:31-12:31 = meeting with SUPPLY-R
      13:01-19:01 = repair lamp spire

    2010.11.03
      10:32-12:32 = meeting with SUPPLY-R
      13:02-19:02 = repair lamp spire

    ```
  ])


  #colbreak()

  #codeblock(width: auto, [
    #image("images/invoice-1.png", width: 90%)
  ])
]

== clinvoice-zsh <touying:hidden>

  https://github.com/bartman/clinvoice-zsh

- \~500 lines of `zsh`
- bill clients for 15 years
- about 300 invoices generated
- works, but I never want to touch it again

#ad.conclusion[
  don't write applications in `zsh`
]

// ------------------------- rust -------------------------

= Rust

== hello world

#columns(2)[

  #codeblock(color: yellow, [
    ```
    hello_world/
    ├── Cargo.toml
    └── src/
        └── main.rs
    ```
  ])

  #codeblock([
    ```toml
    [package]
    name = "hello_world"
    version = "0.1.0"
    edition = "2021"
    ```
  ])

  #codeblock([
    ```rust
    fn main() {
      println!("Hello, world!");
    }

    ```
  ])

  #colbreak()

  #codeblock(color: green, [
    ```sh
    ❯ cargo build
    Compiling hello_world v0.1.0 (hello_world)
     Finished `dev` target(s) in 0.12s

    ❯ cargo run
    Hello, world!

    ❯ target/debug/hello_world
    Hello, world!

    ❯ ls -l target/*/hello_world
    .rwxr-xr-x 500k bart  9 Aug 12:00  rel
    .rwxr-xr-x 510k bart  9 Aug 12:00  dbg
    ```
  ])

  #codeblock(color: gray, [
    ```
    .rwxr-xr-x  16k bart  9 Aug 12:01  c
    .rwxr-xr-x  16k bart  9 Aug 12:01  cpp
    .rwxr-xr-x  17k bart  9 Aug 12:01  c+dbg
    .rwxr-xr-x  35k bart  9 Aug 12:01  cpp+dbg
    ```
  ])

]

== ownership

#columns(2)[

  - unique owner
  - move semantics
  - no deep copies
  - reference borrowing
  - dropping

  It's a bit like *std::uniq_ptr* on all variables... \
  but...

  #colbreak()

  #codeblock([
    ```rust
    fn main() {
      let s1 = String::from("hello");
      // s1 owns the String

      let s2 = s1;
      // Ownership is moved to s2

      println!("{}", s1);
      // Error! s1 no longer owns the value

      let s3 = String::from("world");
      let s4 = &s3;
      // s4 borrows s3, it's immutable

      println!("{}", s3);
      // Valid, s3 still owns the value
    }
    ```
  ])

]

== ownership <touying:hidden>

#columns(2)[

  #codeblock(line-numbers: true, [
    ```rust
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
    ```
  ])

  #colbreak()

  #codeblock(size: 0.7em, color: rgb(255,128,64), [
    ```
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
    ```
  ])

  Ownership errors are caught by the \
  *borrow checker* at compile time, \
  not at runtime.
]

== cargo

#table(
  columns: (25%, 35%, 40%),
  align: left,
  stroke: none,
  gutter: 0.1em,

  table.cell(fill: rgb(200, 200, 200))[#strong[Cargo Feature]],
  table.cell(fill: rgb(200, 200, 200))[#strong[C++ Equivalent(s)]],
  table.cell(fill: rgb(200, 200, 200))[#strong[Description]],

  [`Cargo.toml`], [`CMakeLists.txt` / `conanfile.py`], [dependencies, settings, metadata],
  [`cargo build`], [`make` / `ninja`], [compile w/ dependencies],
  [`cargo run`], [`make run` / _scripts_], [build and run],
  [`cargo test`], [`ctest` / `googletest`], [compiles and tests],
  [`cargo doc`], [`doxygen` / `sphinx`], [documentation],
  [`cargo fmt`], [`clang-format`], [reformat code],
  [`cargo clippy`], [`cppcheck` / `clang-tidy`], [lints/static analysis],
  [`cargo new`], [`conan new` / _scripts_], [new project],
  [`cargo add`], [`conan install`], [add dependencies],
  [`cargo publish`], [`conan create`], [publishes to registry],
)

_It's a joy to work with_

== registry

#align(center + horizon,
image("images/crates.io.png", width: auto)
)

// ------------------------- comparison -------------------------

= Comparison

== similarities <touying:hidden>

- blazingly fast
- memory efficient
- system language
- compiled
- multi-paradigm

- primitive types
- statically typed
- implicit type deduction

== defaults

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    // private to this file
    static void private_function() {}

    // exported by default
    void public_function() {}
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // private by default
    fn private_function() {}

    // public
    pub fn public_function() {}
    ```
  ])
]

== defaults <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    // immutable
    const int y = 5;
    y = 6; // error

    // mutable by default
    int x = 5;
    x = 6;
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // immutable by default
    let y = 5;
    y = 6; // error

    // mutable
    let mut x = 5;
    x = 6;
    ```
  ])
]

== returning

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    int add(int a, int b) {
      return a + b;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn add1(a: i32, b: i32) -> i32 {
      return a + b;
    }

    fn add2(a: i32, b: i32) -> i32 {
      a + b // no semicolon
    }
    ```
  ])
]


== numerical types

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <cstdint>

    uint8_t  a = 1;
    uint16_t b = 2;
    uint32_t c = 3;
    uint64_t d = 4;

    float  f = 1.0f;
    double g = 2.0;

    bool   h = true;
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // language defined types

    let a: u8  = 1;
    let b: u16 = 2;
    let c: u32 = 3;
    let d: u64 = 4;

    let f: f32 = 1.0;
    let g: f64 = 2.0;

    let h: bool = true;
    ```
  ])
]

== numerical types <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    auto a = 1;   // int
    auto b = 1U;  // unsigned int
    auto c = 1L;  // long
    auto d = 1UL; // unsigned long
    auto e = 1LL; // long long

    auto f = 1.0f; // float
    auto g = 1.0;  // double

    auto z = 1z; // size_t (c++23)
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    let a = 1;   // i32
    let b = 1u32;
    let c = 1i64;

    let d = 1.0; // f64
    let e = 1.0f32;

    let z = 1usize;
    ```
  ])
]

== numerical types <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    // Overflow
    unsigned char uc = 255;
    uc = uc + 1; // Wraps around to 0

    // Underflow
    unsigned char uc2 = 0;
    uc2 = uc2 - 1; // Wraps around to 255
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    // Overflow (panics in debug, wraps in release)
    let mut uc: u8 = 255;
    // uc = uc + 1; // Compile error: overflow

    // Use checked_add for runtime error
    match uc.checked_add(1) {
        Some(val) => uc = val,
        None => println!("Overflow detected"),
    }

    // Underflow (panics in debug, wraps in release)
    let mut uc2: u8 = 0;
    // uc2 = uc2 - 1; // Compile error: underflow

    // Use checked_sub for runtime error
    match uc2.checked_sub(1) {
        Some(val) => uc2 = val,
        None => println!("Underflow detected"),
    }
    ```
  ])
]

== casting

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    //  Primitive casting
    int a = (int)3.14;
    int b = static_cast<int>(3.14);

    // Unsafe reinterpreting
    float f = 3.14;
    int* p = reinterpret_cast<int*>(&f);
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // Primitive casting
    let a = 3.14 as i32;


    // Unsafe reinterpreting
    let f = 3.14f32;
    let p: *const i32 = unsafe {
      std::mem::transmute(&f)
    };
    ```
  ])
]

== casting <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    // Implicit promotion
    int i = 10;
    double d = 3.14;
    auto result = i + d; // i is promoted to double

    // Narrowing conversion (warning, but compiles)
    int big_int = 1000;
    char small_char = big_int; // Data loss
    ```
  ])

  Jason Turner is not a fan of implicit conversions.
  #image("images/implicit-evil.png", width: 100%)

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    // Implicit promotion (type mismatch error)
    let i: i32 = 10;
    let d: f64 = 3.14;
    // let result = i + d; // Error: cannot add f64 & i32
    let result = i as f64 + d; // Explicit cast required

    // Narrowing conversion (explicit cast required)
    let big: i32 = 1000;
    // let small: u8 = big; // Error: mismatched types
    let small: u8 = big as u8; // Explicit cast
    ```
  ])
]

== conditions

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    auto number = 42;

    if (number == 42) {
        fmt::println("equal");
    } else if (number < 0) {
        fmt::println("less");
    } else {
        fmt::println("?");
    }

    bool matched = false;
    switch (number) {
        case 42:
            fmt::println("universe");
            matched = true;
            break;
        default:
            fmt::println("something else");
            break;
    }

    auto msg = matched ? "matched" : "nope";
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
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

    let msg = if matched { "matched" } else { "nope" };
    ```
  ])
]

== loops

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.9em, [
    ```cpp
    for (auto i = 0; i < 10; i++) {
      // ...
    }

    for (auto i = 0; i < 10; i += 2) {
      // ...
    }

    while (count < 10) {
      // ...
      count ++;
    }

    do {
      // ...
    } while (something());
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.9em, [
    ```rust
    for i in 0..10 {
      // ...
    }

    for i in (0..10).step_by(2) {
      // ...
    }

    while count < 10 {
      // ...
      count += 1;
    }

    loop {
      // ...
      if something() { break; }
    }
    ```
  ])
]

== strings

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    // just a sequence of bytes
    const char* s1 = "Hello";
    auto s2 = u8"HΣllo, Wörld!";
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // enforced valid UTF-8 strings
    let s1 = "Hello";
    let s2: &str = "HΣllo, Wörld!";
    ```
  ])
]

== strings <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    int main() {
      std::string s1{"Hello"};

      // contents of s1 are copied
      std::string s2 = s1 + ", World";
      s2.append("!");

      std::cout << s1; // s1 is still valid
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn main() {
      let s1 = String::from("Hello");
      // s1 is moved and no longer valid
      let s2 = s1 + ", World";

      // The following line would fail
      // println!("{}", s1);

      // A mutable string
      let mut s3 = String::from("Hello");
      s3.push_str(", World!");
    }
    ```
  ])
]

== strings <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    int main() {
      const char* s = "Hello, World!";
      auto sv = std::string_view{s};

      // Modify the view
      sv.remove_prefix(7);
      // sv is now "World!"
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn main() {
      let s = "Hello, World!";
      // s is a &str, a string slice

      // Create a slice of s
      let sv = &s[7..];
      // sv is "World!"
    }
    ```
  ])
]

== ownership

#columns(2)[
  #cpp_logo
  - single owner or shared ownership
  - dev managed
  - copy by default, move explicitly

  #colbreak()
  #rust_logo
  - single owner
  - borrow checker
  - move/borrow ownership by default, copy explicitly
  ]

== smart pointer

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    std::uniq_ptr<int> get_unique_five() {
      // Unique ownership
      auto p1 = std::make_unique<int>(5);
      // Transfer ownership
      auto p2 = std::move(p1);
      // p1 is now nullptr
      return p2;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn get_boxed_five() -> Box<i32> {
      // Unique ownership
      let b1 = Box::new(5);
      // Transfer ownership
      let b2 = b1;
      // b1 is moved and cannot be used
      b2
    }
    ```
  ])
]

== smart pointer <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <memory>

    std::shared_ptr<int> get_sharable_five() {
      // Shared ownership
      auto sp1 = std::make_shared<int>(5);
      // Create another reference
      auto sp2 = sp1;
      // Ref count is 2
      return sp2; // or sp1
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    use std::rc::Rc;

    fn get_refcnted_five() -> Rc<i32> {
      // Shared ownership (not thread-safe)
      let rc1 = Rc::new(5);
      // Create another reference
      let rc2 = Rc::clone(&rc1);
      // Ref count is 2
      rc2 // or rc1
    }
    ```
  ])
]

== smart pointer <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    #include <memory>
    #include <thread>
    #include <atomic>

    int main() {
      auto sp = std::make_shared<std::atomic<int>>(5);
      std::thread t([sp]() {
        sp->fetch_add(1);
      });
      t.join();
      // sp->load() is 6
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    use std::sync::Arc;
    use std::sync::atomic::AtomicI32;
    use std::sync::atomic::Ordering;
    use std::thread;

    fn main() {
      let arc = Arc::new(AtomicI32::new(0));
      let arc2 = Arc::clone(&arc);
      let handle = thread::spawn(move || {
        arc2.fetch_add(1, Ordering::SeqCst);
      });
      handle.join().unwrap();
      // arc.load(Ordering::SeqCst) is 6
    }
    ```
  ])
]

== containers

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <array>
    #include <vector>

    // Fixed-size array
    std::array<int, 3> a = {1, 2, 3};

    // Dynamic array
    std::vector<int> v = {1, 2, 3};
    v.push_back(4);
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // Fixed-size array
    let a: [i32; 3] = [1, 2, 3];

    // Dynamic array
    let mut v = vec![1, 2, 3];
    v.push(4);
    ```
  ])
]

== containers <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <vector>

    std::vector<int> v1 = {1, 2, 3};
    // Deep copy by assignment
    std::vector<int> v2 = v1;
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    let v1 = vec![1, 2, 3];
    // Explicit deep copy
    let v2 = v1.clone();
    ```
  ])
]

== iterators

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <vector>
    #include <numeric>

    std::vector<int> v = {1, 2, 3};

    // Manual sum
    int sum1 = 0;
    for (int x : v) {
      sum1 += x;
    }

    // Accumulate algorithm
    int sum2 = std::accumulate(
          v.begin(), v.end(), 0);
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    // vec is built in
    // and so are algorithms

    let v = vec![1, 2, 3];

    // Manual sum
    let mut sum1 = 0;
    for x in &v {
      sum1 += x;
    }

    // Accumulate algorithm
    let sum2: i32 = v.iter().sum();
    ```
  ])
]

== OOP

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    class Point {
      float x, y;
    public:
      explicit Point(float x, float y)
        : x(x), y(y) {}

      float distance(const Point& pt) const {
        float dx = x - pt.x;
        float dy = y - pt.y;
        return std::sqrt(dx*dx + dy*dy);
      }
    };

    Point p(1.0, 2.0);
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    struct Point {
      x: f32,
      y: f32,
    }

    impl Point {
      fn new(x: f32, y: f32) -> Self {
        Self { x, y }
      }

      fn distance(&self, pt: &Point) -> f32 {
        let dx = self.x - pt.x;
        let dy = self.y - pt.y;
        (dx*dx + dy*dy).sqrt()
      }
    }

    let p = Point::new(1.0, 2.0);
    ```
  ])
]

== polymorphism

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <numbers> // std::numbers::pi

    class Shape {
    public:
      virtual float area() const = 0;
    };

    class Circle : public Shape {
      float r;
    public:
      Circle(float r) : r(r) {}
      float area() const override {
        return std::numbers::pi * r * r;
      }
    };
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    use std::f32::consts::PI;

    trait Shape {
      fn area(&self) -> f32;
    }

    struct Circle {
      r: f32,
    }

    impl Shape for Circle {
      fn area(&self) -> f32 {
        PI * self.r * self.r
      }
    }
    ```
  ])
]

== templates/generics

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    // Works for any type `T` that
    // has an `operator+`.
    template<typename T>
    T add(T a, T b) {
      return a + b;
    }

    // C++20: Abbreviated function template
    auto add2(auto a, auto b) {
      return a + b;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    use std::ops::Add;

    // Explicitly constrained to types
    // that implement the `Add` trait.
    fn add<T: Add<Output = T>>(a: T, b: T) -> T {
      a + b
    }
    ```
  ])
]

== templates/generics <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <iostream>

    // C++20 Concepts
    template<typename T>
    concept Printable = requires(T t) {
      { std::cout << t };
    };

    void print(Printable auto const& t) {
      std::cout << t;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    use std::fmt::Display;

    // Trait Bounds (always required)
    fn print<T: Display>(t: &T) {
      println!("{}", t);
    }
    ```
  ])
]

== enums

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    enum class Weekday {
      Monday,
      Tuesday,
      Wednesday,
      Thursday,
      Friday,
      Saturday,
      Sunday,
    };

    auto day = Weekday::Monday;
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    enum Weekday {
      Monday,
      Tuesday,
      Wednesday,
      Thursday,
      Friday,
      Saturday,
      Sunday,
    }

    let day = Weekday::Monday;
    ```
  ])
]

== enums <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <variant>
    #include <string>

    struct Quit {};
    struct Move { int x, y; };
    struct Write { std::string text; };

    using Message = std::variant<
      Quit,
      Move,
      Write
    >;

    Message m1 = Move{10, 20};
    Message m2 = Write{"hello"};
    Message m3 = Quit{};
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    enum Message {
      Quit,
      Move { x: i32, y: i32 },
      Write(String),
    }

    let m1 = Message::Move { x: 10, y: 20 };
    let m2 = Message::Write(String::from("hello"));
    let m3 = Message::Quit;
    ```
  ])
]



== concurrency

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    int main() {
      std::mutex mtx;
      std::string str;

      auto append_dot = [&]() {
        std::lock_guard<std::mutex> lock(mtx);
        str += ".";
      };

      std::thread t1(append_dot);
      std::thread t2(append_dot);
      t1.join();
      t2.join();
      std::cout << str; // ".."
      return 0;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    fn append_dot(arc: Arc<Mutex<String>>) {
      let mut str = arc.lock().unwrap();
      *str += "."
    }

    fn main() {
      let arc = Arc::new(Mutex::new(String::new()));
      let clone1 = Arc::clone(&arc);
      let clone2 = Arc::clone(&arc);

      let handle1 = thread::spawn(move || {
        append_dot(clone1); });

      let handle2 = thread::spawn(move || {
        append_dot(clone2); });

      handle1.join().unwrap();
      handle2.join().unwrap();

      // *arc.lock().unwrap() is ".."
    }
    ```
  ])
]

== locking

#columns(2)[
  #cpp_logo
  - `std::mutex` is separate from data.
  - Programmer ensures correct mutex is locked before data access.
  - Manual usage of `std::lock_guard<>` on `std::mutex`

  #colbreak()
  #rust_logo
  - `Mutex<T>` *owns* the data `T`.
  - `lock().unwrap()` returns a `MutexGuard` to access data.
  - `MutexGuard` ensures lock is held during data access and unlocks automatically.
]

== parameter passing

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    void pass_by_value(int x) {
      x = 10; // Modifies local copy
    }

    int main() {
      int a = 5;
      pass_by_value(a);
      // a is still 5
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn pass_by_value(mut x: i32) {
      x = 10; // Modifies local copy
    }

    fn main() {
      let a = 5;
      pass_by_value(a);
      // a is still 5
    }
    ```
  ])
]


== parameter passing <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    void pass_const_ref(const int& x) {
      // not allowed to modify x
      std::println("Value: {}", x);
    }

    int main() {
      int a = 5;
      pass_const_ref(a);
      // a is still 5
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn pass_const_ref(x: &i32) {
      // not allowed to modify x
      println!("Value: {}", x);
    }

    fn main() {
      let a = 5;
      pass_const_ref(&a);
      // a is still 5
    }
    ```
  ])
]

== parameter passing <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    void pass_by_mut_ref(int& x) {
      x = 10; // Modifies original
    }

    int main() {
      int a = 5;
      pass_by_mut_ref(a);
      // a is now 10
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn pass_by_mut_ref(x: &mut i32) {
      *x = 10; // Modifies original
    }

    fn main() {
      let mut a = 5;
      pass_by_mut_ref(&mut a);
      // a is now 10
    }
    ```
  ])
]

== parameter passing <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    void pass_ownership(std::unique_ptr<std::string> x) {
      fmt::println("Value in func: {}", x);
      // x now owns the data
    }

    int main() {
      auto p = std::make_unique<std::string>("hello");
      pass_ownership(std::move(p));
      // p is now nullptr (ownership transferred)
      // std::cout << *p; // Error: p is nullptr
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    fn pass_ownership(x: String) {
      println!("Value in func: {}", x);
      // x now owns the String
    }

    fn main() {
      let s = String::from("hello");
      pass_ownership(s);
      // s is moved and cannot be used here
      // println!("{}", s); // Error: borrow after move
    }
    ```
  ])
]

== returning errors

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, size: 0.8em, [
    ```cpp
    auto divide_expected(int num, int den)
             -> std::expected<float, std::string>
    {
      if (den == 0) {
        return std::unexpected("Division by zero");
      }
      return float(num) / float(den);
    }

    float divide_exception(int num, int den)
    {
      if (den == 0) {
        throw std::runtime_error("Division by zero");
      }
      return float(num) / float(den);
    }

    // std::terminate() for the severe errors
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    fn divide_result(num: i32, den: i32)
              -> Result<f32, String>
    {
      if den == 0 {
        Err(String::from("Division by zero"))
      }
      else {
        Ok(num as f32 / den as f32)
      }
    }

    // panic!("...") for the severe errors
    ```
  ])
]

// ------------------------- unique stuff -------------------------

= Features

== pattern matching

#rust_logo
#columns(2)[
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    enum Message {
      Quit,
      Move { x: i32, y: i32 },
      Write(String),
      Color(i32, i32, i32),
    }
    ```

  ])

  - `Quit` is a _unit variant_
  - `Move` is a _struct variant_
  - `Write` is a _tuple variant_ with 1 field
  - `Color` is a _tuple variant_ with 3 fields

  #codeblock(width: auto, size: 0.8em, [
    ```rust
    fn main() {
      let msg1 = Message::Move { x: 10, y: 20 };
      process_message(msg1);
      let msg2 = Message::Write(String::from("hello"));
      process_message(msg2);
    }
    ```
  ])

  #colbreak()
  #codeblock(width: auto, size: 0.8em, [
    ```rust
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
    ```
  ])
]

== attributes

#rust_logo
#columns(2)[
  #codeblock(width: auto, [
    ```
    #[derive(Debug)]
    ```
    ```rust
    struct Point {
        x: i32,
        y: i32,
    }

    fn main() {
        let p = Point { x: 10, y: 20 };
        println!("{:?}", p);
        // Prints: Point { x: 10, y: 20 }
    }
    ```
  ])

  #colbreak()
  - `#[inline(always)]`
  - `#[cold]`
  - `#[deprecated]`
  - `#[must_use]`
  - `#[track_caller]`
  - `#[allow(...)]`
  - `#[warn(...)]`
  - `#[deny(...)]`
  - `#[cfg(feature = "avx512")]`
]

== attributes <touying:hidden>

#columns(2)[
  #rust_logo
  #codeblock(width: auto, [
    ```
    #[test]
    ```
    ```rust
    fn test_my_function_1_2_3() {
        assert_eq!(my_function(1,2,3), 0);
    }

    ```
    ```
    #[test]
    #[should_panic]
    ```
    ```rust
    fn test_my_function_0_0_0() {
        my_function(0,0,0);
    }
    ```
  ])
]

// ------------------------- takeaways -------------------------

= Closing

== clinvoice-rs

  https://github.com/bartman/clinvoice-rs

- \~30 hours of learning and coding
- \~2k lines of `rust` \
  (4x the `zsh` version, but has more features, and it's easy on the eyes)
- AI generated unit tests

#ad.conclusion[
  Rust is pretty nice, if you don't try to do anything fancy
]

== thank you

#text(size:2em)[Any questions?]
