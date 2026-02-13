# TypeScript with formatting, linting and test on Deno

Requirements

- Install [Nix](https://nixos.org/download/#download-nix-accordion)
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

[Awesome Node.js](https://github.com/sindresorhus/awesome-nodejs#contents) not
Deno but still accurate

[Awesome JavaScript](https://github.com/sorrycc/awesome-javascript#readme)

---

<!-- markdownlint-disable-next-line MD045 -->

[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/typescript_deno)
