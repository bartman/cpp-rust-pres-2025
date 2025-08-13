//#import "theme/src/lib.typ" as uc

#import "@preview/touying:0.6.1": *
//#import themes.simple: *
//#import themes.metropolis: *
#import themes.stargazer: *

#import "@preview/touying:0.6.1" as ty
#import "@preview/gentle-clues:1.2.0" as ad

// Font settings
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")

/*
#show: uc.ucph-metropolis-theme.with(
  language: "en",
  ty.config-info(
    title: [Rust, first impressions],
    subtitle: [for this C/C++ coder],
    author: [Bart Trojanowski],
    date: datetime.today(),
    institution: [CppOttawa],
    logo: emoji.crab,
  ),
)
*/
/*
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [Simple slides],
)
*/
//#show: metropolis-theme.with(
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

// ------------------------- title -------------------------

#title-slide()

// ------------------------- outline -------------------------

/*
== Contents <touying:hidden>

#show outline.entry: it => link(
  it.element.location(),
  it.indented(it.prefix(), it.body()),
)

#ty.slide[
  #set align(left)
  #columns(2)[
    #outline()
  ]
]
*/

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

    [#text(size: 2em)[#"\u{f17c}"]], [29yr],
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
- LibreOffice spreadsheets/docs

unrelated
- switched from `bash` to `zsh`
- wanted to learn it better

#ad.idea[
  write an invoicing app in `zsh`
]

== clinvoice <touying:hidden>

  #codeblock(color: green, [
```
❯ cli generate -t pdf -s 1 201011
...
Output written on bnl-20101103-1.pdf.
```
])

#columns(2)[

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
    #image("images/invoice-1.png", width: 80%)
  ])
]

== clinvoice <touying:hidden>

- \~500 lines of zsh
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
    Compiling hello_world v0.1.0 (example1)
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

== defaults

TOOD: static vs pub
TOOD: const vs mut

== strings

TODO: const char \*

== strings <touying:hidden>

TODO: std::string

== strings <touying:hidden>

TODO: std::string_view

== containers

TODO: vec vs array
TODO: iterators

== polymorphism

TODO: subclasses vs interfaces

== generics

TODO: ...

// ------------------------- unique stuff -------------------------

= Features

== matching

foo

== bar

bar

// ------------------------- takeaways -------------------------

= Takeaways

== foo

foo

== bar

bar

