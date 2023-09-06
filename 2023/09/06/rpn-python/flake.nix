{
  description = "Simple Python environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... } :
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {inherit system; };

      # Specify which version of Python to use
      pythonVer = pkgs.python310;

      # List all the Python dependencies that packaged in nixpkgs
      pythonDeps = pythonVerPkgs: with pythonVerPkgs; [
        black
        docopt
        setuptools
      ];

      pythonEnv = pythonVer.withPackages pythonDeps;

      appName = "CHANGE-ME";
      appVersion = "0.0.1";
    in {
      packages.default = pythonVer.pkgs.buildPythonPackage {
        name = appName;
        version = appVersion;
        src = ./.;
        format = "pyproject";

        propagatedBuildInputs = [
          pythonEnv
        ];

        doCheck = true;
        checkInputs = [ pythonVer.pkgs.unittestCheckHook ];
      };

      devShells.default = pkgs.mkShell {
        buildInputs = [
          self.packages.${system}.default
        ];
      };
    }
  );
}
