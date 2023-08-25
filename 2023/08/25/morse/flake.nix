{
  description = "Rust with formatting, linting and test";

  # broken on Fish
  # as a workaround, use `nix develop` the first time
  # https://github.com/direnv/direnv/issues/1022
  # nixConfig.extra-substituters = [
  #   "https://pinage404-nix-sandboxes.cachix.org"
  #   "https://git-gamble.cachix.org"
  # ];
  # nixConfig.extra-trusted-public-keys = [
  #   "pinage404-nix-sandboxes.cachix.org-1:5zGRK2Ou+C27E7AdlYo/s4pow/w39afir+KRz9iWsZA="
  #   "git-gamble.cachix.org-1:afbVJAcYMKSs3//uXw3HFdyKLV66/KvI4sjehkdMM/I="
  # ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.flake-compat.url = "github:edolstra/flake-compat";
  inputs.flake-compat.flake = false;

  inputs.rust-overlay.url = "github:oxalica/rust-overlay";
  inputs.rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  inputs.rust-overlay.inputs.flake-utils.follows = "flake-utils";

  inputs.crane.url = "github:ipetkov/crane";
  inputs.crane.inputs.nixpkgs.follows = "nixpkgs";
  inputs.crane.inputs.flake-utils.follows = "flake-utils";
  inputs.crane.inputs.flake-compat.follows = "flake-compat";
  inputs.crane.inputs.rust-overlay.follows = "rust-overlay";

  inputs.git-gamble.url = "gitlab:pinage404/git-gamble";
  inputs.git-gamble.inputs.nixpkgs.follows = "nixpkgs";
  inputs.git-gamble.inputs.flake-utils.follows = "flake-utils";
  inputs.git-gamble.inputs.flake-compat.follows = "flake-compat";
  inputs.git-gamble.inputs.rust-overlay.follows = "rust-overlay";
  inputs.git-gamble.inputs.crane.follows = "crane";

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , flake-compat
    , rust-overlay
    , crane
    , git-gamble
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          rust-overlay.overlays.default
        ];
      };

      rust-toolchain = (pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml);

      devShell = pkgs.mkShell {
        packages = [
          rust-toolchain
          pkgs.cargo-watch
          pkgs.rustup

          pkgs.mask
        ];
      };

      craneLib = (crane.mkLib pkgs).overrideToolchain rust-toolchain;

      src = craneLib.cleanCargoSource ./.;

      rust-dependencies = craneLib.buildDepsOnly {
        inherit src;
      };

      rust-package-binary = craneLib.buildPackage {
        inherit src;
        cargoArtifacts = rust-dependencies;

        doCheck = false;
      };

      app = flake-utils.lib.mkApp {
        drv = rust-package-binary;
      };
    in
    {
      # run with `nix develop`
      devShells.default = devShell;
      devShells.with_git-gamble = pkgs.mkShell {
        inputsFrom = [
          self.devShells."${system}".default
        ];

        packages = [
          git-gamble.packages."${system}".git-gamble
        ];
      };
      devShells.update_rust_toolchain_to_the_latest_stable_version = pkgs.mkShell {
        packages = [
          pkgs.sd
          pkgs.ripgrep
          pkgs.curl
          pkgs.coreutils
        ];
      };

      # run with `nix shell`
      packages.default = rust-package-binary;

      # run with `nix run`
      apps.default = app;
    });
}
