# Matt's Arbitrary Precision Math library

This is a wrapper for MAPM, an older but quite complete arbitrary math
library. The wrapper follows the shape of Nim's `math` module where practical.
The low-level declarations are generated with Futhark. MAPM 4.9.5a source is
included in the package and compiled for the current target during a normal
Nim build; no prebuilt static library or submodule checkout is required.

The tested target is Linux with Nim 2.0 or newer. MAPM uses the platform math
library on Unix and is not thread-safe in its default configuration.

Example:

```nim
import mapm

var x = initMapm(10) # Init a MAPM number from an existing int, float, or string
echo x / 6.4e+2'm # Or use the 'm literal specifier
```

For a precision-controlled calculation:

```nim
let root = sqrt(initMapm(2), 60)
echo formatFloat(root, ffDecimal, 50)
```

The complete version is in `examples/precision.nim`. Precision arguments
control decimal places in operations that require rounding. Multiplication is
exact and can grow the number of retained digits, so long-running calculations
should round deliberately for their domain. The package does not define
financial rounding policy.

`Mapm` values own their underlying MAPM allocation. Assignment performs a deep
copy, so mutating a copied value does not change the original. Destructors free
owned values under both ORC and ARC.

On Linux, recoverable MAPM errors are exposed as `MapmError` by default and
fatal allocation failures as `MapmDefect`. Compile with `-d:noWrapMapmErrors`
to retain MAPM's original error handling.

The underlying C functions all take a MAPM number to store the result in.
This is wrapped to put the result in a freshly initialized number for each
operation. This is likely to give a performance penalty over using the
library with the clever re-use of the result. If you want to squeeze the
highest amount of performance out of this library you should use the
low-level wrapper.

Run the ORC and ARC test suite with:

```sh
nimble test
```

The vendored source snapshot and its redistribution notices are documented in
`src/mapm/UPSTREAM_SOURCE.md`.

The rest of this documentation is more or less copied straight from the MAPM
README.

## MAPM library numerical limitations

A general floating point number is of the form:

```
Sn.nnnnnnnnE+yyyy        ex: -4.318384739357974916E+6215
Sn.nnnnnnnnE-yyyy        ex: +8.208237913789131096523645193E-12873
```

`S` is the sign, + or -.

In MAPM, a number (n.nnnn...) may contain up to ( INT_MAX - 1 ) digits.

For example, an MAPM number with a 16 bit integer may contain 2^15 or 32,767
digits. An MAPM number with a 32 bit integer may contain 2^31 or
2,147,483,647 digits. All MAPM numbers are stored in RAM, there is no "data
on disk" option. So to represent the maximum number of digits on a 32 bit
CPU will require greater than 2 Gig of RAM.

If you have a CPU with 64 bit ints, then the limitation is 2^63 or
9,223,372,036,854,775,807. It should be a very long time before computers
have this much RAM in them.

For the exponent (yyyy), the limitations are also INT_MAX and INT_MIN.

For a 16 bit CPU, the largest number you can represent is approx
0.9999999....E+32767.    (H)

For a 16 bit CPU, the smallest number you can represent (other than 0)
is approx 0.1E-32767.   (L)

For a 32 bit CPU, the largest number you can represent is approx
0.9999999....E+2147483647.   (H)

For a 32 bit CPU, the smallest number you can represent (other than 0)
is approx 0.1E-2147483647.  (L)

The limitations for negative numbers are the same as positive numbers.

```
                            Real Number Axis

     +------------------------+    ---    +--------------------------+
     |                        |     |     |                          |
    -H                       -L    0.0   +L                         +H
```

MAPM can represent real numbers from -H to -L, 0.0, +L to +H.

The number of significant digits is typically only limited by available RAM.

In MAPM, numerical overflows and underflows are not handled very well
(actually not at all). There really isn't a clean and portable way to
detect integer overflow and underflow. Per K&R C, the result of integer
overflow/underflow is implementation dependent. In assembly language, when
you add two numbers, you have access to a "carry flag" to see if an overflow
occurred. C has no analogous operator to a carry flag.

It is up to the user to decide if the results are valid for a given
operation. In a 32 bit environment, the limit is so large that this is likely
not an issue for most typical applications. However, it doesn't take much to
overflow a 16 bit int so care should taken in a 16 bit environment.

The reaction to an integer overflow/underflow is unknown at run-time:

- Adding 2 large positive numbers may silently roll over to a negative
  number.
- In some embedded applications an integer overflow/underflow triggers a
  hardware exception.

## Thread safety
Note that the default MAPM library is *NOT* thread safe. MAPM internal data
structures could get corrupted if multiple MAPM functions are active at the
same time. The user should guarantee that only one thread is performing MAPM
functions. This can usually be achieved by a call to the operating system to
obtain a 'semaphore', 'mutex',  or 'critical code section' so the operating
system will guarantee that only one MAPM thread will be active at a time.
