{
  description = "Forth with test";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.forth_foundation_library.url = "github:irdvo/ffl"; # foundation library for Forth including test framework
  inputs.forth_foundation_library.flake = false;

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      forth_foundation_library,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShell = pkgs.mkShellNoCC {
          packages = [
            pkgs.devbox.out
          ];

          FORTH_FOUNDATION_LIBRARY_SRC = forth_foundation_library; # path to the foundation library need to be in an environment variable to be able to compile with it
        };
      }
    );
}
