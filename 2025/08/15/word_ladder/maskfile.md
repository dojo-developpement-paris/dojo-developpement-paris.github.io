# Commands

## test

```sh
cargo test
```

### test watch

```sh
bacon test
```

## lint

```sh
cargo clippy --fix \
    --allow-no-vcs --allow-dirty --allow-staged \
    -- \
    --deny clippy::all
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
set -o errexit -o nounset -o pipefail -o errtrace

nix flake update
direnv exec . \
    devbox update
direnv exec . \
    nix develop ".#update_rust_toolchain_to_the_latest_stable_version" --command \
        sh ./update_rust_toolchain_to_the_latest_stable_version.sh
direnv exec . \
    cargo update
```

---

<!-- markdownlint-disable-next-line MD045 -->
This folder has been setup from the [`nix-sandboxes`'s template ![](https://img.shields.io/gitlab/stars/pinage404/nix-sandboxes?style=social)](https://gitlab.com/pinage404/nix-sandboxes)
