# Rust with formatting, linting and test

Requirements

* Install [Nix](https://nixos.org/download/#download-nix-accordion)
* Install [DirEnv](https://direnv.net)
* Install [Git](https://git-scm.com)

Then execute

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox rust --path ./new_project
```

---

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

---

[Learn Rust in Y Minutes](https://learnxinyminutes.com/docs/rust/)

[Awesome Rust](https://github.com/rust-unofficial/awesome-rust#readme)

[Roogle](https://roogle.hkmatsumoto.com)

---

<!-- markdownlint-disable-next-line MD045 -->
[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/rust)
