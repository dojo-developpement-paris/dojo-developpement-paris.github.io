# Forth with test

## Setup

### Automatic installation

<details name="installation">
<summary>Toggle instructions</summary>

Prefer this method for better reproducibility

Requirements :

* Install [Nix](https://nixos.org/download/#download-nix-accordion) package manager : to install dependencies (NixOS is not required)
* Install [DirEnv](https://direnv.net) : to install dependencies and set environment variables
* Install [Git](https://git-scm.com) : to init the repository and commit the changes

Then execute :

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox forth --path ./new_project
```

</details>

### Dev Containers installation

<details name="installation">
<summary>Toggle instructions</summary>

Requirements :

* Verify that your [editor support Dev Containers](https://containers.dev/supporting#editors)

Steps :

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=forth)

    ```sh
    curl https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=forth --output=forth.zip
    ```

1. Extract the archive

    ```sh
    unzip forth.zip
    ```

1. Open the folder with your editor

    ```sh
    $EDITOR ./nix-sandboxes-main-forth/forth
    ```

1. Follow instruction of your editor to open Dev Container

Note :
this installation method will download dependencies in a container ;
this is less optimal than the automatic installation
which share same dependencies across projects

</details>

### Manual installation

<details name="installation">
<summary>Toggle instructions</summary>

It is also possible to copy files and install everything necessary manually

But reproducibility cannot be guaranteed because you might install other software versions with compatibility issues

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=forth)

    ```sh
    curl https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=forth --output=forth.zip
    ```

1. Extract the archive

    ```sh
    unzip forth.zip
    ```

1. Open the folder

    ```sh
    cd ./nix-sandboxes-main-forth/forth
    ```

1. Install every dependency from the file [`devbox.json`](./devbox.json)
1. Install the Forth Foundation Library

    ```sh
    git clone https://github.com/irdvo/ffl
    FORTH_FOUNDATION_LIBRARY_SRC="$PWD/ffl"
    ```

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

[Learn Forth in Y Minutes](https://learnxinyminutes.com/docs/forth/)

[Awesome Forth](https://github.com/lassik/awesome-forth#readme)

[Gforth cheat sheet](https://gist.github.com/rickcarlino/9578850)

[GForth](https://gforth.org)

[Forth Foundation Library](https://irdvo.nl/FFL/)

---

<!-- @IGNORE:APOS_SPACE_CONTRACTION@ -->
This folder has been set up from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes) ;
[Read the code on GitLab](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/forth)
