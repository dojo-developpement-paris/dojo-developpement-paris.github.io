# Commands

## test

```sh
pytest
```

### test watch

```sh
watchexec --clear --exts py -- $MASK test
```

## lint

```bash
set -o errexit -o nounset -o pipefail -o errtrace

ruff check --fix
mypy .
```

## format

```sh
ruff format
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
set -o errexit -o nounset -o pipefail -o errtrace

nix flake update
direnv exec . \
    devbox update
direnv exec . \
    poetry update
```

---

<!-- markdownlint-disable-next-line MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
