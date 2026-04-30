# TypeScript with formatting, linting and test on Deno

## Setup

### Automatic installation

Prefer this method for better reproducibility

Requirements :

- Install [Nix](https://nixos.org/download/#download-nix-accordion) : to install
  dependencies (NixOS is not required)
- Install [DirEnv](https://direnv.net) : to install dependencies and set
  environment variables
- Install [Git](https://git-scm.com) : to init the repository and commit the
  changes

Then execute :

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox typescript_deno --path ./new_project
```

### Manual installation

It is also possible to copy files and install everything necessary manually

But reproducibility cannot be guaranteed because you might install other
software versions with compatibility issues

1. [Download the folder](https://gitlab.com/pinage404/nix-sandboxes/-/archive/main/nix-sandboxes-main.zip?ref_type=heads&path=typescript_deno)
1. Open the folder

   ```sh
   cd ./typescript_deno
   ```

1. Install every dependency from the file `devbox.json`
1. Install Deno dependencies

   ```sh
   deno cache ./src/dev_deps.ts
   ```

## Commands

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

## Useful links

[Learn JavaScript in Y Minutes](https://learnxinyminutes.com/docs/javascript/)

[Learn TypeScript in Y Minutes](https://learnxinyminutes.com/docs/typescript/)

[Awesome Deno](https://github.com/denolib/awesome-deno)

[Awesome Node.js](https://github.com/sindresorhus/awesome-nodejs#contents) not
Deno but still accurate

[Awesome JavaScript](https://github.com/sorrycc/awesome-javascript#readme)

---

<!-- markdownlint-disable-next-line MD045 -->

[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/typescript_deno)
