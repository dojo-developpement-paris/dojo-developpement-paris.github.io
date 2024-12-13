# Commands

## test

```bash
set -o errexit
set -o nounset
set -o pipefail

clang \
    -O2 \
    -std=c18 \
    -I ./src/ \
    ./src/hello.c \
    -I"$UNITY_ROOT/src/" \
    "$UNITY_ROOT/src/unity.c" \
    ./test/*.c \
    -o ./build/test_hello \
    -Wall \
    -Wextra \
    -Werror \
    -pedantic

./build/test_hello
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
    -O2 \
    -std=c18 \
    -I ./src/ \
    ./src/*.c \
    -o ./build/hello \
    -Wall \
    -Wextra \
    -Werror \
    -pedantic

./build/hello "${NAME:-}"
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
    devbox update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
