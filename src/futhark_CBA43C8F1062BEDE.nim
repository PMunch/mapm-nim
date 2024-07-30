
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint

from os import parentDir

type
  UCHAR_520094159 = uint8    ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:171:23
  struct_M_APM_struct_520094162 {.pure, inheritable, bycopy.} = object
    m_apm_data*: ptr UCHAR_520094161 ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:173:9
    m_apm_id*: clong
    m_apm_refcount*: cint
    m_apm_malloclength*: cint
    m_apm_datalength*: cint
    m_apm_exponent*: cint
    m_apm_sign*: cint
  M_APM_struct_520094164 = struct_M_APM_struct_520094163 ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:181:3
  Mapminternal_520094166 = ptr M_APM_struct_520094165 ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:183:23
  UCHAR_520094161 = (when declared(UCHAR):
    UCHAR
   else:
    UCHAR_520094159)
  struct_M_APM_struct_520094163 = (when declared(struct_M_APM_struct):
    struct_M_APM_struct
   else:
    struct_M_APM_struct_520094162)
  M_APM_struct_520094165 = (when declared(M_APM_struct):
    M_APM_struct
   else:
    M_APM_struct_520094164)
  Mapminternal_520094167 = (when declared(Mapminternal):
    Mapminternal
   else:
    Mapminternal_520094166)
when not declared(UCHAR):
  type
    UCHAR* = UCHAR_520094159
else:
  static :
    hint("Declaration of " & "UCHAR" & " already exists, not redeclaring")
when not declared(struct_M_APM_struct):
  type
    struct_M_APM_struct* = struct_M_APM_struct_520094162
else:
  static :
    hint("Declaration of " & "struct_M_APM_struct" &
        " already exists, not redeclaring")
when not declared(M_APM_struct):
  type
    M_APM_struct* = M_APM_struct_520094164
else:
  static :
    hint("Declaration of " & "M_APM_struct" & " already exists, not redeclaring")
when not declared(Mapminternal):
  type
    Mapminternal* = Mapminternal_520094166
else:
  static :
    hint("Declaration of " & "Mapminternal" & " already exists, not redeclaring")
when not declared(MAPM_LIB_SHORT_VERSION):
  when "4.9.5" is static:
    const
      MAPM_LIB_SHORT_VERSION* = "4.9.5" ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:188:9
  else:
    let MAPM_LIB_SHORT_VERSION* = "4.9.5" ## Generated based on /home/peter/Projects/nim-mapm/src/mapm/m_apm.h:188:9
else:
  static :
    hint("Declaration of " & "MAPM_LIB_SHORT_VERSION" &
        " already exists, not redeclaring")
when not declared(m_apm_arcsin):
  proc m_apm_arcsin*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arcsin".}
else:
  static :
    hint("Declaration of " & "m_apm_arcsin" & " already exists, not redeclaring")
when not declared(m_apm_arccos):
  proc m_apm_arccos*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arccos".}
else:
  static :
    hint("Declaration of " & "m_apm_arccos" & " already exists, not redeclaring")
when not declared(m_apm_arctan):
  proc m_apm_arctan*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arctan".}
else:
  static :
    hint("Declaration of " & "m_apm_arctan" & " already exists, not redeclaring")
when not declared(m_apm_arctan2):
  proc m_apm_arctan2*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167;
                      a3: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_arctan2".}
else:
  static :
    hint("Declaration of " & "m_apm_arctan2" &
        " already exists, not redeclaring")
when not declared(m_apm_arcsinh):
  proc m_apm_arcsinh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arcsinh".}
else:
  static :
    hint("Declaration of " & "m_apm_arcsinh" &
        " already exists, not redeclaring")
when not declared(m_apm_arccosh):
  proc m_apm_arccosh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arccosh".}
else:
  static :
    hint("Declaration of " & "m_apm_arccosh" &
        " already exists, not redeclaring")
when not declared(m_apm_arctanh):
  proc m_apm_arctanh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_arctanh".}
else:
  static :
    hint("Declaration of " & "m_apm_arctanh" &
        " already exists, not redeclaring")
when not declared(MM_Zero):
  var MM_Zero* {.importc: "MM_Zero".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Zero" & " already exists, not redeclaring")
when not declared(MM_One):
  var MM_One* {.importc: "MM_One".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_One" & " already exists, not redeclaring")
when not declared(MM_Two):
  var MM_Two* {.importc: "MM_Two".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Two" & " already exists, not redeclaring")
when not declared(MM_Three):
  var MM_Three* {.importc: "MM_Three".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Three" & " already exists, not redeclaring")
when not declared(MM_Four):
  var MM_Four* {.importc: "MM_Four".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Four" & " already exists, not redeclaring")
when not declared(MM_Five):
  var MM_Five* {.importc: "MM_Five".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Five" & " already exists, not redeclaring")
when not declared(MM_Ten):
  var MM_Ten* {.importc: "MM_Ten".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_Ten" & " already exists, not redeclaring")
when not declared(MM_PI):
  var MM_PI* {.importc: "MM_PI".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_PI" & " already exists, not redeclaring")
when not declared(MM_HALF_PI):
  var MM_HALF_PI* {.importc: "MM_HALF_PI".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_HALF_PI" & " already exists, not redeclaring")
when not declared(MM_2_PI):
  var MM_2_PI* {.importc: "MM_2_PI".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_2_PI" & " already exists, not redeclaring")
when not declared(MM_E):
  var MM_E* {.importc: "MM_E".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_E" & " already exists, not redeclaring")
when not declared(MM_LOG_E_BASE_10):
  var MM_LOG_E_BASE_10* {.importc: "MM_LOG_E_BASE_10".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_LOG_E_BASE_10" &
        " already exists, not redeclaring")
when not declared(MM_LOG_10_BASE_E):
  var MM_LOG_10_BASE_E* {.importc: "MM_LOG_10_BASE_E".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_LOG_10_BASE_E" &
        " already exists, not redeclaring")
when not declared(MM_LOG_2_BASE_E):
  var MM_LOG_2_BASE_E* {.importc: "MM_LOG_2_BASE_E".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_LOG_2_BASE_E" &
        " already exists, not redeclaring")
when not declared(MM_LOG_3_BASE_E):
  var MM_LOG_3_BASE_E* {.importc: "MM_LOG_3_BASE_E".}: Mapminternal_520094167
else:
  static :
    hint("Declaration of " & "MM_LOG_3_BASE_E" &
        " already exists, not redeclaring")
when not declared(m_apm_init):
  proc m_apm_init*(): Mapminternal_520094167 {.cdecl, importc: "m_apm_init".}
else:
  static :
    hint("Declaration of " & "m_apm_init" & " already exists, not redeclaring")
when not declared(m_apm_free):
  proc m_apm_free*(a0: Mapminternal_520094167): void {.cdecl,
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
  proc m_apm_set_string*(a0: Mapminternal_520094167; a1: cstring): void {.cdecl,
      importc: "m_apm_set_string".}
else:
  static :
    hint("Declaration of " & "m_apm_set_string" &
        " already exists, not redeclaring")
when not declared(m_apm_set_double):
  proc m_apm_set_double*(a0: Mapminternal_520094167; a1: cdouble): void {.cdecl,
      importc: "m_apm_set_double".}
else:
  static :
    hint("Declaration of " & "m_apm_set_double" &
        " already exists, not redeclaring")
when not declared(m_apm_set_long):
  proc m_apm_set_long*(a0: Mapminternal_520094167; a1: clong): void {.cdecl,
      importc: "m_apm_set_long".}
else:
  static :
    hint("Declaration of " & "m_apm_set_long" &
        " already exists, not redeclaring")
when not declared(m_apm_to_string):
  proc m_apm_to_string*(a0: cstring; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_to_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_string" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_string):
  proc m_apm_to_fixpt_string*(a0: cstring; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_to_fixpt_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_string" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_stringex):
  proc m_apm_to_fixpt_stringex*(a0: cstring; a1: cint; a2: Mapminternal_520094167;
                                a3: cschar; a4: cschar; a5: cint): void {.cdecl,
      importc: "m_apm_to_fixpt_stringex".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_stringex" &
        " already exists, not redeclaring")
when not declared(m_apm_to_fixpt_stringexp):
  proc m_apm_to_fixpt_stringexp*(a0: cint; a1: Mapminternal_520094167;
                                 a2: cschar; a3: cschar; a4: cint): cstring {.
      cdecl, importc: "m_apm_to_fixpt_stringexp".}
else:
  static :
    hint("Declaration of " & "m_apm_to_fixpt_stringexp" &
        " already exists, not redeclaring")
when not declared(m_apm_to_integer_string):
  proc m_apm_to_integer_string*(a0: cstring; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_to_integer_string".}
else:
  static :
    hint("Declaration of " & "m_apm_to_integer_string" &
        " already exists, not redeclaring")
when not declared(m_apm_absolute_value):
  proc m_apm_absolute_value*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_absolute_value".}
else:
  static :
    hint("Declaration of " & "m_apm_absolute_value" &
        " already exists, not redeclaring")
when not declared(m_apm_negate):
  proc m_apm_negate*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_negate".}
else:
  static :
    hint("Declaration of " & "m_apm_negate" & " already exists, not redeclaring")
when not declared(m_apm_copy):
  proc m_apm_copy*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_copy".}
else:
  static :
    hint("Declaration of " & "m_apm_copy" & " already exists, not redeclaring")
when not declared(m_apm_round):
  proc m_apm_round*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_round".}
else:
  static :
    hint("Declaration of " & "m_apm_round" & " already exists, not redeclaring")
when not declared(m_apm_compare):
  proc m_apm_compare*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): cint {.
      cdecl, importc: "m_apm_compare".}
else:
  static :
    hint("Declaration of " & "m_apm_compare" &
        " already exists, not redeclaring")
when not declared(m_apm_sign):
  proc m_apm_sign*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_sign".}
else:
  static :
    hint("Declaration of " & "m_apm_sign" & " already exists, not redeclaring")
when not declared(m_apm_exponent):
  proc m_apm_exponent*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_exponent".}
else:
  static :
    hint("Declaration of " & "m_apm_exponent" &
        " already exists, not redeclaring")
when not declared(m_apm_significant_digits):
  proc m_apm_significant_digits*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_significant_digits".}
else:
  static :
    hint("Declaration of " & "m_apm_significant_digits" &
        " already exists, not redeclaring")
when not declared(m_apm_is_integer):
  proc m_apm_is_integer*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_is_integer".}
else:
  static :
    hint("Declaration of " & "m_apm_is_integer" &
        " already exists, not redeclaring")
when not declared(m_apm_is_even):
  proc m_apm_is_even*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_is_even".}
else:
  static :
    hint("Declaration of " & "m_apm_is_even" &
        " already exists, not redeclaring")
when not declared(m_apm_is_odd):
  proc m_apm_is_odd*(a0: Mapminternal_520094167): cint {.cdecl,
      importc: "m_apm_is_odd".}
else:
  static :
    hint("Declaration of " & "m_apm_is_odd" & " already exists, not redeclaring")
when not declared(m_apm_gcd):
  proc m_apm_gcd*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                  a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_gcd".}
else:
  static :
    hint("Declaration of " & "m_apm_gcd" & " already exists, not redeclaring")
when not declared(m_apm_lcm):
  proc m_apm_lcm*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                  a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_lcm".}
else:
  static :
    hint("Declaration of " & "m_apm_lcm" & " already exists, not redeclaring")
when not declared(m_apm_add):
  proc m_apm_add*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                  a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_add".}
else:
  static :
    hint("Declaration of " & "m_apm_add" & " already exists, not redeclaring")
when not declared(m_apm_subtract):
  proc m_apm_subtract*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                       a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_subtract".}
else:
  static :
    hint("Declaration of " & "m_apm_subtract" &
        " already exists, not redeclaring")
when not declared(m_apm_multiply):
  proc m_apm_multiply*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                       a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_multiply".}
else:
  static :
    hint("Declaration of " & "m_apm_multiply" &
        " already exists, not redeclaring")
when not declared(m_apm_divide):
  proc m_apm_divide*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167;
                     a3: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_divide".}
else:
  static :
    hint("Declaration of " & "m_apm_divide" & " already exists, not redeclaring")
when not declared(m_apm_integer_divide):
  proc m_apm_integer_divide*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                             a2: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_integer_divide".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_divide" &
        " already exists, not redeclaring")
when not declared(m_apm_integer_div_rem):
  proc m_apm_integer_div_rem*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                              a2: Mapminternal_520094167; a3: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_integer_div_rem".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_div_rem" &
        " already exists, not redeclaring")
when not declared(m_apm_reciprocal):
  proc m_apm_reciprocal*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_reciprocal".}
else:
  static :
    hint("Declaration of " & "m_apm_reciprocal" &
        " already exists, not redeclaring")
when not declared(m_apm_factorial):
  proc m_apm_factorial*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_factorial".}
else:
  static :
    hint("Declaration of " & "m_apm_factorial" &
        " already exists, not redeclaring")
when not declared(m_apm_floor):
  proc m_apm_floor*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_floor".}
else:
  static :
    hint("Declaration of " & "m_apm_floor" & " already exists, not redeclaring")
when not declared(m_apm_ceil):
  proc m_apm_ceil*(a0: Mapminternal_520094167; a1: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_ceil".}
else:
  static :
    hint("Declaration of " & "m_apm_ceil" & " already exists, not redeclaring")
when not declared(m_apm_get_random):
  proc m_apm_get_random*(a0: Mapminternal_520094167): void {.cdecl,
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
  proc m_apm_sqrt*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_sqrt".}
else:
  static :
    hint("Declaration of " & "m_apm_sqrt" & " already exists, not redeclaring")
when not declared(m_apm_cbrt):
  proc m_apm_cbrt*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_cbrt".}
else:
  static :
    hint("Declaration of " & "m_apm_cbrt" & " already exists, not redeclaring")
when not declared(m_apm_log):
  proc m_apm_log*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_log".}
else:
  static :
    hint("Declaration of " & "m_apm_log" & " already exists, not redeclaring")
when not declared(m_apm_log10):
  proc m_apm_log10*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_log10".}
else:
  static :
    hint("Declaration of " & "m_apm_log10" & " already exists, not redeclaring")
when not declared(m_apm_exp):
  proc m_apm_exp*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_exp".}
else:
  static :
    hint("Declaration of " & "m_apm_exp" & " already exists, not redeclaring")
when not declared(m_apm_pow):
  proc m_apm_pow*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167;
                  a3: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_pow".}
else:
  static :
    hint("Declaration of " & "m_apm_pow" & " already exists, not redeclaring")
when not declared(m_apm_integer_pow):
  proc m_apm_integer_pow*(a0: Mapminternal_520094167; a1: cint;
                          a2: Mapminternal_520094167; a3: cint): void {.cdecl,
      importc: "m_apm_integer_pow".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_pow" &
        " already exists, not redeclaring")
when not declared(m_apm_integer_pow_nr):
  proc m_apm_integer_pow_nr*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                             a2: cint): void {.cdecl,
      importc: "m_apm_integer_pow_nr".}
else:
  static :
    hint("Declaration of " & "m_apm_integer_pow_nr" &
        " already exists, not redeclaring")
when not declared(m_apm_sin_cos):
  proc m_apm_sin_cos*(a0: Mapminternal_520094167; a1: Mapminternal_520094167;
                      a2: cint; a3: Mapminternal_520094167): void {.cdecl,
      importc: "m_apm_sin_cos".}
else:
  static :
    hint("Declaration of " & "m_apm_sin_cos" &
        " already exists, not redeclaring")
when not declared(m_apm_sin):
  proc m_apm_sin*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_sin".}
else:
  static :
    hint("Declaration of " & "m_apm_sin" & " already exists, not redeclaring")
when not declared(m_apm_cos):
  proc m_apm_cos*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_cos".}
else:
  static :
    hint("Declaration of " & "m_apm_cos" & " already exists, not redeclaring")
when not declared(m_apm_tan):
  proc m_apm_tan*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_tan".}
else:
  static :
    hint("Declaration of " & "m_apm_tan" & " already exists, not redeclaring")
when not declared(m_apm_sinh):
  proc m_apm_sinh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_sinh".}
else:
  static :
    hint("Declaration of " & "m_apm_sinh" & " already exists, not redeclaring")
when not declared(m_apm_cosh):
  proc m_apm_cosh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
      cdecl, importc: "m_apm_cosh".}
else:
  static :
    hint("Declaration of " & "m_apm_cosh" & " already exists, not redeclaring")
when not declared(m_apm_tanh):
  proc m_apm_tanh*(a0: Mapminternal_520094167; a1: cint; a2: Mapminternal_520094167): void {.
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