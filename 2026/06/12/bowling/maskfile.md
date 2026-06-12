# Commands

## test

```bash
set -o errexit -o nounset -o pipefail -o errtrace

GFORTH_VERSION_FULL="$(gforth --version 2>&1)"
GFORTH_VERSION="$(cut --fields=2 --delimiter=' ' <<<"$GFORTH_VERSION_FULL")"

GFORTHPATH="${GFORTHPATH:-.}"
GFORTHPATH+=":$DEVBOX_PACKAGES_DIR/lib/gforth/site-forth/"
GFORTHPATH+=":$DEVBOX_PACKAGES_DIR/lib/gforth/$GFORTH_VERSION/"
GFORTHPATH+=":$DEVBOX_PACKAGES_DIR/share/gforth/$GFORTH_VERSION/"
GFORTHPATH+=":$DEVBOX_PACKAGES_DIR/usr/share/gforth/site-forth/"
GFORTHPATH+=":$FORTH_FOUNDATION_LIBRARY_SRC/"
export GFORTHPATH

gforth-itc ./src/**_tests.fs
```

### test watch

```sh
# shellcheck disable=SC2086
watchexec --clear -- $MASK test
```

## update

```bash
set -o errexit -o nounset -o pipefail -o errtrace

nix flake update
direnv exec . \
    devbox update
```

---

<!-- markdownlint-disable-next-line MD045 @IGNORE:APOS_SPACE_CONTRACTION@ -->
This folder has been set up from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
