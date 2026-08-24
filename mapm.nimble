# Package

version       = "0.5.0"
author        = "PMunch"
description   = "A Nim wrapper for Mike's Arbitrary Precision Math Library"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"
#requires "futhark >= 0.9.0"

task test, "Run the test suite with ORC and ARC":
  exec "nim c -r --mm:orc --path:src tests/test_mapm.nim"
  exec "nim c -r --mm:arc --path:src tests/test_mapm.nim"
