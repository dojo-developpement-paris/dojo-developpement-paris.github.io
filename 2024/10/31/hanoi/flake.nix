{
  description = "Common Lisp with formatting and test";

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

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.cl-nix-lite.url = "github:hraban/cl-nix-lite";

  inputs.fiveam-matchers.url = "github:tdrhq/fiveam-matchers";
  inputs.fiveam-matchers.flake = false;

  inputs.lisp-format.url = "github:eschulte/lisp-format";
  inputs.lisp-format.flake = false;

  outputs = { self, nixpkgs, flake-utils, cl-nix-lite, fiveam-matchers, lisp-format }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}".extend cl-nix-lite.overlays.default;
        lispPackagesLite = pkgs.lispPackagesLite;

        fiveam-matchers-derivation = lispPackagesLite.lispDerivation {
          lispSystem = "fiveam-matchers";
          src = fiveam-matchers;
          lispDependencies = [
            lispPackagesLite.fiveam
            lispPackagesLite.cl-ppcre
            lispPackagesLite.str
          ];
        };
        fiveam-matchers-package = (pkgs.callPackage (self: fiveam-matchers-derivation) { });

        lisp-format-packages = pkgs.writeShellScriptBin "lisp-format" ''
          export PATH="${pkgs.lib.makeBinPath [pkgs.emacs]}:$PATH"

          bash ${lisp-format}/lisp-format $*
        '';
      in
      {
        devShells.default = lispPackagesLite.lispDerivation {
          src = pkgs.lib.cleanSource ./.;
          lispSystem = "dev";
          lispDependencies = [
            lispPackagesLite.fiveam
            fiveam-matchers-package
          ];
          buildInputs = [
            pkgs.devbox
            lisp-format-packages
          ];
        };
      });
}
