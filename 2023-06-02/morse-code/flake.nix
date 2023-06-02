{
  description = "Rogue genealogie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    flake-utils.url  = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    naersk.url = "github:nmattia/naersk/master";
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, naersk }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        naersk-lib = naersk.lib."${system}".override {
          cargo = pkgs.rust-bin.stable.latest.default;
          rustc = pkgs.rust-bin.stable.latest.default;
        };

      name = "rogue-genealogie";
      in rec {

        devShells = {
          default = with pkgs; mkShell {
            buildInputs = with pkgs; [
              rustc
              cargo
              rustfmt
              rust-analyzer
              clippy
            ];
          };
        };
      }
    );
}

