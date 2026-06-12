{
  description = "Haskell with formatting, linting and test";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  # apply-refact is broken with newer version, use an old one that was working
  # https://github.com/NixOS/nixpkgs/blob/3242faf14b7611a62ce0f0071619438a08b65c12/pkgs/development/haskell-modules/configuration-ghc-9.10.x.nix#L68
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
            pkgs-apply-refact.haskellPackages.apply-refact.out # to apply linter suggestion
            haskell-language-server # to have help with modern IDE
            hspec.out # test framework
          ]
        );
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = [
            pkgs.devbox.out
            ghc.out # to execute Haskell
          ];
        };
      }
    );
}
