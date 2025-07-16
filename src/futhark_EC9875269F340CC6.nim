
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  UCHAR_1375732189 = uint8   ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:171:23
  struct_M_APM_struct_1375732192 {.pure, inheritable, bycopy.} = object
    m_apm_data*: ptr UCHAR_1375732191 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:173:9
    m_apm_id*: clong
    m_apm_refcount*: cint
    m_apm_malloclength*: cint
    m_apm_datalength*: cint
    m_apm_exponent*: cint
    m_apm_sign*: cint
  M_APM_struct_1375732194 = struct_M_APM_struct_1375732193 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:181:3
  Mapminternal_1375732196 = ptr M_APM_struct_1375732195 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:183:23
  Mapminternal_1375732197 = (when declared(Mapminternal):
    when ownSizeof(Mapminternal) != ownSizeof(Mapminternal_1375732196):
      static :
        warning("Declaration of " & "Mapminternal" &
            " exists but with different size")
    Mapminternal
  else:
    Mapminternal_1375732196)
  UCHAR_1375732191 = (when declared(UCHAR):
    when ownSizeof(UCHAR) != ownSizeof(UCHAR_1375732189):
      static :
        warning("Declaration of " & "UCHAR" & " exists but with different size")
    UCHAR
  else:
    UCHAR_1375732189)
  struct_M_APM_struct_1375732193 = (when declared(struct_M_APM_struct):
    when ownSizeof(struct_M_APM_struct) != ownSizeof(struct_M_APM_struct_1375732192):
      static :
        warning("Declaration of " & "struct_M_APM_struct" &
            " exists but with different size")
    struct_M_APM_struct
  else:
    struct_M_APM_struct_1375732192)
  M_APM_struct_1375732195 = (when declared(M_APM_struct):
    when ownSizeof(M_APM_struct) != ownSizeof(M_APM_struct_1375732194):
      static :
        warning("Declaration of " & "M_APM_struct" &
            " exists but with different size")
    M_APM_struct
  else:
    M_APM_struct_1375732194)
when not declared(Mapminternal):
  type
    Mapminternal* = Mapminternal_1375732196
else:
  static :
    hint("Declaration of " & "Mapminternal" & " already exists, not redeclaring")
when not declared(UCHAR):
  type
    UCHAR* = UCHAR_1375732189
else:
  static :
    hint("Declaration of " & "UCHAR" & " already exists, not redeclaring")
when not declared(struct_M_APM_struct):
  type
    struct_M_APM_struct* = struct_M_APM_struct_1375732192
else:
  static :
    hint("Declaration of " & "struct_M_APM_struct" &
        " already exists, not redeclaring")
when not declared(M_APM_struct):
  type
    M_APM_struct* = M_APM_struct_1375732194
else:
  static :
    hint("Declaration of " & "M_APM_struct" & " already exists, not redeclaring")
when not declared(MAPM_LIB_SHORT_VERSION):
  when "4.9.5" is static:
    const
      MAPM_LIB_SHORT_VERSION* = "4.9.5" ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:188:9
  else:
    let MAPM_LIB_SHORT_VERSION* = "4.9.5" ## Generated based on /tmp/mapm-nim/src/mapm/m_apm.h:188:9
else:
  static :
    hint("Declaration of " & "MAPM_LIB_SHORT_VERSION" &
        " already exists, not redeclaring")
when not declared(m_apm_arcsin):
  proc m_apm_arcsin*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arcsin".}
else:
  static :
    hint("Declaration of " & "m_apm_arcsin" & " already exists, not redeclaring")
when not declared(m_apm_arccos):
  proc m_apm_arccos*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arccos".}
else:
  static :
    hint("Declaration of " & "m_apm_arccos" & " already exists, not redeclaring")
when not declared(m_apm_arctan):
  proc m_apm_arctan*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arctan".}
else:
  static :
    hint("Declaration of " & "m_apm_arctan" & " already exists, not redeclaring")
when not declared(m_apm_arctan2):
  proc m_apm_arctan2*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197;
                      a3: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_arctan2".}
else:
  static :
    hint("Declaration of " & "m_apm_arctan2" &
        " already exists, not redeclaring")
when not declared(m_apm_arcsinh):
  proc m_apm_arcsinh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arcsinh".}
else:
  static :
    hint("Declaration of " & "m_apm_arcsinh" &
        " already exists, not redeclaring")
when not declared(m_apm_arccosh):
  proc m_apm_arccosh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arccosh".}
else:
  static :
    hint("Declaration of " & "m_apm_arccosh" &
        " already exists, not redeclaring")
when not declared(m_apm_arctanh):
  proc m_apm_arctanh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_arctanh".}
else:
  static :
    hint("Declaration of " & "m_apm_arctanh" &
        " already exists, not redeclaring")
when not declared(malloc):
  proc malloc*(compiler_size: culong): pointer {.cdecl, importc: "malloc".}
else:
  static :
    hint("Declaration of " & "malloc" & " already exists, not redeclaring")
when not declared(realloc):
  proc realloc*(compiler_ptr: pointer; compiler_size: culong): pointer {.cdecl,
      importc: "realloc".}
else:
  static :
    hint("Declaration of " & "realloc" & " already exists, not redeclaring")
when not declared(free):
  proc free*(compiler_ptr: pointer): void {.cdecl, importc: "free".}
else:
  static :
    hint("Declaration of " & "free" & " already exists, not redeclaring")
when not declared(TRUE):
  when 1 is static:
    const
      TRUE* = 1              ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:296:9
  else:
    let TRUE* = 1            ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:296:9
else:
  static :
    hint("Declaration of " & "TRUE" & " already exists, not redeclaring")
when not declared(FALSE):
  when 0 is static:
    const
      FALSE* = 0             ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:300:9
  else:
    let FALSE* = 0           ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:300:9
else:
  static :
    hint("Declaration of " & "FALSE" & " already exists, not redeclaring")
when not declared(M_APM_IDENT):
  when 1808571109 is static:
    const
      M_APM_IDENT* = 1808571109 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:303:9
  else:
    let M_APM_IDENT* = 1808571109 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:303:9
else:
  static :
    hint("Declaration of " & "M_APM_IDENT" & " already exists, not redeclaring")
when not declared(M_APM_RETURN):
  when 0 is static:
    const
      M_APM_RETURN* = 0      ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:304:9
  else:
    let M_APM_RETURN* = 0    ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:304:9
else:
  static :
    hint("Declaration of " & "M_APM_RETURN" & " already exists, not redeclaring")
when not declared(M_APM_FATAL):
  when 1 is static:
    const
      M_APM_FATAL* = 1       ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:305:9
  else:
    let M_APM_FATAL* = 1     ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:305:9
else:
  static :
    hint("Declaration of " & "M_APM_FATAL" & " already exists, not redeclaring")
when not declared(VALID_DECIMAL_PLACES):
  when 128 is static:
    const
      VALID_DECIMAL_PLACES* = 128 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:309:9
  else:
    let VALID_DECIMAL_PLACES* = 128 ## Generated based on /tmp/mapm-nim/src/mapm/m_apm_lc.h:309:9
else:
  static :
    hint("Declaration of " & "VALID_DECIMAL_PLACES" &
        " already exists, not redeclaring")
when not declared(MM_Zero):
  var MM_Zero* {.importc: "MM_Zero".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Zero" & " already exists, not redeclaring")
when not declared(MM_One):
  var MM_One* {.importc: "MM_One".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_One" & " already exists, not redeclaring")
when not declared(MM_Two):
  var MM_Two* {.importc: "MM_Two".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Two" & " already exists, not redeclaring")
when not declared(MM_Three):
  var MM_Three* {.importc: "MM_Three".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Three" & " already exists, not redeclaring")
when not declared(MM_Four):
  var MM_Four* {.importc: "MM_Four".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Four" & " already exists, not redeclaring")
when not declared(MM_Five):
  var MM_Five* {.importc: "MM_Five".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Five" & " already exists, not redeclaring")
when not declared(MM_Ten):
  var MM_Ten* {.importc: "MM_Ten".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_Ten" & " already exists, not redeclaring")
when not declared(MM_PI):
  var MM_PI* {.importc: "MM_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_PI" & " already exists, not redeclaring")
when not declared(MM_HALF_PI):
  var MM_HALF_PI* {.importc: "MM_HALF_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_HALF_PI" & " already exists, not redeclaring")
when not declared(MM_2_PI):
  var MM_2_PI* {.importc: "MM_2_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_2_PI" & " already exists, not redeclaring")
when not declared(MM_E):
  var MM_E* {.importc: "MM_E".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_E" & " already exists, not redeclaring")
when not declared(MM_LOG_E_BASE_10):
  var MM_LOG_E_BASE_10* {.importc: "MM_LOG_E_BASE_10".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_LOG_E_BASE_10" &
        " already exists, not redeclaring")
when not declared(MM_LOG_10_BASE_E):
  var MM_LOG_10_BASE_E* {.importc: "MM_LOG_10_BASE_E".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_LOG_10_BASE_E" &
        " already exists, not redeclaring")
when not declared(MM_LOG_2_BASE_E):
  var MM_LOG_2_BASE_E* {.importc: "MM_LOG_2_BASE_E".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_LOG_2_BASE_E" &
        " already exists, not redeclaring")
when not declared(MM_LOG_3_BASE_E):
  var MM_LOG_3_BASE_E* {.importc: "MM_LOG_3_BASE_E".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_LOG_3_BASE_E" &
        " already exists, not redeclaring")
when not declared(m_apm_init):
  proc m_apm_init*(): Mapminternal_1375732197 {.cdecl, importc: "m_apm_init".}
else:
  static :
    hint("Declaration of " & "m_apm_init" & " already exists, not redeclaring")
when not declared(m_apm_free):
  proc m_apm_free*(a0: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_free".}
else:
  static :
    hint("Declaration of " & "m_apm_free" & " already exists, not redeclaring")
when not declared(m_apm_free_all_mem):
  proc m_apm_free_all_mem*(): void {.cdecl, importc: "m_apm_free_all_mem".}
else:
  static :
    hint("Declaration of " & "m_apm_free_all_mem" &
        " already exists, not redeclaring")
when not declared(m_apm_trim_mem_usage):
  proc m_apm_trim_mem_usage*(): void {.cdecl, importc: "m_apm_trim_mem_usage".}
else:
  static :
    hint("Declaration of " & "m_apm_trim_mem_usage" &
        " already exists, not redeclaring")
when not declared(m_apm_lib_version):
  proc m_apm_lib_version*(a0: cstring): cstring {.cdecl,
      importc: "m_apm_lib_version".}
else:
  static :
    hint("Declaration of " & "m_apm_lib_version" &
        " already exists, not redeclaring")
when not declared(m_apm_lib_short_version):
  proc m_apm_lib_short_version*(a0: cstring): cstring {.cdecl,
      importc: "m_apm_lib_short_version".}
else:
  static :
    hint("Declaration of " & "m_apm_lib_short_version" &
        " already exists, not redeclaring")
when not declared(m_apm_set_string):
  proc m_apm_set_string*(a0: Mapminternal_1375732197; a1: cstring): void {.
      cdecl, importc: "m_apm_set_string".}
else:
  static :
    hint("Declaration of " & "m_apm_set_string" &
        " already exists, not redeclaring")
when not declared(m_apm_set_double):
  proc m_apm_set_double*(a0: Mapminternal_1375732197; a1: cdouble): void {.
      cdecl, importc: "m_apm_set_double".}
else:
  static :
    hint("Declaration of " & "m_apm_set_double" &
        " already exists, not redeclaring")
when not declared(m_apm_set_long):
  proc m_apm_set_long*(a0: Mapminternal_1375732197; a1: clong): void {.cdecl,
      importc: "m_apm_set_long".}
else:
  static :
    hint("Declaration of " & "m_apm_set_long" &
        " already exists, not redeclaring")
when not declared(m_apm_to_string):
  proc m_apm_to_string*(a0: cstring; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_to_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_string" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_string):
  proc m_apm_to_fixpt_string*(a0: cstring; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_to_fixpt_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_string" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_stringex):
  proc m_apm_to_fixpt_stringex*(a0: cstring; a1: cint; a2: Mapminternal_1375732197;
                                a3: cschar; a4: cschar; a5: cint): void {.cdecl,
      importc: "m_apm_to_fixpt_stringex".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_stringex" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_stringexp):
  proc m_apm_to_fixpt_stringexp*(a0: cint; a1: Mapminternal_1375732197;
                                 a2: cschar; a3: cschar; a4: cint): cstring {.
      cdecl, importc: "m_apm_to_fixpt_stringexp".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_stringexp" &
        " already exists, not redeclaring")
when not declared(m_apm_to_integer_string):
  proc m_apm_to_integer_string*(a0: cstring; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_to_integer_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_integer_string" &
        " already exists, not redeclaring")
when not declared(m_apm_absolute_value):
  proc m_apm_absolute_value*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_absolute_value".}
else:
  static :
    hint("Declaration of " & "m_apm_absolute_value" &
        " already exists, not redeclaring")
when not declared(m_apm_negate):
  proc m_apm_negate*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_negate".}
else:
  static :
    hint("Declaration of " & "m_apm_negate" & " already exists, not redeclaring")
when not declared(m_apm_copy):
  proc m_apm_copy*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_copy".}
else:
  static :
    hint("Declaration of " & "m_apm_copy" & " already exists, not redeclaring")
when not declared(m_apm_round):
  proc m_apm_round*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_round".}
else:
  static :
    hint("Declaration of " & "m_apm_round" & " already exists, not redeclaring")
when not declared(m_apm_compare):
  proc m_apm_compare*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): cint {.
      cdecl, importc: "m_apm_compare".}
else:
  static :
    hint("Declaration of " & "m_apm_compare" &
        " already exists, not redeclaring")
when not declared(m_apm_sign):
  proc m_apm_sign*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_sign".}
else:
  static :
    hint("Declaration of " & "m_apm_sign" & " already exists, not redeclaring")
when not declared(m_apm_exponent):
  proc m_apm_exponent*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_exponent".}
else:
  static :
    hint("Declaration of " & "m_apm_exponent" &
        " already exists, not redeclaring")
when not declared(m_apm_significant_digits):
  proc m_apm_significant_digits*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_significant_digits".}
else:
  static :
    hint("Declaration of " & "m_apm_significant_digits" &
        " already exists, not redeclaring")
when not declared(m_apm_is_integer):
  proc m_apm_is_integer*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_is_integer".}
else:
  static :
    hint("Declaration of " & "m_apm_is_integer" &
        " already exists, not redeclaring")
when not declared(m_apm_is_even):
  proc m_apm_is_even*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_is_even".}
else:
  static :
    hint("Declaration of " & "m_apm_is_even" &
        " already exists, not redeclaring")
when not declared(m_apm_is_odd):
  proc m_apm_is_odd*(a0: Mapminternal_1375732197): cint {.cdecl,
      importc: "m_apm_is_odd".}
else:
  static :
    hint("Declaration of " & "m_apm_is_odd" & " already exists, not redeclaring")
when not declared(m_apm_gcd):
  proc m_apm_gcd*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                  a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_gcd".}
else:
  static :
    hint("Declaration of " & "m_apm_gcd" & " already exists, not redeclaring")
when not declared(m_apm_lcm):
  proc m_apm_lcm*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                  a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_lcm".}
else:
  static :
    hint("Declaration of " & "m_apm_lcm" & " already exists, not redeclaring")
when not declared(m_apm_add):
  proc m_apm_add*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                  a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_add".}
else:
  static :
    hint("Declaration of " & "m_apm_add" & " already exists, not redeclaring")
when not declared(m_apm_subtract):
  proc m_apm_subtract*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                       a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_subtract".}
else:
  static :
    hint("Declaration of " & "m_apm_subtract" &
        " already exists, not redeclaring")
when not declared(m_apm_multiply):
  proc m_apm_multiply*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                       a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_multiply".}
else:
  static :
    hint("Declaration of " & "m_apm_multiply" &
        " already exists, not redeclaring")
when not declared(m_apm_divide):
  proc m_apm_divide*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197;
                     a3: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_divide".}
else:
  static :
    hint("Declaration of " & "m_apm_divide" & " already exists, not redeclaring")
when not declared(m_apm_integer_divide):
  proc m_apm_integer_divide*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                             a2: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_integer_divide".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_divide" &
        " already exists, not redeclaring")
when not declared(m_apm_integer_div_rem):
  proc m_apm_integer_div_rem*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                              a2: Mapminternal_1375732197; a3: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_integer_div_rem".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_div_rem" &
        " already exists, not redeclaring")
when not declared(m_apm_reciprocal):
  proc m_apm_reciprocal*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_reciprocal".}
else:
  static :
    hint("Declaration of " & "m_apm_reciprocal" &
        " already exists, not redeclaring")
when not declared(m_apm_factorial):
  proc m_apm_factorial*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_factorial".}
else:
  static :
    hint("Declaration of " & "m_apm_factorial" &
        " already exists, not redeclaring")
when not declared(m_apm_floor):
  proc m_apm_floor*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_floor".}
else:
  static :
    hint("Declaration of " & "m_apm_floor" & " already exists, not redeclaring")
when not declared(m_apm_ceil):
  proc m_apm_ceil*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_ceil".}
else:
  static :
    hint("Declaration of " & "m_apm_ceil" & " already exists, not redeclaring")
when not declared(m_apm_get_random):
  proc m_apm_get_random*(a0: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_get_random".}
else:
  static :
    hint("Declaration of " & "m_apm_get_random" &
        " already exists, not redeclaring")
when not declared(m_apm_set_random_seed):
  proc m_apm_set_random_seed*(a0: cstring): void {.cdecl,
      importc: "m_apm_set_random_seed".}
else:
  static :
    hint("Declaration of " & "m_apm_set_random_seed" &
        " already exists, not redeclaring")
when not declared(m_apm_sqrt):
  proc m_apm_sqrt*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_sqrt".}
else:
  static :
    hint("Declaration of " & "m_apm_sqrt" & " already exists, not redeclaring")
when not declared(m_apm_cbrt):
  proc m_apm_cbrt*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_cbrt".}
else:
  static :
    hint("Declaration of " & "m_apm_cbrt" & " already exists, not redeclaring")
when not declared(m_apm_log):
  proc m_apm_log*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_log".}
else:
  static :
    hint("Declaration of " & "m_apm_log" & " already exists, not redeclaring")
when not declared(m_apm_log10):
  proc m_apm_log10*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_log10".}
else:
  static :
    hint("Declaration of " & "m_apm_log10" & " already exists, not redeclaring")
when not declared(m_apm_exp):
  proc m_apm_exp*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_exp".}
else:
  static :
    hint("Declaration of " & "m_apm_exp" & " already exists, not redeclaring")
when not declared(m_apm_pow):
  proc m_apm_pow*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197;
                  a3: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_pow".}
else:
  static :
    hint("Declaration of " & "m_apm_pow" & " already exists, not redeclaring")
when not declared(m_apm_integer_pow):
  proc m_apm_integer_pow*(a0: Mapminternal_1375732197; a1: cint;
                          a2: Mapminternal_1375732197; a3: cint): void {.cdecl,
      importc: "m_apm_integer_pow".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_pow" &
        " already exists, not redeclaring")
when not declared(m_apm_integer_pow_nr):
  proc m_apm_integer_pow_nr*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                             a2: cint): void {.cdecl,
      importc: "m_apm_integer_pow_nr".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_pow_nr" &
        " already exists, not redeclaring")
when not declared(m_apm_sin_cos):
  proc m_apm_sin_cos*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197;
                      a2: cint; a3: Mapminternal_1375732197): void {.cdecl,
      importc: "m_apm_sin_cos".}
else:
  static :
    hint("Declaration of " & "m_apm_sin_cos" &
        " already exists, not redeclaring")
when not declared(m_apm_sin):
  proc m_apm_sin*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_sin".}
else:
  static :
    hint("Declaration of " & "m_apm_sin" & " already exists, not redeclaring")
when not declared(m_apm_cos):
  proc m_apm_cos*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_cos".}
else:
  static :
    hint("Declaration of " & "m_apm_cos" & " already exists, not redeclaring")
when not declared(m_apm_tan):
  proc m_apm_tan*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_tan".}
else:
  static :
    hint("Declaration of " & "m_apm_tan" & " already exists, not redeclaring")
when not declared(m_apm_sinh):
  proc m_apm_sinh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_sinh".}
else:
  static :
    hint("Declaration of " & "m_apm_sinh" & " already exists, not redeclaring")
when not declared(m_apm_cosh):
  proc m_apm_cosh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_cosh".}
else:
  static :
    hint("Declaration of " & "m_apm_cosh" & " already exists, not redeclaring")
when not declared(m_apm_tanh):
  proc m_apm_tanh*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "m_apm_tanh".}
else:
  static :
    hint("Declaration of " & "m_apm_tanh" & " already exists, not redeclaring")
when not declared(m_apm_cpp_precision):
  proc m_apm_cpp_precision*(a0: cint): void {.cdecl,
      importc: "m_apm_cpp_precision".}
else:
  static :
    hint("Declaration of " & "m_apm_cpp_precision" &
        " already exists, not redeclaring")
when not declared(MM_lc_PI_digits):
  var MM_lc_PI_digits* {.importc: "MM_lc_PI_digits".}: cint
else:
  static :
    hint("Declaration of " & "MM_lc_PI_digits" &
        " already exists, not redeclaring")
when not declared(MM_lc_log_digits):
  var MM_lc_log_digits* {.importc: "MM_lc_log_digits".}: cint
else:
  static :
    hint("Declaration of " & "MM_lc_log_digits" &
        " already exists, not redeclaring")
when not declared(MM_0_5):
  var MM_0_5* {.importc: "MM_0_5".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_0_5" & " already exists, not redeclaring")
when not declared(MM_0_85):
  var MM_0_85* {.importc: "MM_0_85".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_0_85" & " already exists, not redeclaring")
when not declared(MM_5x_125R):
  var MM_5x_125R* {.importc: "MM_5x_125R".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_125R" & " already exists, not redeclaring")
when not declared(MM_5x_64R):
  var MM_5x_64R* {.importc: "MM_5x_64R".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_64R" & " already exists, not redeclaring")
when not declared(MM_5x_256R):
  var MM_5x_256R* {.importc: "MM_5x_256R".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_256R" & " already exists, not redeclaring")
when not declared(MM_5x_Eight):
  var MM_5x_Eight* {.importc: "MM_5x_Eight".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_Eight" & " already exists, not redeclaring")
when not declared(MM_5x_Sixteen):
  var MM_5x_Sixteen* {.importc: "MM_5x_Sixteen".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_Sixteen" &
        " already exists, not redeclaring")
when not declared(MM_5x_Twenty):
  var MM_5x_Twenty* {.importc: "MM_5x_Twenty".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_5x_Twenty" & " already exists, not redeclaring")
when not declared(MM_lc_PI):
  var MM_lc_PI* {.importc: "MM_lc_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_PI" & " already exists, not redeclaring")
when not declared(MM_lc_HALF_PI):
  var MM_lc_HALF_PI* {.importc: "MM_lc_HALF_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_HALF_PI" &
        " already exists, not redeclaring")
when not declared(MM_lc_2_PI):
  var MM_lc_2_PI* {.importc: "MM_lc_2_PI".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_2_PI" & " already exists, not redeclaring")
when not declared(MM_lc_log2):
  var MM_lc_log2* {.importc: "MM_lc_log2".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_log2" & " already exists, not redeclaring")
when not declared(MM_lc_log10):
  var MM_lc_log10* {.importc: "MM_lc_log10".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_log10" & " already exists, not redeclaring")
when not declared(MM_lc_log10R):
  var MM_lc_log10R* {.importc: "MM_lc_log10R".}: Mapminternal_1375732197
else:
  static :
    hint("Declaration of " & "MM_lc_log10R" & " already exists, not redeclaring")
when not declared(M_free_all_fft):
  proc M_free_all_fft*(): void {.cdecl, importc: "M_free_all_fft".}
else:
  static :
    hint("Declaration of " & "M_free_all_fft" &
        " already exists, not redeclaring")
when not declared(M_init_trig_globals):
  proc M_init_trig_globals*(): void {.cdecl, importc: "M_init_trig_globals".}
else:
  static :
    hint("Declaration of " & "M_init_trig_globals" &
        " already exists, not redeclaring")
when not declared(M_free_all_add):
  proc M_free_all_add*(): void {.cdecl, importc: "M_free_all_add".}
else:
  static :
    hint("Declaration of " & "M_free_all_add" &
        " already exists, not redeclaring")
when not declared(M_free_all_div):
  proc M_free_all_div*(): void {.cdecl, importc: "M_free_all_div".}
else:
  static :
    hint("Declaration of " & "M_free_all_div" &
        " already exists, not redeclaring")
when not declared(M_free_all_exp):
  proc M_free_all_exp*(): void {.cdecl, importc: "M_free_all_exp".}
else:
  static :
    hint("Declaration of " & "M_free_all_exp" &
        " already exists, not redeclaring")
when not declared(M_free_all_pow):
  proc M_free_all_pow*(): void {.cdecl, importc: "M_free_all_pow".}
else:
  static :
    hint("Declaration of " & "M_free_all_pow" &
        " already exists, not redeclaring")
when not declared(M_free_all_rnd):
  proc M_free_all_rnd*(): void {.cdecl, importc: "M_free_all_rnd".}
else:
  static :
    hint("Declaration of " & "M_free_all_rnd" &
        " already exists, not redeclaring")
when not declared(M_free_all_set):
  proc M_free_all_set*(): void {.cdecl, importc: "M_free_all_set".}
else:
  static :
    hint("Declaration of " & "M_free_all_set" &
        " already exists, not redeclaring")
when not declared(M_free_all_cnst):
  proc M_free_all_cnst*(): void {.cdecl, importc: "M_free_all_cnst".}
else:
  static :
    hint("Declaration of " & "M_free_all_cnst" &
        " already exists, not redeclaring")
when not declared(M_free_all_fmul):
  proc M_free_all_fmul*(): void {.cdecl, importc: "M_free_all_fmul".}
else:
  static :
    hint("Declaration of " & "M_free_all_fmul" &
        " already exists, not redeclaring")
when not declared(M_free_all_stck):
  proc M_free_all_stck*(): void {.cdecl, importc: "M_free_all_stck".}
else:
  static :
    hint("Declaration of " & "M_free_all_stck" &
        " already exists, not redeclaring")
when not declared(M_free_all_util):
  proc M_free_all_util*(): void {.cdecl, importc: "M_free_all_util".}
else:
  static :
    hint("Declaration of " & "M_free_all_util" &
        " already exists, not redeclaring")
when not declared(M_exp_compute_nn):
  proc M_exp_compute_nn*(a0: ptr cint; a1: Mapminternal_1375732197;
                         a2: Mapminternal_1375732197): cint {.cdecl,
      importc: "M_exp_compute_nn".}
else:
  static :
    hint("Declaration of " & "M_exp_compute_nn" &
        " already exists, not redeclaring")
when not declared(M_raw_exp):
  proc M_raw_exp*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_raw_exp".}
else:
  static :
    hint("Declaration of " & "M_raw_exp" & " already exists, not redeclaring")
when not declared(M_raw_sin):
  proc M_raw_sin*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_raw_sin".}
else:
  static :
    hint("Declaration of " & "M_raw_sin" & " already exists, not redeclaring")
when not declared(M_raw_cos):
  proc M_raw_cos*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_raw_cos".}
else:
  static :
    hint("Declaration of " & "M_raw_cos" & " already exists, not redeclaring")
when not declared(M_5x_sin):
  proc M_5x_sin*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_5x_sin".}
else:
  static :
    hint("Declaration of " & "M_5x_sin" & " already exists, not redeclaring")
when not declared(M_4x_cos):
  proc M_4x_cos*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_4x_cos".}
else:
  static :
    hint("Declaration of " & "M_4x_cos" & " already exists, not redeclaring")
when not declared(M_5x_do_it):
  proc M_5x_do_it*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_5x_do_it".}
else:
  static :
    hint("Declaration of " & "M_5x_do_it" & " already exists, not redeclaring")
when not declared(M_4x_do_it):
  proc M_4x_do_it*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_4x_do_it".}
else:
  static :
    hint("Declaration of " & "M_4x_do_it" & " already exists, not redeclaring")
when not declared(M_get_stack_var):
  proc M_get_stack_var*(): Mapminternal_1375732197 {.cdecl,
      importc: "M_get_stack_var".}
else:
  static :
    hint("Declaration of " & "M_get_stack_var" &
        " already exists, not redeclaring")
when not declared(M_restore_stack):
  proc M_restore_stack*(a0: cint): void {.cdecl, importc: "M_restore_stack".}
else:
  static :
    hint("Declaration of " & "M_restore_stack" &
        " already exists, not redeclaring")
when not declared(M_get_sizeof_int):
  proc M_get_sizeof_int*(): cint {.cdecl, importc: "M_get_sizeof_int".}
else:
  static :
    hint("Declaration of " & "M_get_sizeof_int" &
        " already exists, not redeclaring")
when not declared(M_apm_sdivide):
  proc M_apm_sdivide*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197;
                      a3: Mapminternal_1375732197): void {.cdecl,
      importc: "M_apm_sdivide".}
else:
  static :
    hint("Declaration of " & "M_apm_sdivide" &
        " already exists, not redeclaring")
when not declared(M_cos_to_sin):
  proc M_cos_to_sin*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_cos_to_sin".}
else:
  static :
    hint("Declaration of " & "M_cos_to_sin" & " already exists, not redeclaring")
when not declared(M_limit_angle_to_pi):
  proc M_limit_angle_to_pi*(a0: Mapminternal_1375732197; a1: cint;
                            a2: Mapminternal_1375732197): void {.cdecl,
      importc: "M_limit_angle_to_pi".}
else:
  static :
    hint("Declaration of " & "M_limit_angle_to_pi" &
        " already exists, not redeclaring")
when not declared(M_log_near_1):
  proc M_log_near_1*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_log_near_1".}
else:
  static :
    hint("Declaration of " & "M_log_near_1" & " already exists, not redeclaring")
when not declared(M_get_sqrt_guess):
  proc M_get_sqrt_guess*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "M_get_sqrt_guess".}
else:
  static :
    hint("Declaration of " & "M_get_sqrt_guess" &
        " already exists, not redeclaring")
when not declared(M_get_cbrt_guess):
  proc M_get_cbrt_guess*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "M_get_cbrt_guess".}
else:
  static :
    hint("Declaration of " & "M_get_cbrt_guess" &
        " already exists, not redeclaring")
when not declared(M_get_log_guess):
  proc M_get_log_guess*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "M_get_log_guess".}
else:
  static :
    hint("Declaration of " & "M_get_log_guess" &
        " already exists, not redeclaring")
when not declared(M_get_asin_guess):
  proc M_get_asin_guess*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "M_get_asin_guess".}
else:
  static :
    hint("Declaration of " & "M_get_asin_guess" &
        " already exists, not redeclaring")
when not declared(M_get_acos_guess):
  proc M_get_acos_guess*(a0: Mapminternal_1375732197; a1: Mapminternal_1375732197): void {.
      cdecl, importc: "M_get_acos_guess".}
else:
  static :
    hint("Declaration of " & "M_get_acos_guess" &
        " already exists, not redeclaring")
when not declared(M_arcsin_near_0):
  proc M_arcsin_near_0*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_arcsin_near_0".}
else:
  static :
    hint("Declaration of " & "M_arcsin_near_0" &
        " already exists, not redeclaring")
when not declared(M_arccos_near_0):
  proc M_arccos_near_0*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_arccos_near_0".}
else:
  static :
    hint("Declaration of " & "M_arccos_near_0" &
        " already exists, not redeclaring")
when not declared(M_arctan_near_0):
  proc M_arctan_near_0*(a0: Mapminternal_1375732197; a1: cint; a2: Mapminternal_1375732197): void {.
      cdecl, importc: "M_arctan_near_0".}
else:
  static :
    hint("Declaration of " & "M_arctan_near_0" &
        " already exists, not redeclaring")
when not declared(M_arctan_large_input):
  proc M_arctan_large_input*(a0: Mapminternal_1375732197; a1: cint;
                             a2: Mapminternal_1375732197): void {.cdecl,
      importc: "M_arctan_large_input".}
else:
  static :
    hint("Declaration of " & "M_arctan_large_input" &
        " already exists, not redeclaring")
when not declared(M_log_basic_iteration):
  proc M_log_basic_iteration*(a0: Mapminternal_1375732197; a1: cint;
                              a2: Mapminternal_1375732197): void {.cdecl,
      importc: "M_log_basic_iteration".}
else:
  static :
    hint("Declaration of " & "M_log_basic_iteration" &
        " already exists, not redeclaring")
when not declared(M_log_solve_cubic):
  proc M_log_solve_cubic*(a0: Mapminternal_1375732197; a1: cint;
                          a2: Mapminternal_1375732197): void {.cdecl,
      importc: "M_log_solve_cubic".}
else:
  static :
    hint("Declaration of " & "M_log_solve_cubic" &
        " already exists, not redeclaring")
when not declared(M_check_log_places):
  proc M_check_log_places*(a0: cint): void {.cdecl,
      importc: "M_check_log_places".}
else:
  static :
    hint("Declaration of " & "M_check_log_places" &
        " already exists, not redeclaring")
when not declared(M_log_AGM_R_func):
  proc M_log_AGM_R_func*(a0: Mapminternal_1375732197; a1: cint;
                         a2: Mapminternal_1375732197; a3: Mapminternal_1375732197): void {.
      cdecl, importc: "M_log_AGM_R_func".}
else:
  static :
    hint("Declaration of " & "M_log_AGM_R_func" &
        " already exists, not redeclaring")
when not declared(M_init_util_data):
  proc M_init_util_data*(): void {.cdecl, importc: "M_init_util_data".}
else:
  static :
    hint("Declaration of " & "M_init_util_data" &
        " already exists, not redeclaring")
when not declared(M_get_div_rem_addr):
  proc M_get_div_rem_addr*(a0: ptr ptr UCHAR_1375732191; a1: ptr ptr UCHAR_1375732191): void {.
      cdecl, importc: "M_get_div_rem_addr".}
else:
  static :
    hint("Declaration of " & "M_get_div_rem_addr" &
        " already exists, not redeclaring")
when not declared(M_get_div_rem):
  proc M_get_div_rem*(a0: cint; a1: ptr UCHAR_1375732191; a2: ptr UCHAR_1375732191): void {.
      cdecl, importc: "M_get_div_rem".}
else:
  static :
    hint("Declaration of " & "M_get_div_rem" &
        " already exists, not redeclaring")
when not declared(M_get_div_rem_10):
  proc M_get_div_rem_10*(a0: cint; a1: ptr UCHAR_1375732191; a2: ptr UCHAR_1375732191): void {.
      cdecl, importc: "M_get_div_rem_10".}
else:
  static :
    hint("Declaration of " & "M_get_div_rem_10" &
        " already exists, not redeclaring")
when not declared(M_apm_normalize):
  proc M_apm_normalize*(a0: Mapminternal_1375732197): void {.cdecl,
      importc: "M_apm_normalize".}
else:
  static :
    hint("Declaration of " & "M_apm_normalize" &
        " already exists, not redeclaring")
when not declared(M_apm_scale):
  proc M_apm_scale*(a0: Mapminternal_1375732197; a1: cint): void {.cdecl,
      importc: "M_apm_scale".}
else:
  static :
    hint("Declaration of " & "M_apm_scale" & " already exists, not redeclaring")
when not declared(M_apm_pad):
  proc M_apm_pad*(a0: Mapminternal_1375732197; a1: cint): void {.cdecl,
      importc: "M_apm_pad".}
else:
  static :
    hint("Declaration of " & "M_apm_pad" & " already exists, not redeclaring")
when not declared(M_long_2_ascii):
  proc M_long_2_ascii*(a0: cstring; a1: clong): void {.cdecl,
      importc: "M_long_2_ascii".}
else:
  static :
    hint("Declaration of " & "M_long_2_ascii" &
        " already exists, not redeclaring")
when not declared(M_check_PI_places):
  proc M_check_PI_places*(a0: cint): void {.cdecl, importc: "M_check_PI_places".}
else:
  static :
    hint("Declaration of " & "M_check_PI_places" &
        " already exists, not redeclaring")
when not declared(M_calculate_PI_AGM):
  proc M_calculate_PI_AGM*(a0: Mapminternal_1375732197; a1: cint): void {.cdecl,
      importc: "M_calculate_PI_AGM".}
else:
  static :
    hint("Declaration of " & "M_calculate_PI_AGM" &
        " already exists, not redeclaring")
when not declared(M_set_to_zero):
  proc M_set_to_zero*(a0: Mapminternal_1375732197): void {.cdecl,
      importc: "M_set_to_zero".}
else:
  static :
    hint("Declaration of " & "M_set_to_zero" &
        " already exists, not redeclaring")
when not declared(M_strposition):
  proc M_strposition*(a0: cstring; a1: cstring): cint {.cdecl,
      importc: "M_strposition".}
else:
  static :
    hint("Declaration of " & "M_strposition" &
        " already exists, not redeclaring")
when not declared(M_lowercase):
  proc M_lowercase*(a0: cstring): cstring {.cdecl, importc: "M_lowercase".}
else:
  static :
    hint("Declaration of " & "M_lowercase" & " already exists, not redeclaring")
when not declared(M_apm_log_error_msg):
  proc M_apm_log_error_msg*(a0: cint; a1: cstring): void {.cdecl,
      importc: "M_apm_log_error_msg".}
else:
  static :
    hint("Declaration of " & "M_apm_log_error_msg" &
        " already exists, not redeclaring")
when not declared(M_apm_round_fixpt):
  proc M_apm_round_fixpt*(a0: Mapminternal_1375732197; a1: cint;
                          a2: Mapminternal_1375732197): void {.cdecl,
      importc: "M_apm_round_fixpt".}
else:
  static :
    hint("Declaration of " & "M_apm_round_fixpt" &
        " already exists, not redeclaring")