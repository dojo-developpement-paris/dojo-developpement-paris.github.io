# Commands

## test

```sh
deno test
```

### test watch

```sh
deno test --watch
```

## lint

```sh
deno lint
```

## format

```sh
deno fmt
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
deno run ./src/main.ts "$NAME"
```

## install

```sh
deno cache ./src/dev_deps.ts
```

## update

```bash
set -o errexit -o nounset -o pipefail -o errtrace

nix flake update
direnv exec . \
    devbox update
```

---

<!-- markdownlint-disable-next-line MD045 -->

This folder has been setup from the
[`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
