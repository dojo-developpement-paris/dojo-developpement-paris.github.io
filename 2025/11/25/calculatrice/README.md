# Python with formatting, typing and test

Requirements

* Install [Nix](https://nixos.org)
  * Preferably with [`nix-installer`](https://determinate.systems/nix-installer/)
* Install [DirEnv](https://direnv.net)
* Install [Git](https://git-scm.com)

Then execute

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix run "gitlab:pinage404/nix-sandboxes#v2" -- init --sandbox python --path ./new_project
```

---

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

---

[Learn Python in Y Minutes](https://learnxinyminutes.com/docs/python/)

[Awesome Python](https://github.com/vinta/awesome-python#readme)

[Awesome Python Typing](https://github.com/typeddjango/awesome-python-typing#readme)

---

<!-- markdownlint-disable-next-line MD045 -->
[Read code on GitLab ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes/-/tree/main/python)
