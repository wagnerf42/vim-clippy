# vim-clippy
This is a vim plugin for cargo the rust package manager

## Features
* [Syntastic](https://github.com/scrooloose/syntastic) checker: while [this](https://github.com/rust-lang/rust.vim/blob/master/syntax_checkers/rust/rustc.vim) part of [rust.vim](https://github.com/rust-lang/rust.vim) can be used to syntax check one file, the syntax checker of vim-clippy will provide whole project based syntax checking using [cargo clippy](https://github.com/arcnmx/cargo-clippy). This plugin is derived from [cargo.vim](https://github.com/Nonius/cargo.vim/)

## Install
Install [syntastic](https://github.com/scrooloose/syntastic), follow the instructions there.
Install [cargo clippy](https://github.com/arcnmx/cargo-clippy) easily using *cargo install clippy*.
Of course, it requires rust-nightly.
Then install this plugin.

You can select amongst different rust checkers using:
*let g:syntastic_rust_checkers = ['clippy']*

## License

vim-clippy is primarily distributed under the terms of both the MIT license
and the Apache License (Version 2.0).

See LICENSE-APACHE and LICENSE-MIT for details.
