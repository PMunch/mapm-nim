# Package

version       = "0.2.1"
author        = "PMunch"
description   = "A Nim wrapper for Mike's Arbitrary Precision Math Library"
license       = "MIT"
srcDir        = "src"
skipDirs      = @["mapm"]


# Dependencies

requires "nim >= 2.0.0"
requires "futhark >= 0.9.0"

task buildMapm, "Builds the MAPM static library dependency":
  exec "git submodule init"
  exec "git submodule update"
  exec "cd src/mapm && ./mklib && cp libmapm.a .."
