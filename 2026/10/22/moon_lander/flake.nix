{
  description = "Rust with formatting, linting and test";

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
        devShells.default = pkgs.mkShell {
          packages = import ./.config/nix/shells/default/packages.nix {
            inherit pkgs;
          };
        };

        devShells.update = pkgs.mkShellNoCC {
          packages = import ./.config/nix/shells/update/packages.nix {
            inherit pkgs;
          };
        };
      }
    );
}
