# Package

version       = "0.24.0"
backend       = "cpp"
author        = "Christopher Dunn"
description   = "Nim wrappers for PB C++ code, starting with pbbam"
license       = "BSD-3-Clause"
srcDir        = "src"
installDirs   = @["."]
bin           = @["pbdataset"]

# Dependencies

requires "nim >= 0.19.6"
requires "cligen"

# Extra tasks

task hello, "This is a hello task":
  echo("Hello World!")
