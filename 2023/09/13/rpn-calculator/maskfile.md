# Commands

## test

```bash
set -o errexit
set -o nounset
set -o pipefail

clang \
    -I ./src/ \
    ./src/rpn.c \
    -I"$UNITY_ROOT/src/" \
    "$UNITY_ROOT/src/unity.c" \
    -I"$UNITY_ROOT/extras/memory/src/" \
    "$UNITY_ROOT/extras/memory/src/unity_memory.c" \
    ./test/*.c \
    -o ./build/test_rpn

./build/test_rpn
```

### test watch

```sh
watchexec --clear --exts h,c -- $MASK test
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```bash
set -o errexit
set -o nounset
set -o pipefail

clang \
    -I ./src/ \
    ./src/*.c \
    -o ./build/rpn

./build/rpn "${NAME:-}"
```

## format

```sh
clang-format -i ./**/*.c
```

## update

```bash
set -o errexit
set -o nounset
set -o pipefail

nix flake update
direnv exec . \
    nix develop --command \
        devbox update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
