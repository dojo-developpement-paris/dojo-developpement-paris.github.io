{
  description = "TypeScript with formatting and test with Vitest on NodeJS";

  inputs.nixpkgs-multiverse.url = "github:fzakaria/nixpkgs-multiverse";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs-multiverse,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        multiverse = nixpkgs-multiverse.multiverse."${system}";
        pkgs = multiverse.tip;
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = import ./.config/nix/shells/default/packages.nix {
            inherit pkgs;
          };
        };
      }
    );
}
