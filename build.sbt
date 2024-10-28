ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "3.3.4"

lazy val root = (project in file("."))
  .settings(
    name := "sudoku",
    idePackagePrefix := Some("ch.seidel.sudoku")
)
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.+" % "test"
libraryDependencies += "org.scalacheck" %% "scalacheck" % "1.15.+"


