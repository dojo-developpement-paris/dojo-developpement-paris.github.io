with import <nixpkgs> {};
let 
mvn = maven.override { jdk="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"; };
in
stdenv.mkDerivation {
   name = "mvn";
   JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home";
   buildInputs = [mvn];
}


