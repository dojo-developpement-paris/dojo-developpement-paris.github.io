val scala3Version = "3.8.4"

lazy val root = project
  .in(file("."))
  .settings(
    name := "maitreD",
    version := "0.0.1-SNAPSHOT",
    scalaVersion := scala3Version,
    semanticdbEnabled := true,
    semanticdbVersion := scalafixSemanticdb.revision,
    scalacOptions ++= Seq(
      "-deprecation",
      "-explain",
      "-language:strictEquality",
      "-print-lines",
      "-rewrite",
      "-indent",
      "-Wunused:all",
      "-Ycheck-all-patmat"
      // "-Yexplicit-nulls"
    ),
    libraryDependencies ++= Seq(
      "org.scalactic" %% "scalactic" % "3.2.20",
      "org.scalatest" %% "scalatest" % "3.2.20" % "test",
      "org.scalatest" %% "scalatest-flatspec" % "3.2.20" % "test"
      // "org.wartremover" % "wartremover-contrib_3.8.1" % "2.4.3" force()
    ),
// libraryDependencies += "org.wartremover" % "wartremover-contrib_3.8.1" % "2.4.3" force()
    // dependencyOverrides += "org.wartremover" % "wartremover-contrib_3.8.1" % "2.4.3",
    scalafixDependencies ++= Seq(
      "io.github.ghostbuster91.scalafix-unified" %% "unified" % "0.0.8",
      "net.pixiv" %% "scalafix-pixiv-rule" % "4.5.4",
      "io.github.dedis" %% "scapegoat-scalafix" % "1.1.4"
    )
  )
