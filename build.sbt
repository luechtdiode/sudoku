ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "3.3.4"

lazy val root = (project in file("."))
  //.enablePlugins(DockerPlugin)
  //.enablePlugins(JDKPackagerPlugin)
  .settings(
      name := "sudoku",
      exportJars := true
)
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.+" % "test"
libraryDependencies += "org.scalacheck" %% "scalacheck" % "1.15.+"


