with import ./nixUnit.nix;

let
  tests = (
#    import ./romanTest.nix //
    {}
    );
in
  run tests
