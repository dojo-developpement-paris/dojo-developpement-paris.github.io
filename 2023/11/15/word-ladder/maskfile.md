# Commands

## test

```sh
python -m pytest
```

### test watch

```sh
watchexec --clear --exts py -- $MASK test
```

## lint

```bash
set -o errexit
set -o nounset
set -o pipefail

flake8
mypy .
```

## format

```bash
set -o errexit
set -o nounset
set -o pipefail

black .
isort .
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
python ./src/hello.py "$NAME"
```

## install

```sh
poetry install
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
direnv exec . \
    nix develop --command \
        poetry update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
