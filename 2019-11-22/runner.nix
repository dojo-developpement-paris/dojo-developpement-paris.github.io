with import ./nixUnit.nix;

let
  tests = (
    import ./romanNumeralsTest.nix //
    {}
    );
in
  run tests
