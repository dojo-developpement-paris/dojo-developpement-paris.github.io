# Rust with formatting, linting and test

## Setup

### Automatic installation

Prefer this method for better reproducibility

Requirements :

* Install [Nix](https://nixos.org/download/#download-nix-accordion) : to install dependencies (NixOS is not required)
* Install [DirEnv](https://direnv.net) : to install dependencies and set environment variables
* Install [Git](https://git-scm.com) : to init the repository and commit the changes

Then execute :

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox rust --path ./new_project
```

### Manual installation

It is also possible to copy files and install everything necessary manually

But reproducibility cannot be guaranteed because you might install other software versions with compatibility issues

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=rust)
1. Open the folder

    ```sh
    cd ./rust
    ```

1. Install every dependency from the file `devbox.json`

## Commands

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

## Useful links

[Learn Rust in Y Minutes](https://learnxinyminutes.com/docs/rust/)

[Awesome Rust](https://github.com/rust-unofficial/awesome-rust#readme)

[Roogle](https://roogle.hkmatsumoto.com)

---

<!-- markdownlint-disable-next-line MD045 -->
[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/rust)
