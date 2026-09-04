# TypeScript with formatting and test with Vitest on NodeJS

[![Depfu](https://badges.depfu.com/badges/30a64c3d6317249ebbb2b0d9b64324bd/count.svg)](https://depfu.com/gitlab/pinage404/nix-sandboxes?project_id=40505)

---

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
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox typescript_node_vitest --path ./new_project
```

</details>

### Dev Containers installation

Prefer this method if you want to **isolate the file system**

<details name="installation">
<summary>Toggle instructions</summary>

Requirements :

* Verify that your [editor support Dev Containers](https://containers.dev/supporting#editors)

Steps :

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=typescript_node_vitest)

    ```sh
    curl "https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=typescript_node_vitest" --output=typescript_node_vitest.zip
    ```

1. Extract the archive

    ```sh
    unzip typescript_node_vitest.zip
    ```

1. Open the folder with your editor

    ```sh
    ${EDITOR:-echo '$EDITOR environment variable is not settled, open manually'} ./nix-sandboxes-main-typescript_node_vitest/typescript_node_vitest
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

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=typescript_node_vitest)

    ```sh
    curl "https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=typescript_node_vitest" --output=typescript_node_vitest.zip
    ```

1. Extract the archive

    ```sh
    unzip typescript_node_vitest.zip
    ```

1. Open the folder

    ```sh
    cd ./nix-sandboxes-main-typescript_node_vitest/typescript_node_vitest
    ```

1. Install every dependency with your package manager (Brew, APT, Mise, Chocolatey...) from the file [`.config/nix/shells/default/packages.nix`](.config/nix/shells/default/packages.nix)
1. Install `pnpm` dependencies

    ```sh
    pnpm install
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

[TypeScript](https://www.typescriptlang.org/) language

[NodeJS](https://nodejs.org) JavaScript runtime

[PNPM](https://pnpm.io) package manager

[vite-node](https://github.com/vitest-dev/vitest/tree/main/packages/vite-node) compiler

[Prettier](https://prettier.io) formatter

[Oxlint](https://oxc.rs/docs/guide/usage/linter.html) linter

[Vitest](https://vitest.dev) test framework

[Learn JavaScript in Y Minutes](https://learnxinyminutes.com/docs/javascript/)

[Learn TypeScript in Y Minutes](https://learnxinyminutes.com/docs/typescript/)

[Search for a package with npm](https://www.npmjs.com)

[Awesome Node.JS](https://github.com/sindresorhus/awesome-nodejs#contents)

[Awesome JavaScript](https://github.com/sorrycc/awesome-javascript#readme)

---

<!-- @IGNORE:APOS_SPACE_CONTRACTION@ -->
This folder has been set up from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://nix-sandboxes.is-cool.dev) ;
[Read the code on GitLab](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/typescript_node_vitest)
