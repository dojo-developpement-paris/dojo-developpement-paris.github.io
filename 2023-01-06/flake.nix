{
  description = "ELM with formatting, linting and test";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShell = pkgs.mkShell {
          packages = [
            pkgs.elmPackages.elm
            pkgs.elmPackages.elm-format
            pkgs.elmPackages.elm-test-rs
            pkgs.elmPackages.nodejs # elm-test-rs need node
            pkgs.elmPackages.elm-json
            pkgs.nodejs
          ];
        };
      });
}
