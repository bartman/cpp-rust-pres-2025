# Rust, first impressions for this C/C++ coder

This is a presentation I did on my first impressions of the Rust 🦀
programming language, as a veteran C/C++ systems programmer, for my
local C++ meetup group.

PDFs available in [release section](https://github.com/bartman/cpp-rust-pres-2025/releases).

## building

This presentation is done in [Typst](https://typst.app/docs/) markup language.

To build this presentation you can [install typst](https://github.com/typst/typst?tab=readme-ov-file#installation)
on your platforms from the [official release page](https://github.com/typst/typst/releases/).

On NixOS, you can something like:
```sh
❯ nix run 'nixpkgs#typst-live' -- -P 5599 -T main.typ
```
and point your browser at `http://127.0.0.1:5599/`.

