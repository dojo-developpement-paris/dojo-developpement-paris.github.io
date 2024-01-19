{
  description = "Common Lisp with test";

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

  inputs.cl-nix-lite.url = "github:hraban/cl-nix-lite?rev=432ad69f2bf1b5d843e981b020922af54f1eb28c";
  inputs.cl-nix-lite.flake = false;

  outputs = { self, nixpkgs, flake-utils, cl-nix-lite }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        lispPackagesLite = import cl-nix-lite { inherit pkgs; };

        fiveam-matchers-derivation = lispPackagesLite.lispDerivation {
          name = "fiveam-matchers";
          lispSystem = "fiveam-matchers";
          src = (pkgs.fetchFromGitHub {
            owner = "tdrhq";
            repo = "fiveam-matchers";
            name = "fiveam-matchers-src";
            rev = "b18d5dfaf6d9577b0a7cd007cdc6d561f237db39";
            sha256 = "sha256-kJzMa5c28I0EdnAJ/zgtmMVRDhH+/pdWYwccxsqmiqE=";
          });
          lispDependencies = [
            lispPackagesLite.fiveam
            lispPackagesLite.cl-ppcre
            lispPackagesLite.str
          ];
        };
        fiveam-matchers = (pkgs.callPackage (self: fiveam-matchers-derivation) { });
      in
      {
        devShells.default = lispPackagesLite.lispDerivation {
          src = pkgs.lib.cleanSource ./.;
          lispSystem = "dev";
          lispDependencies = [
            lispPackagesLite.fiveam
            fiveam-matchers
          ];
          buildInputs = [
            pkgs.devbox
          ];
        };
      });
}
