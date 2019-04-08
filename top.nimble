# Package

version       = "0.1.0"
author        = "Christopher Dunn"
description   = "A new awesome nimble package"
license       = "MIT"
#srcDir        = "src"
bin           = @["dataset"]


# Dependencies

requires "nim >= 0.19.9"
requires "cligen"

task hello, "This is a hello task":
  echo("Hello World!")
task test, "Test task is running":
  exec "./dataset"
task testabs, "Testabs task is running":
  exec "./dataset absolutize"
task testfilt, "Testfilt task is running":
  exec "./dataset filter"
