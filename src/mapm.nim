## # Matt's Arbitrary Precision Math library
##
## This is a wrapper for MAPM, an older but quite complete arbitrary math
## library. The wrapper is made to be as close to the Nim maths module as
## possible so that it can function as a drop-in replacement when you realise
## that you need better precision. The low-level wrapper is done through Futhark
## and both the `libmapm.a` and completed wrapper exists in this repo. If you
## want or need to rebuild `libmapm.a` you can run the Nimble task `buildMapm`.
## If you want Futhark to rebuild the wrapper you can compile with
## `-d:useFuthark` or `-d:useFutharkForMapm`.
##
## Example:
##
## ```nim
## import mapm
##
## var x = initMapm(10) # Init a MAPM number from an existing int, float, or string
## echo x / 6.4e+2'm # Or use the 'm literal specifier
## ```
## Please note that MAPM accumulates precision when multiplying numbers, so
## rounding to your required precision should be done from time to time to avoid
## this.
##
## MAPM by default handles errors by writing to stderr and return 0 in most
## cases (or calls `exit(100)` if it's a memory allocation error). Unless you
## pass `-d:noWrapMapmErrors` this library will use `-Wl,--wrap` to replace the
## internal error handling function of MAPM and turn these into exceptions.
## A `CatchableError` called `MapmError` is used when it would write to stderr
## and return 0, and a `Defect` called `MapmDefect` is thrown in the cases where
## it would've called `exit(100)`. These exceptions will have the original
## message that would've been written to stderr as the message. Note that these
## messages can contain multiple lines.
##
## The underlying C functions all take a MAPM number to store the result in.
## This is wrapped to put the result in a freshly initialized number for each
## operation. This is likely to give a performance penalty over using the
## library with the clever re-use of the result. If you want to squeeze the
## highest amount of performance out of this library you should use the
## low-level wrapper.
##
## The rest of this documentation is more or less copied straight from the MAPM
## README.
##
## ## MAPM library numerical limitations
##
## A general floating point number is of the form:
##
## ```
## Sn.nnnnnnnnE+yyyy        ex: -4.318384739357974916E+6215
## Sn.nnnnnnnnE-yyyy        ex: +8.208237913789131096523645193E-12873
## ```
##
## `S` is the sign, + or -.
##
## In MAPM, a number (n.nnnn...) may contain up to ( INT_MAX - 1 ) digits.
##
## For example, an MAPM number with a 16 bit integer may contain 2^15 or 32,767
## digits. An MAPM number with a 32 bit integer may contain 2^31 or
## 2,147,483,647 digits. All MAPM numbers are stored in RAM, there is no "data
## on disk" option. So to represent the maximum number of digits on a 32 bit
## CPU will require greater than 2 Gig of RAM.
##
## If you have a CPU with 64 bit ints, then the limitation is 2^63 or
## 9,223,372,036,854,775,807. It should be a very long time before computers
## have this much RAM in them.
##
## For the exponent (yyyy), the limitations are also INT_MAX and INT_MIN.
##
## For a 16 bit CPU, the largest number you can represent is approx
## 0.9999999....E+32767.    (H)
##
## For a 16 bit CPU, the smallest number you can represent (other than 0)
## is approx 0.1E-32767.   (L)
##
## For a 32 bit CPU, the largest number you can represent is approx
## 0.9999999....E+2147483647.   (H)
##
## For a 32 bit CPU, the smallest number you can represent (other than 0)
## is approx 0.1E-2147483647.  (L)
##
## The limitations for negative numbers are the same as positive numbers.
##
## ```
##                             Real Number Axis
##
##      +------------------------+    ---    +--------------------------+
##      |                        |     |     |                          |
##     -H                       -L    0.0   +L                         +H
## ```
##
## MAPM can represent real numbers from -H to -L, 0.0, +L to +H.
##
## The number of significant digits is typically only limited by available RAM.
##
## In MAPM, numerical overflows and underflows are not handled very well
## (actually not at all). There really isn't a clean and portable way to
## detect integer overflow and underflow. Per K&R C, the result of integer
## overflow/underflow is implementation dependent. In assembly language, when
## you add two numbers, you have access to a "carry flag" to see if an overflow
## occurred. C has no analogous operator to a carry flag.
##
## It is up to the user to decide if the results are valid for a given
## operation. In a 32 bit environment, the limit is so large that this is likely
## not an issue for most typical applications. However, it doesn't take much to
## overflow a 16 bit int so care should taken in a 16 bit environment.
##
## The reaction to an integer overflow/underflow is unknown at run-time:
##
## - Adding 2 large positive numbers may silently roll over to a negative
##   number.
## - In some embedded applications an integer overflow/underflow triggers a
##   hardware exception.
##
## ## Thread safety
## Note that the default MAPM library is *NOT* thread safe. MAPM internal data
## structures could get corrupted if multiple MAPM functions are active at the
## same time. The user should guarantee that only one thread is performing MAPM
## functions. This can usually be achieved by a call to the operating system to
## obtain a 'semaphore', 'mutex',  or 'critical code section' so the operating
## system will guarantee that only one MAPM thread will be active at a time.

import strutils
export FloatFormatMode

import internal
export MM_Zero
export MM_One
export MM_Two
export MM_Three
export MM_Four
export MM_Five
export MM_Ten
export MM_LOG_2_BASE_E
export MM_LOG_3_BASE_E
export MM_E
export MM_PI
export MM_HALF_PI
export MM_2_PI
export MM_LOG_E_BASE_10
export MM_LOG_10_BASE_E

type
  MapmLibrary = distinct pointer
  Mapm* = distinct ptr MapmStruct ## The core MAPM number type. This is properly wrapped with destructor calls in Nim so they can be used as normal numbers.

when not defined(noWrapMapmErrors):
  var
    cExc = ""
    defect = false

  {.passL:"-Wl,--wrap=M_apm_log_error_msg".}
  proc wrapper(fatal: cint, message: cstring) {.exportc: "__wrap_M_apm_log_error_msg".} =
    defect = defect or (fatal == 1)
    cExc.add message
    cExc.add "\n"

  type
    MapmError* = object of CatchableError
    MapmDefect* = object of Defect

  template errChk(): untyped =
    if cExc.len != 0:
      let ex = if defect:
        newException(MapmDefect, cExc.strip)
      else:
        newException(MapmError, cExc.strip)
      cExc = ""
      defect = false
      raise ex
else:
  template errChk(): untyped = discard

converter toInternal*(m: Mapm): MapmInternal = cast[MapmInternal](m)

proc `=destroy`(x: Mapm) =
  if not x.isNil:
    # We have to ensure that we don't free MAPM globals..
    if cast[pointer](x) == cast[pointer](MM_Zero): return
    if cast[pointer](x) == cast[pointer](MM_One): return
    if cast[pointer](x) == cast[pointer](MM_Two): return
    if cast[pointer](x) == cast[pointer](MM_Three): return
    if cast[pointer](x) == cast[pointer](MM_Four): return
    if cast[pointer](x) == cast[pointer](MM_Five): return
    if cast[pointer](x) == cast[pointer](MM_Ten): return
    if cast[pointer](x) == cast[pointer](MM_LOG_2_BASE_E): return
    if cast[pointer](x) == cast[pointer](MM_LOG_3_BASE_E): return
    if cast[pointer](x) == cast[pointer](MM_E): return
    if cast[pointer](x) == cast[pointer](MM_PI): return
    if cast[pointer](x) == cast[pointer](MM_HALF_PI): return
    if cast[pointer](x) == cast[pointer](MM_2_PI): return
    if cast[pointer](x) == cast[pointer](MM_LOG_E_BASE_10): return
    if cast[pointer](x) == cast[pointer](MM_LOG_10_BASE_E): return
    mApmFree(x)
    errChk()

proc `=sink`(dest: var Mapm, source: Mapm) =
  `=destroy`(dest)
  copyMem(cast[pointer](dest.addr), cast[pointer](source.unsafeAddr), sizeof(pointer))

proc `=copy`(dest: var Mapm, source: Mapm) =
  if cast[pointer](dest) != cast[pointer](source):
    if dest.isNil:
      dest = mApmInit().Mapm
      errChk()
    #else:
    #  #`=destroy`(dest)
    #  wasMoved(dest)
    mApmCopy(dest, source)
    errChk()

converter toMapm*(m: MapmInternal): Mapm = cast[Mapm](m)

const
  defaultPrecision* {.intdefine.} = 30 ## \
  ## This is the default precision used for calculations. Each operation where
  ## precision can't be inferred from the arguments allow specifying the
  ## precision on a per-call basis. This simply sets the default for all
  ## calculations which don't specify. Can be set with `-d:defaultPrecision:30`
  ## during compilation.
  dp = defaultPrecision

proc set*(m: var Mapm, y: string) =
  ## Sets the value of an existing and initialized MAPM number to the value
  ## contained in the string. Both integers and floating point are supported
  ## as is floating point with scientific notation.
  ## - Leading whitespace is ignored
  ## - A leading '+' sign is optional
  ## - A negative number must have '-' as the first non-whitespace char
  ## - An exponent, 'E' or 'e', is optional
  ## - The decimal point is optional. The decimal point may be anywhere in the
  ##   number, but before the exponent
  ## - The exponent may have an optional '+' sign
  ## - The exponent must be an integer value (no decimal point)
  ## Examples:
  ## ```nim
  ## myNum.set("-23")
  ## myNum.set("1964.425206")
  ## myNum.set("-9.344218785E-12")
  ## myNum.set("+987622.87633e+27")
  ## myNum.set(".0000004217")
  ## ```
  mApmSetString(m, y)
  errChk()

proc set*(m: var Mapm, y: int) =
  ## Sets the value of an existing and initialized MAPM number to the value
  ## of the integer.
  mApmSetLong(m, y)
  errChk()

proc set*(m: var Mapm, y: float) =
  ## Sets the MAPM value to the value specified by the float. The float value
  ## will be rounded to the 15 most significant digits and then converted to the
  ## MAPM value. If you want an 'exact' conversion, use the `set` procedure with
  ## a string argument since floating point may be rounded in an unpredictable
  ## manner.
  mApmSetDouble(m, y)
  errChk()

proc initMapm*(): Mapm =
  ## Initializes a new MAPM value. The value 0 is assigned to the variable. This
  ## function must be called before any MAPM operation is performed on the
  ## value.
  result = mApmInit()
  errChk()

proc init*(_: type Mapm): Mapm =
  ## Alternative to `initMapm` for a more generic approach
  initMapm()

proc initMapm*(x: string | int | float): Mapm =
  ## Initializes a new MAPM value, with the given value. This is equivalent to
  ## calling `init` and then `set`.
  result = mApmInit().Mapm
  errChk()
  result.set(x)

proc init*(_: type Mapm, x: string | int | float): Mapm =
  ## Generic alternative to `initMapm`.
  initMapm(x)

proc `'m`*(n: string): Mapm =
  ## Easily create MAPM literals. The value is interpreted as a string, so no
  ## floating point rounding errors will happen.
  ##
  ## Example:
  ## ```nim
  ## var x = 100.42e-2'm
  ## ```
  initMapm(n)

proc trimMem*() =
  ## MAPM keeps some internal state when using math operations (tables of trig
  ## functions and other stuff). It's automatically initialized when you start
  ## using MAPM values. This procedure will reduce the memory used by MAPM to
  ## its initial start-up state. The intent of this function is to minimize the
  ## memory footprint of MAPM while still maintaining full capabilities.
  mApmTrimMemUsage()
  errChk()

proc freeAll*() =
  ## This procedures frees ALL the memory that MAPM has allocated internally.
  ## It will NOT free the MAPM values in your code, Nim will do this
  ## automatically. The values that you have initialized are still valid MAPM
  ## numbers, but you won't be able to do anything useful with them. A call to
  ## any MAPM library function will likely result in a crash.
  ##
  ## The intent of this function is to free all MAPM allocated
  ## memory once you are completely done with using MAPM.
  ##
  ## A subsequent call to `trimMem()` will re-initialize the library and it will
  ## be ready for use again.
  ##
  ## NOTE: Nim will automatically call this when the program completes, but you
  ## will not get double free errors if you call it yourself before then.
  ## Primarily intended to free the internal MAPM memory in constricted
  ## environments when not using any MAPM functions.
  mApmFreeAllMem()
  errChk()

proc `=destroy`(x: MapmLibrary) =
  ## This hook only exists to free the memory of MAPM on Nim exit
  freeAll()

var mapmLibraryForDestroyhook: MapmLibrary

proc significantDigits*(x: Mapm): int =
  ## This function will return the number of significant digits in `x`.
  ##
  ## Examples:
  ## ```nim
  ## assert significantDigits(3.86742E+12'm) == 6
  ## assert significantDigits(-96108.27608'm) == 10
  ## ```
  result = mApmSignificantDigits(x)
  errChk()

proc exponent*(x: Mapm): int =
  ## This procedure will return the exponent of `x` in scientific notation.
  ##
  ## Examples:
  ## ```nim
  ## assert exponent(3.86742E+12'm) == 12
  ## assert exponent(9.61082E-56'm) == -56
  ## assert exponent(1000'm) == 3
  ## assert exponent(0.0'm) == 0
  ## ```
  result = mApmExponent(x)
  errChk()

proc `$`*(x: Mapm): string =
  ## Tries to create a reasonable fixed-point representation of the number. It
  ## grabs all significant digits from the number but strips trailing zeros and
  ## superfluous points.
  result = newString(max(x.significantDigits, abs(x.exponent)) + 3) # One byte for sign, one for separator, and one for ending null byte
  mApmToFixPtString(cast[cstring](result[0].addr), -1, x)
  errChk()
  result = result.strip(leading=false, trailing=true, {'\0'})
  if result.contains('.'):
    result = result.strip(leading=false, trailing=true, {'0'}).strip(leading=false, trailing=true, {'.'})

proc formatFloat*(x: Mapm, format: FloatFormatMode = ffDefault, precision = 16, decimalSep = '.'): string =
  ## Tries to stay true to the `formtFloat` from the maths module. The slightly
  ## confusing name is to ensure that this library can be used as a drop in
  ## replacement for floats. Precision is an unbounded range because we can
  ## deal with precision > 32. Otherwise it tries to emulate the behaviour of
  ## `sprintf` which is what Nim uses under the hood. Notable difference is
  ## that this string representation user uppercase `E` for scientific notation
  ## while Nim uses lowercase `e`.
  let exp = x.exponent
  let precision = if precision == -1: 6 else: precision
  if format  == ffScientific or (format == ffDefault and (exp < -4 or exp >= precision)):
    result = newString(precision + (abs(exp) div 10) + 6)
    mApmToString(cast[cstring](result[0].addr), (precision - (if format == ffDefault: 1 else: 0)).cint, x)
    errChk()
    result = result.strip(leading=false, trailing=true, {'\0'})
    if decimalSep != '.':
      result = result.replace('.', decimalSep)
  else:
    result = newString(abs(exp) + precision + 4)
    mApmToFixPtString(cast[cstring](result[0].addr), (precision - (if format == ffDefault: exp + 1 else: 0)).cint, x)
    errChk()
    result = result.strip(leading=false, trailing=true, {'\0'})
    if decimalSep != '.':
      result = result.replace('.', decimalSep)

proc formatMapm*(x: Mapm, decimals = -1, radix = '.', separator = ',', separatorCount = 3): string =
  ## Formats a MAPM value as a fixed point string.
  ##
  ## If `decimals < 0`, ALL the significant digits of the MAPM value will be
  ## output.
  ##
  ## If `decimals == 0`, the output will be the MAPM value rounded to the
  ## nearest integer and the decimal point will be suppressed.
  ##
  ## If `decimals > 0`, the value will be rounded to that number of digits and
  ## then the string will be filled, with trailing zero's appended if necessary
  ## to fill out the decimal place specification.
  ##
  ## In some applications, it is convenient to round the value yourself (see
  ## round_) and then display ALL the digits.
  ##
  ## If `x` is == 3.6487451E+2:
  ##
  ## - `formatMapm(x, 10)` -> "364.8745100000"
  ## - `formatMapm(x, 1)` -> "364.9"
  ## - `formatMapm(x, 0)` -> "365"
  ## - `formatMapm(x, -1)` -> "364.87451"
  ##
  ## The `radix` argument specifies the radix character desired. For example,
  ## use ',' to set the radix char to a comma.
  ##
  ## To split up a large number with a delimiter for easier readability you can
  ## use `separator` and `separatorCount`. For example, if `separator` = ',' and
  ## `separatorCount` = 3, there will be a comma inserted before every group of
  ## 3 digits in the output string.
  ##
  ## 6123456789.098765321 will be formatted as "6,123,456,789.098765321"
  ##
  ## Note that only digits before the radix char are separated.
  ##
  ## `separator` OR `separatorCount` == 0 is used to disable
  ## the 'char separator' feature. This would typically be used
  ## when it is only desired to change the radix character.
  var length = max(x.significantDigits, abs(x.exponent))
  if separatorCount != 0:
    length = length + length div separatorCount
  length += 4 + decimals
  result = newString(length)
  mApmToFixptStringEx(cast[cstring](result[0].addr), decimals.cint, x, radix.cschar, separator.cschar, separatorCount.cint)
  errChk()
  result = result.strip(leading=false, trailing=true, {'\0'})

proc sgn*(x: Mapm): int =
  ## This function will return the sign of `x`.
  ## The function will return :
  ## -1 : num < 0
  ##  0 : num = 0
  ##  1 : num > 0
  result = mApmSign(x)
  errChk()

proc isInt*(x: Mapm): bool =
  ## Returns true when `x` is a integer value, false otherwise
  result = mApmIsInteger(x) == 1
  errChk()

proc isEven*(x: Mapm): bool =
  ## Returns true when `x` is an even integer value, false otherwise. An input
  ## value which is not an integer will throw a MapmError exception.
  result = mApmIsEven(x) == 1
  errChk()

proc isOdd*(x: Mapm): bool =
  ## Returns true when `x` is an odd integer value, false otherwise. An input
  ## value which is not an integer will throw a MapmError exception.
  result = mApmIsOdd(x) == 1
  errChk()

proc randomize*(x: string) =
  ## This function will set the random number generator to a known starting
  ## value.

  ## The char string argument should correspond to any *integer* value between
  ## 0 and (1.0E+15 - 1).

  ## This function can be called at any time, either before or anytime after
  ## 'rand`.
  mApmSetRandomSeed(cast[cstring](x[0].addr))
  errChk()

proc rand*(): Mapm =
  ## This function will return a random floating point number between the
  ## values 0 and 1. The first time the function is called the generator is
  ## initialized with the system time. This generator will not repeat its
  ## pattern until 1.0E+15 numbers have been generated.
  result = Mapm.init
  mApmGetRandom(result)
  errChk()

proc `+`*(x, y: Mapm): Mapm =
  result = Mapm.init
  mApmAdd(result, x, y)
  errChk()

proc `+=`*(x: var Mapm, y: Mapm) =
  let xCurrent = x
  mApmAdd(x, xCurrent, y)
  errChk()

proc `-`*(x, y: Mapm): Mapm =
  result = Mapm.init
  mApmSubtract(result, x, y)
  errChk()

proc `-=`*(x: var Mapm, y: Mapm) =
  let xCurrent = x
  mApmSubtract(x, xCurrent, y)
  errChk()

proc `*`*(x, y: Mapm): Mapm =
  result = Mapm.init
  mApmMultiply(result, x, y)
  errChk()

proc `*=`*(x: var Mapm, y: Mapm) =
  let xCurrent = x
  mApmMultiply(x, xCurrent, y)
  errChk()

proc `/`*(x, y: Mapm): Mapm =
  ## This performs division on two MAPM values and tries to guess a good amount
  ## of significant digits. See divide_.
  result = Mapm.init
  mApmDivide(result, (x.significantDigits - abs(x.exponent) + y.significantDigits - abs(y.exponent)).cint, x, y)
  errChk()

proc `/=`*(x: var Mapm, y: Mapm): Mapm =
  let xCurrent = x
  mApmDivide(x, (x.significantDigits - abs(x.exponent) + y.significantDigits - abs(y.exponent)).cint, xCurrent, y)
  errChk()

proc divide*(x, y: Mapm, decimals = dp): Mapm =
  ## Unlike the other three basic operations, division cannot be counted on to
  ## produce non-repeating decimals, so the `decimals` argument is used to tell
  ## this routine how many digits are to be calculated before stopping.
  ##
  ## Note that the number of decimal places is referenced to the value as if
  ## the number was in fixed point notation. `divide` is the only function where
  ## decimal places is referenced to fixed point notation, all other functions
  ## are referenced to scientific notation. This was an intentional design
  ## decision so `divide` and `divRem` would work as expected.
  ##
  ## Division by zero throws a MapmError exception
  result = Mapm.init
  mApmDivide(result, decimals.cint, x, y)
  errChk()

proc reciprocal*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the reciprocal of `x`, ie. `1.0 / x`. The result is accurate to
  ## the number of decimal places specified. An input of zero throws a MapmError
  ## exception
  result = Mapm.init
  mApmReciprocal(result, decimals.cint, x)
  errChk()

proc `div`*(x, y: Mapm): Mapm =
  ## This function will divide `x` by `y`, truncating the result to an integer.
  ## Division by zero throws a MapmError exception.
  result = Mapm.init
  mApmIntegerDivide(result, x, y)
  errChk()

proc divMod*(x, y: Mapm): tuple[quotient, remainder: Mapm] =
  ## This function will divide `x` by `y`, truncating the result to an integer
  ## and put the result in `quotient` and it will put the remainder in
  ## `remainder`. So, 173 / 26 will yield a quotient of 6 and a remainder of 17.
  ##
  ## Note that the input numbers do not necessarily have to be integers.
  ##
  ## Division by zero throws a MapmError exception.
  result.quotient = Mapm.init
  result.remainder = Mapm.init
  mApmIntegerDivRem(result.quotient, result.remainder, x, y)
  errChk()

proc `mod`*(x, y: Mapm): Mapm =
  ## Calculates the modulos `y` of `x`. Basically just calls `divMod`_ and
  ## returns the remainder, so the same notes apply here.
  divMod(x, y).remainder

proc splitDecimal*(x: Mapm): tuple[intpart, floatpart: Mapm] =
  ## This function can be used to split up the integer portion and fractional
  ## portion of a floating point number. So, 32.17042 can be split up into '32'
  ## and '0.17042'.
  result.intpart = Mapm.init
  result.floatpart = Mapm.init
  mApmIntegerDivRem(result.intpart, result.floatpart, x, MMOne)
  errChk()

proc fac*(x: Mapm): Mapm =
  ## Computes the factorial of `x`. A non-integer input will yield nonsense.
  ## Actually, the algorithm simply multiplies:
  ## N * (N - 1) * (N - 2) ... until N < 2.
  ##
  ## fac(0) and fac(1) return 1
  result = Mapm.init
  mApmFactorial(result, x)
  errChk()

proc floor*(x: Mapm): Mapm =
  ## This function will round `x` downwards to the nearest integer. This has the
  ## same behavior as the 'C' function of the same name.
  result = Mapm.init
  mApmFloor(result, x)
  errChk()

proc ceil*(x: Mapm): Mapm =
  ## This function will round `x` upwards to the nearest integer. This has the
  ## same behavior as the 'C' function of the same name.
  result = Mapm.init
  mApmCeil(result, x)
  errChk()

proc gcd*(x, y: Mapm): Mapm =
  ## This function will compute the GCD (greatest common divisor) of `x` and
  ## `y`.
  ##
  ## Non-integer inputs will throw a MapmError exception.
  result = Mapm.init
  mApmGcd(result, x, y)
  errChk()

proc lcm*(x, y: Mapm): Mapm =
  ## This function will compute the LCM (least common multiple) between `x` and
  ## `y`.
  ##
  ## Non-integer inputs will throw a MapmError exception.
  result = Mapm.init
  mApmLcm(result, x, y)
  errChk()

proc sqrt*(x: Mapm, decimals = dp): Mapm =
  ## This function will compute the square root of `x` to the given precision.
  ##
  ## Negative inputs will throw a MapmError exception.
  result = Mapm.init
  mApmSqrt(result, decimals.cint, x)
  errChk()

proc cbrt*(x: Mapm, decimals = dp): Mapm =
  ## This function will compute the cube root of `x` to the given precision.
  result = Mapm.init
  mApmCbrt(result, decimals.cint, x)
  errChk()

proc ln*(x: Mapm, decimals = dp): Mapm =
  ## This function will compute the natural logarithm of `x` to the given
  ## precision.
  ##
  ## Negative inputs and 0 will throw a MapmError exception.
  result = Mapm.init
  mApmLog(result, decimals.cint, x)
  errChk()

proc log10*(x: Mapm, decimals = dp): Mapm =
  ## This function will compute the common logarithm of `x` to the given
  ## precision.
  ##
  ## Negative inputs and 0 will throw a MapmError exception.
  result = Mapm.init
  mApmLog10(result, decimals.cint, x)
  errChk()

proc log*(x, base: Mapm, decimals = dp): Mapm =
  ## This function will compute the logarithm of `x` with the given base to the
  ## given precision.
  ##
  ## Negative inputs and 0 will throw a MapmError exception.
  x.log10(decimals).divide(base.log10(decimals))

proc exp*(x: Mapm, decimals = dp): Mapm =
  ## This function will perform `e ^ x` with to the given precision.
  ##
  ## If the input to this function is too large, a MapmError exception will be
  ## thrown.
  result = Mapm.init
  mApmExp(result, decimals.cint, x)
  errChk()

proc pow*(x, y: Mapm, decimals = dp): Mapm =
  ## This function will raise `x` to the `y` power. The result will be accurate
  ## to the number of decimal places specified.
  ##
  ## `x` must be >= zero.
  result = Mapm.init
  mApmPow(result, decimals.cint, x, y)
  errChk()

proc powRound*(x: Mapm, y: int, decimals = dp): Mapm =
  ## This function will raise `x` to the `y` power and it will put the. The
  ## result will be accurate to the number of decimal places specified.
  ##
  ## If calculating X^Y, this function should be used when 'Y' is an integer.
  ## This function is considerably faster than the regular `pow` function (when
  ## `y` is not excessively large) however `pow` will call `powRound`
  ## automatically if possible. `x` and/or `y` may be negative.
  ##
  ## The other `pow` function which takes an integer does not perform any
  ## rounding operation and is more appropriate for integer only applications.
  result = Mapm.init
  mApmIntegerPow(result, decimals.cint, x, y.cint)
  errChk()

proc pow*(x: Mapm, y: int): Mapm =
  ## This function will raise `x` to the `y` power.
  ##
  ## This function is similar to `powRound`_ except the result is NOT ROUNDED.
  ## This function would typically be used is an integer only application where
  ## the full precision of the result is desired.
  ##
  ## `y` must be >= zero. `y` < 0 throws a MapmError exception.
  result = Mapm.init
  mApmIntegerPowNr(result, x, y.cint)
  errChk()

proc sin*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the sine of `x` in radians to the given precision
  result = Mapm.init
  mApmSin(result, decimals.cint, x)
  errChk()

proc cos*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the cosine of `x` in radians to the given precision
  result = Mapm.init
  mApmCos(result, decimals.cint, x)
  errChk()

proc sinCos*(x: Mapm, decimals = dp): tuple[sin, cos: Mapm] =
  ## Calculates the sine and cosine of `x` in radians to the given precision.
  ## This is more efficient than calling `sin` and `cos` separately.
  result.sin = Mapm.init
  result.cos = Mapm.init
  mApmSinCos(result.sin, result.cos, decimals.cint, x)
  errChk()

proc tan*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the tangent of `x` in radians to the given precision
  result = Mapm.init
  mApmTan(result, decimals.cint, x)
  errChk()

proc arcsin*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the arc sine of `x` to the given precision. The
  ## result is in the range `-pi / 2` to `+pi / 2`.
  ##
  ## `abs(x) > 1` throws a MapmError exception.
  result = Mapm.init
  mApmArcsin(result, decimals.cint, x)
  errChk()

proc arccos*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the arc cosine of `x` to the given precision. The
  ## result is in the range `0` to `+pi`.
  ##
  ## `abs(x) > 1` throws a MapmError exception.
  result = Mapm.init
  mApmArccos(result, decimals.cint, x)
  errChk()

proc arctan*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the arc tangent of `x` to the given precision. The
  ## result is in the range `-pi / 2` to `+pi / 2`.
  ##
  ## `x > 1` throws a MapmError exception.
  result = Mapm.init
  mApmArctan(result, decimals.cint, x)
  errChk()

proc arctan2*(x, y: Mapm, decimals = dp): Mapm =
  ## Calculates the 4 quadrant arc tangent of `x` and `y` to the given
  ## precision. The angle returned is in the range `-pi` to `+pi`. The quadrant
  ## is determined based on the sign of the 2 inputs.
  ##
  ## `x == y == 0` throws a MapmError exception.
  result = Mapm.init
  mApmArctan2(result, decimals.cint, x, y)
  errChk()

proc sinh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic sine of `x` to the given precision
  result = Mapm.init
  mApmSinh(result, decimals.cint, x)
  errChk()

proc cosh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic cosine of `x` to the given precision
  result = Mapm.init
  mApmCosh(result, decimals.cint, x)
  errChk()

proc tanh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic tangent of `x` to the given precision
  result = Mapm.init
  mApmTanh(result, decimals.cint, x)
  errChk()

proc arcsinh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic arc sine of `x` to the given precision
  result = Mapm.init
  mApmArcsinh(result, decimals.cint, x)
  errChk()

proc arccosh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic arc sine of `x` to the given precision
  ##
  ## `x < 1` throws a MapmError exception.
  result = Mapm.init
  mApmArccosh(result, decimals.cint, x)
  errChk()

proc arctanh*(x: Mapm, decimals = dp): Mapm =
  ## Calculates the hyperbolic arc sine of `x` to the given precision
  ##
  ## `abs(x) >= 1` throws a MapmError exception.
  result = Mapm.init
  mApmArctanh(result, decimals.cint, x)
  errChk()

proc abs*(x: Mapm): Mapm =
  ## Takes the absolute value of `x`
  result = Mapm.init
  mApmAbsoluteValue(result, x)
  errChk()

proc `-`*(x: Mapm): Mapm =
  ## Negates `x`
  result = Mapm.init
  mApmNegate(result, x)
  errChk()

proc round*(x: Mapm, places = 0): Mapm =
  ## Rounds `x` to the given decimal places. Keep in mind that multiplication
  ## will accumulate precision, so calling this from time to time can improve
  ## performance.
  result = Mapm.init
  mApmRound(result, places.cint, x)
  errChk()

proc cmp*(x, y: Mapm): int =
  ## Compares `x` and `y` in a way that is compatible with `sort`.
  result = mApmCompare(x, y)
  errChk()

proc `==`*(x, y: Mapm): bool =
  ## Checks if `x` is equal to `y`. Since this library has arbitrary precision
  ## this would be safer than performing equality on floating point numbers.
  x.cmp(y) == 0

proc `<`*(x, y: Mapm): bool =
  x.cmp(y) < 0

proc `>`*(x, y: Mapm): bool =
  x.cmp(y) > 0

proc `<=`*(x, y: Mapm): bool =
  x.cmp(y) <= 0

proc `>=`*(x, y: Mapm): bool =
  x.cmp(y) >= 0

let RadPerDeg = (0'm + MMPi) / 180'm

proc degToRad*(d: Mapm): Mapm =
  d * RadPerDeg

proc radToDeg*(d: Mapm): Mapm =
  d / RadPerDeg

iterator countup*(x, y: Mapm, step = MMOne): Mapm =
  var i = x
  while i <= y:
    yield i
    i += step

iterator countdown*(x, y: Mapm, step = MMOne): Mapm =
  var i = x
  while i <= y:
    yield i
    i -= step

proc binom*(n, k: Mapm): Mapm =
  ## Computes the [binomial coefficient](https://en.wikipedia.org/wiki/Binomial_coefficient).
  if k <= 0'm: return 1'm
  if 2'm * k > n: return binom(n, n - k)
  result = n
  for i in countup(2'm, k):
    result = (result * (n + 1'm - i)) div i

proc toInt*(n: Mapm): int =
  ## Converts a MAPM value to a normal integer. This will throw an error if the
  ## number is too large to fit. Only useful if you want to use higher precision
  ## during your calculation but the end result can be rounded, or if the
  ## intermediary numbers of your calculation are too large to fit in an
  ## integer.
  ##
  ## NOTE: This procedure currently stringifies the MAPM number and parses the
  ## result with Nims `parseInt`. It will therefore be quite slow. This
  ## procedure exists so that everyone can use it and benefit from the eventual
  ## speed boost when it's implemented in a more clever way.
  var str = newString(max(0, n.exponent) + 2)
  mApmtoIntegerString(cast[cstring](str[0].addr), n)
  errChk()
  str = str.strip(leading=false, trailing=true, {'\0'})
  parseInt(str)

proc toFloat*(n: Mapm): float =
  ## Converts a MAPM value to a normal float. This will throw an error if the
  ## number is too large to fit. Only useful if you want to use higher precision
  ## during your calculation but the end result can be rounded, or if the
  ## intermediary numbers of your calculation are too large or too small to fit
  ## in a float.
  ##
  ## NOTE: This procedure currently stringifies the MAPM number and parses the
  ## result with Nims `parseFloat`. It will therefore be quite slow. This
  ## procedure exists so that everyone can use it and benefit from the eventual
  ## speed boost when it's implemented in a more clever way.
  ##
  ## NOTE2: The string is generated with 16 decimals which should match what
  ## normal floats can fairly accurately represent.
  var str = newString(abs(n.exponent) + 16 + 4)
  mApmToFixPtString(cast[cstring](str[0].addr), 16.cint, n)
  errChk()
  str = str.strip(leading=false, trailing=true, {'\0'})
  parseFloat(str)
