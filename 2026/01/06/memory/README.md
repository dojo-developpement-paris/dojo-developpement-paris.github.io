# TypeScript with formatting, linting and test on Deno

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#WORKDIR=typescript_deno/https://gitlab.com/pinage404/nix-sandboxes)

<details>
<summary>⚠️ Gitpod will open the root folder</summary>

Due to
[some limitations of Gitpod](https://github.com/gitpod-io/gitpod/issues/5521),
we cannot simply open a sub-folder

Opening in Gitpod will open the root folder

Two terminals will be opened :

1. the first in the root folder
2. the second in the target folder

Both terminals automatically load the environment of their current folder

![Screenshot of Gitpod showing two terminals open, the second being open in the target folder](https://gitlab.com/pinage404/nix-sandboxes/-/raw/main/gitpod.png)

</details>

Requirements

- Install [Nix](https://nixos.org)
  - Preferably with
    [`nix-installer`](https://determinate.systems/nix-installer/)
- Install [DirEnv](https://direnv.net)
- Install [Git](https://git-scm.com)

Then execute

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox typescript_deno --path ./new_project
```

---

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

---

[Learn JavaScript in Y Minutes](https://learnxinyminutes.com/docs/javascript/)

[Learn TypeScript in Y Minutes](https://learnxinyminutes.com/docs/typescript/)

[Awesome Deno](https://github.com/denolib/awesome-deno)

[Awesome Node.JS](https://github.com/sindresorhus/awesome-nodejs#contents) not
Deno but still accurate

[Awesome JavaScript](https://github.com/sorrycc/awesome-javascript#readme)

---

<!-- markdownlint-disable-next-line MD045 -->

[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/typescript_deno)
