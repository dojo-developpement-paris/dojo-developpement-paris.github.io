# Commands

## test

```sh
pnpm test
```

### test watch

```sh
pnpm run test:watch
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
set -o errexit
set -o nounset
set -o pipefail

nix flake update
direnv exec . \
    devbox update
direnv exec . \
    pnpm update --latest
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->

This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
