# Common Lisp with formatting and test

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#WORKDIR=common_lisp/https://gitlab.com/pinage404/nix-sandboxes)

<details>
<summary>⚠️ Gitpod will open the root folder</summary>

Due to [some limitations of Gitpod](https://github.com/gitpod-io/gitpod/issues/5521), we cannot simply open a sub-folder

Opening in Gitpod will open the root folder

Two terminals will be opened :

1. the first in the root folder
2. the second in the target folder

Both terminals automatically load the environment of their current folder

![Screenshot of Gitpod showing two terminals open, the second being open in the target folder](https://gitlab.com/pinage404/nix-sandboxes/-/raw/main/gitpod.png)

</details>

Or with [Nix](https://nixos.org)

```sh
NIX_CONFIG="extra-experimental-features = flakes nix-command" \
nix flake new --template "gitlab:pinage404/nix-sandboxes#common_lisp" ./your_new_project_directory
```

---

[Available commands](./maskfile.md)

Or just execute

```sh
mask help
```

---

[Learn Common Lisp in Y Minutes](https://learnxinyminutes.com/docs/common-lisp/)

[Awesome Common Lisp](https://github.com/CodyReichert/awesome-cl#readme)

[FiveAM](https://common-lisp-libraries.readthedocs.io/fiveam/)

[FiveAM-Matchers](https://github.com/tdrhq/fiveam-matchers)
