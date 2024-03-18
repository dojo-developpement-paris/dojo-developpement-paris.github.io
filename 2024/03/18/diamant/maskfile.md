# Commands

## test

```sh
sbcl --script ./test/diamond_test.lisp
```

### test watch

```sh
watchexec --clear -- $MASK test
```

## repl

```sh
rlwrap sbcl
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
sbcl --script ./src/main.lisp "$NAME"
```

## update

```bash
set -o errexit
set -o nounset
set -o pipefail

nix flake update
direnv exec . \
    devbox update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->

This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
