{
  description = "Haskell with formatting, linting and test";

  # broken on Fish
  # as a workaround, use `nix develop` the first time
  # https://github.com/direnv/direnv/issues/1022
  # nixConfig.extra-substituters = [
  #   "https://pinage404-nix-sandboxes.cachix.org"
  # ];
  # nixConfig.extra-trusted-public-keys = [
  #   "pinage404-nix-sandboxes.cachix.org-1:5zGRK2Ou+C27E7AdlYo/s4pow/w39afir+KRz9iWsZA="
  # ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.nixpkgs-apply-refact.url = "github:NixOS/nixpkgs?rev=f4b140d5b253f5e2a1ff4e5506edbf8267724bde";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-apply-refact,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        pkgs-apply-refact = nixpkgs-apply-refact.legacyPackages."${system}";
        ghc = pkgs.haskellPackages.ghcWithPackages (
          haskellPackages: with haskellPackages; [
            pkgs-apply-refact.haskellPackages.apply-refact
            haskell-language-server
            hspec
          ]
        );
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = [
            pkgs.devbox
            ghc
          ];
        };
      }
    );
}
