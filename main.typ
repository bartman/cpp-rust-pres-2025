#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#import "@preview/touying:0.6.1" as ty
#import "@preview/gentle-clues:1.2.0" as ad

// Font settings
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Rust, first impressions],
    subtitle: [for this C/C++ coder],
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
  body
) = {
  show raw: set text(fill: color, size: size)
  block(
    fill: fill,
    stroke: stroke,
    radius: radius,
    inset: inset,
    width: width,
    body
  )
}

#show raw: set text(fill: rgb(0,92,0))

#let cpp_logo = [#align(left)[#text(size: 2em, fill: blue)[#"\u{e61d}"]]#v(-2.0em)]
#let rust_logo = [#align(left)[#text(size: 2em, fill: rgb(206,66,43))[#"\u{e7a8}"]]#v(-2.0em)]

// ------------------------- title -------------------------

#title-slide()

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

== clinvoice <touying:hidden>

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

== clinvoice <touying:hidden>

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

    ❯ ls -l target/debug/hello_world
    .rwxr-xr-x 510k bart  9 Aug 12:00  ...
    ```
  ])

  #codeblock(color: gray, [
    ```
    ❯ ls -l hello-c hello-cpp
    .rwxr-xr-x  17k bart  9 Aug 12:01  c
    .rwxr-xr-x  35k bart  9 Aug 12:02  cpp
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

  #codeblock([
    ```rust
    fn thief(s: String) {
        println!("thief: {}", s);
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
    || 7  |     let s = String::from("hello");
    ||    |         - move occurs because `s` has type `String`,
    ||    |           which does not implement the `Copy` trait
    || ...
    || 11 |     thief(s);
    ||    |           - value moved here
    || ...
    || 13 |     println!("after: {}", s);
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

== defaults <touying:hidden>

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

== loops

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    for (auto i = 0; i < 10; i++) {
      // ...
    }

    for (auto i = 0; i < 10; i += 2) {
      // ...
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    for i in 0..10 {
      // ...
    }

    for i in (0..10).step_by(2) {
      // ...
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
    #include <string>
    #include <iostream>

    void main() {
      std::string s1 = "Hello";

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
    #include <string_view>

    void main() {
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

== ownership

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <memory>

    void main() {
      // Unique ownership
      auto p1 = std::make_unique<int>(5);
      // Transfer ownership
      auto p2 = std::move(p1);
      // p1 is now nullptr
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn main() {
      // Unique ownership
      let b1 = Box::new(5);
      // Transfer ownership
      let b2 = b1;
      // b1 is moved and cannot be used
    }
    ```
  ])
]

== ownership <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <memory>

    void main() {
      // Shared ownership
      auto sp1 = std::make_shared<int>(5);
      // Create another reference
      auto sp2 = sp1;
      // Ref count is 2
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    use std::rc::Rc;

    fn main() {
      // Shared ownership (not thread-safe)
      let rc1 = Rc::new(5);
      // Create another reference
      let rc2 = Rc::clone(&rc1);
      // Ref count is 2
    }
    ```
  ])
]

== ownership <touying:hidden>

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    #include <memory>
    #include <thread>
    #include <atomic>

    void main() {
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
      let arc = Arc::new(Mutex::new(0));
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

== OOO

#columns(2)[
  #cpp_logo
  #codeblock(width: auto, [
    ```cpp
    class Point {
    public:
      float x, y;
      explicit Point(float x, float y)
        : x(x), y(y) {}
    };

    Point p(1.0, 2.0);
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    struct Point {
      x: f32,
      y: f32,
    }

    impl Point {
      fn new(x: f32, y: f32) -> Self {
        Self { x, y }
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
    public:
      float r;
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
  #codeblock(width: auto, [
    ```cpp
    int main() {
      std::mutex m;
      int counter = 0;

      auto increment = [&]() {
        std::lock_guard<std::mutex> lock(m);
        counter++;
      };

      std::thread t1(increment);
      std::thread t2(increment);
      t1.join();
      t2.join();
      std::cout << counter; // 2
      return 0;
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    fn increment_counter(counter: Arc<Mutex<i32>>) {
      let mut num = counter.lock().unwrap();
      *num += 1;
    }

    fn main() {
      let counter = Arc::new(Mutex::new(0));
      let clone1 = Arc::clone(&counter);
      let clone2 = Arc::clone(&counter);

      let handle1 = thread::spawn(move || {
        increment_counter(clone1); });

      let handle2 = thread::spawn(move || {
        increment_counter(clone2); });

      handle1.join().unwrap();
      handle2.join().unwrap();

      // *counter.lock().unwrap() is 2
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
  #codeblock(width: auto, [
    ```cpp
    void pass_ownership(std::unique_ptr<int> x) {
      std::cout << "Value in func: " << *x << std::endl;
      // x now owns the data
    }

    int main() {
      auto p = std::make_unique<int>(5);
      pass_ownership(std::move(p));
      // p is now nullptr (ownership transferred)
      // std::cout << *p; // Error: p is nullptr
    }
    ```
  ])

  #colbreak()
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    fn pass_ownership(x: String) {
      println!("Value in func: {}", x);
      // x now owns the String
    }

    fn main() {
      let s = String::from("hello");
      pass_ownership(s);
      // s is moved and cannot be used here
      // println!("{}", s); // Error: value borrowed here after move
    }
    ```
  ])
]

// ------------------------- unique stuff -------------------------

= Features

== pattern matching

#columns(2)[
  #rust_logo
  #codeblock(width: auto, size: 0.8em, [
    ```rust
    enum Message {
      Quit,
      Move { x: i32, y: i32 },
      Write(String),
      ChangeColor(i32, i32, i32),
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
        Message::ChangeColor(r, g, b) => {
          println!("r,g,b={},{},{}", r, g, b);
        }
      }
    }

    fn main() {
      let msg1 = Message::Move { x: 10, y: 20 };
      process_message(msg1);
      let msg2 = Message::Write(String::from("hello"));
      process_message(msg2);
    }
    ```
  ])
]

== attributes

#columns(2)[
  #rust_logo
  #codeblock(width: auto, [
    ```rust
    #[derive(Debug)]
    struct Point {
        x: i32,
        y: i32,
    }

    fn main() {
        let p = Point { x: 10, y: 20 };
        println!("{:?}", p); // Prints: Point { x: 10, y: 20 }
    }
    ```
  ])
]

== attributes <touying:hidden>

#columns(2)[
  #rust_logo
  #codeblock(width: auto, [
    ```cpp
    #[test]
    fn test_my_function_1_2_3() {
        assert_eq!(my_function(1,2,3), 0);
    }

    #[test]
    #[should_panic]
    fn test_my_function_0_0_0() {
        my_function(0,0,0);
    }
    ```
  ])
]

// ------------------------- takeaways -------------------------

= Closing

== clinvoice

  https://github.com/bartman/clinvoice-rs

- \~2k lines of `rust` \
  (4x the `zsh` version, but has more features, and it's easy on the eyes)
- AI generated unit tests

#ad.conclusion[
  Rust is pretty nice, if you don't try to do anything fancy
]

== Thank you

Any questions?
