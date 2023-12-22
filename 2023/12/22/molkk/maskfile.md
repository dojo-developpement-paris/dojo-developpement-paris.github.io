# Commands

## test

```sh
cargo test
```

### test watch

```sh
cargo watch --clear --exec test
```

## format

```sh
cargo fmt
```

## run

OPTIONS

- NAME
  - flags: --name
  - type: string

```sh
if [ -n "$NAME" ]; then
    cargo run -- "$NAME"
else
    cargo run
fi
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
    nix develop ".#update_rust_toolchain_to_the_latest_stable_version" --command \
        ./update_rust_toolchain_to_the_latest_stable_version.sh
direnv exec . \
    nix develop --command \
        cargo update
```

---

<!-- markdownlint-disable-next-line MD039 MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
