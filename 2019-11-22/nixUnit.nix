with import <nixpkgs> {};
with lib.lists;
with builtins;

let 
  mergeName = attributeName: v: { value = v.value; name = attributeName + " " + v.name;};
  
  eval = tests: if isAttrs tests then concatMap (n: map (mergeName n) (eval tests."${n}")) (attrNames tests) 
  else if isList tests then concatMap (v: eval v) tests
  else [{value = tests; name = "";}];

  printTestResult = t@{value, name}: let result = if isNull value then "success" else "failure : ${value}";
  in trace "${name} ${result}" t;
in rec {
  run = tests: let 
    r = forEach (eval tests) printTestResult;
    n = length r;
    f = length (filter ({value,...}: ! isNull value) r);
    s = n - f;
    m = "Ran ${toString n} tests, ${toString s} success, ${toString f} failures";
  in if f == 0 then m else abort m;
  assertTrueWithMessage = value: message: if value then null else message;
  assertTrue = value: assertTrueWithMessage value "${toJSON value} should be true";
  assertFalse = value: assertTrueWithMessage (!value) "${toJSON value} should be false";
  assertEquals = a: b: assertTrueWithMessage (a == b) "${toJSON a} should equal ${toJSON b}";
}
