# Commands

## test

```sh
npm test
```

### test watch

```sh
npm run test:watch
```

## format

```sh
npm run format
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
npm run hello "$NAME"
```

## install

```sh
npm install
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
    npm update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
