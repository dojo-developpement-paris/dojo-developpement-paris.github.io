with import <nixpkgs> {};
let 
mvn = maven.override { jdk="/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home/"; };
in
stdenv.mkDerivation {
   name = "mvn-java10";
   JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home/";
   buildInputs = [mvn];
}


