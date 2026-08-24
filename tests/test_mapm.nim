import std/unittest
import mapm

suite "MAPM value wrapper":
  test "construct values from integers, floats, and strings":
    check $initMapm(42) == "42"
    check $initMapm(1.25) == "1.25"
    check $initMapm("-7.125") == "-7.125"

  test "basic arithmetic and precision-controlled operations":
    let six = initMapm(6)
    let seven = initMapm(7)
    check $(six + seven) == "13"
    check $(seven - six) == "1"
    check $(six * seven) == "42"
    check $divide(initMapm(1), initMapm(8), 30) == "0.125"
    check formatFloat(sqrt(initMapm(2), 40), ffDecimal, 30) ==
      "1.414213562373095048801688724210"

  test "copying produces an independently mutable value":
    let original = initMapm("123.5")
    var copied = original
    copied += initMapm("1.5")
    check $original == "123.5"
    check $copied == "125"

  when defined(linux) and not defined(noWrapMapmErrors):
    test "recoverable MAPM errors become exceptions":
      expect MapmError:
        discard divide(initMapm(1), initMapm(0), 20)
