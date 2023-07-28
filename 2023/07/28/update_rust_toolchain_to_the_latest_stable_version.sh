#!/usr/bin/env bash

set -o errexit
set -o pipefail

fetch_stable_channel() {
    curl \
        --silent \
        --show-error \
        --location \
        https://static.rust-lang.org/dist/channel-rust-stable.toml
}

get_version() {
    rg \
        --after-context 1 \
        '\[pkg\.rustc\]' |
        tail \
            --lines=1 |
        sd \
            '.+"(?P<version>[0-9.]+) .+' \
            '$version'
}

get_latest_stable_version() {
    fetch_stable_channel |
        get_version
}

update_rust_toolchain_to_the_latest_stable_version() {
    sd \
        'channel = "[0-9.]+"' \
        "channel = \"$(get_latest_stable_version)\"" \
        rust-toolchain.toml
}

update_rust_toolchain_to_the_latest_stable_version
