# Commands

## test

```sh
pnpm test
```

### test watch

```sh
pnpm run test:watch
```

## lint

```sh
pnpm run lint
```

## format

```sh
pnpm run format
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
pnpm run hello "$NAME"
```

## install

```sh
pnpm install
```

## update

```bash
set -o errexit -o nounset -o pipefail -o errtrace

nix flake update
direnv exec . \
    devbox update
direnv exec . \
    corepack use pnpm@latest
direnv exec . \
    pnpm update --latest
```

---

<!-- markdownlint-disable-next-line MD045 -->

This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
