// scalaVersion := "3.8.1"  // "just in case it helps"
addSbtPlugin("ch.epfl.scala" % "sbt-scalafix" % "0.14.7")
addSbtPlugin("org.scalameta" % "sbt-scalafmt" % "2.6.1")
addSbtPlugin("org.wartremover" % "sbt-wartremover" % "3.5.8")
addSbtPlugin("org.wartremover" % "sbt-wartremover-contrib" % "2.4.5")
// libraryDependencies += "org.wartremover" % "wartremover-contrib_3.8.1" % "2.4.3" force()
// dependencyOverrides += "org.wartremover" % "wartremover-contrib_3.8.1" % "2.4.3"
// addSbtPlugin(
//   ("org.wartremover" % "sbt-wartremover-contrib" % "2.4.3")
//     .exclude("org.wartremover", "wartremover-contrib")
// )
// libraryDependencies += {
//   val sbtV = (pluginCrossBuild / sbtBinaryVersion).value
//   val scalaV = "3.8.1"
//   sbtPluginExtra("org.wartremover" % "wartremover-contrib" % "2.4.3", sbtV, scalaV)
// }
