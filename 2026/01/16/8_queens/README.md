# Haskell with formatting, linting and test

Requirements

* Install [Nix](https://nixos.org)
  * Preferably with [`nix-installer`](https://determinate.systems/nix-installer/)
* Install [DirEnv](https://direnv.net)
* Install [Git](https://git-scm.com)

Then execute

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox haskell --path ./new_project
```

---

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

---

[Learn Haskell in Y Minutes](https://learnxinyminutes.com/docs/haskell/)

[Awesome Haskell](https://github.com/krispo/awesome-haskell#readme)

[Hoogle](https://hoogle.haskell.org)

---

<!-- markdownlint-disable-next-line MD045 -->
[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/haskell)
