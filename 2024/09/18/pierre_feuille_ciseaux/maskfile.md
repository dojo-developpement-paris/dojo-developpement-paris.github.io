# Commands

## test

```bash
set -o errexit
set -o nounset
set -o pipefail

clang++ \
    -O0 \
    -std=c++20 \
    -I ./src/ \
    ./src/hello.cpp \
    ./test/*.cpp \
    -o ./build/test_hello \
    -fexperimental-library \
    -fsanitize=undefined,address \
    -Wno-#warnings \
    -Wall \
    -Wextra \
    -Werror \
    -pedantic

./build/test_hello
```

### test watch

```sh
watchexec --clear --exts h,cpp -- $MASK test
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

clang++ \
    -O0 \
    -std=c++20 \
    -I ./src/ \
    ./src/*.cpp \
    -o ./build/hello \
    -fexperimental-library \
    -fsanitize=undefined,address \
    -Wall \
    -Wextra \
    -Werror \
    -pedantic

./build/hello "${NAME:-}"
```

## format

```sh
clang-format -i ./**/*.cpp
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
