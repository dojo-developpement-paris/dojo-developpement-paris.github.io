{
  description = "Rust with formatting, linting and test";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = [
            pkgs.devbox.out
          ];
        };

        devShells.update_rust_toolchain_to_the_latest_stable_version = pkgs.mkShellNoCC {
          packages = [
            pkgs.bashNonInteractive.out
            pkgs.sd
            pkgs.ripgrep
            pkgs.curlMinimal.bin
            pkgs.coreutils.out
          ];
        };
      }
    );
}
