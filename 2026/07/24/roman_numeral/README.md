# Rust with formatting, linting and test

## Setup

### Automatic installation

Prefer this method for **better reproducibility**

<details name="installation">
<summary>Toggle instructions</summary>

Requirements :

* Install [Nix](https://nixos.org/download/#download-nix-accordion) package manager : to install dependencies (NixOS is not required)
* Install [DirEnv](https://direnv.net) : to install dependencies and set environment variables
* Install [Git](https://git-scm.com) : to init the repository and commit the changes

Then execute :

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox rust --path ./new_project
```

</details>

### Dev Containers installation

Prefer this method if you want to **isolate the file system**

<details name="installation">
<summary>Toggle instructions</summary>

Requirements :

* Verify that your [editor support Dev Containers](https://containers.dev/supporting#editors)

Steps :

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=rust)

    ```sh
    curl "https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=rust" --output=rust.zip
    ```

1. Extract the archive

    ```sh
    unzip rust.zip
    ```

1. Open the folder with your editor

    ```sh
    ${EDITOR:-echo '$EDITOR environment variable is not settled, open manually'} ./nix-sandboxes-main-rust/rust
    ```

1. Follow instruction of [your editor to open Dev Container](https://containers.dev/supporting#editors)

Note :
this installation method will download dependencies in a container ;
this is less optimal than the automatic installation
which share same dependencies across projects

</details>

### Manual installation

Prefer this method if you **can't use Nix** and **can't use Dev Containers**

You need to **know how to install dependencies** with compatible versions using your own package manager

<details name="installation">
<summary>Toggle instructions</summary>

It is also possible to copy files and install everything necessary manually

But reproducibility cannot be guaranteed because you might install other software versions with compatibility issues

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=rust)

    ```sh
    curl "https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=rust" --output=rust.zip
    ```

1. Extract the archive

    ```sh
    unzip rust.zip
    ```

1. Open the folder

    ```sh
    cd ./nix-sandboxes-main-rust/rust
    ```

1. Install every dependency with your package manager (Brew, APT, Mise, Chocolatey...) from the file [`devbox.json`](./devbox.json)
1. Run the tests

    ```sh
    mask test
    ```

</details>

## Commands

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

## Useful links

[Rust](https://www.rust-lang.org) language

[rustup](https://rustup.rs) toolchain

[Cargo](https://doc.rust-lang.org/cargo/) package manager, compiler

[Rustfmt](https://rust-lang.github.io/rustfmt/) formatter

[Clippy](https://doc.rust-lang.org/stable/clippy/index.html) linter

[speculoos](https://github.com/oknozor/speculoos) test assertion library

[Learn Rust in Y Minutes](https://learnxinyminutes.com/docs/rust/)

[Search for a package with Crates](https://crates.io)

[Awesome Rust](https://github.com/rust-unofficial/awesome-rust#readme)

[Roogle](https://roogle.hkmatsumoto.com) search function

---

<!-- @IGNORE:APOS_SPACE_CONTRACTION@ -->
This folder has been set up from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://nix-sandboxes.is-cool.dev) ;
[Read the code on GitLab](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/rust)
