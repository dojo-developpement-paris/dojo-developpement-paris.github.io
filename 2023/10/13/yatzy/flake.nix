{
  description = "C with formatting and test";

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

  inputs.unity.url = "github:ThrowTheSwitch/Unity";
  inputs.unity.flake = false;

  outputs = { self, nixpkgs, flake-utils, unity }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.devbox
          ];

          shellHook = ''
            export UNITY_ROOT="${unity}"
          '';
        };
      });
}
