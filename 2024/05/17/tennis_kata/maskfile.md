# Commands

## test

```sh
cabal test
```

### test watch

```sh
watchexec --clear -- $MASK test
```

## lint

```bash
set -o errexit
set -o nounset
set -o pipefail

for FILE in ./**/**.hs; do
    hlint "$FILE"
done
```

## format

```sh
fourmolu --mode inplace ./**/**.hs
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
if [ -n "$NAME" ]; then
    cabal run sandbox -- "$NAME"
else
    cabal run sandbox
fi
```

## install

```bash
set -o errexit
set -o nounset
set -o pipefail

INDEX_STATE=$(jq .nodes.nixpkgs.locked.lastModified ./flake.lock)
cabal update --index-state="@$INDEX_STATE"

cabal install --overwrite-policy=always
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
    cabal update
direnv exec . \
    cabal freeze
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
