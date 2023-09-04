
from macros import hint

type
  Uchar_1124073840 = uint8   ## Generated based on /tmp/mapm/m_apm.h:171:23
  Mapmstruct_1124073843 {.pure, inheritable, bycopy.} = object
    mapmdata*: ptr Uchar_1124073842 ## Generated based on /tmp/mapm/m_apm.h:173:9
    mapmid*: clong
    mapmrefcount*: cint
    mapmmalloclength*: cint
    mapmdatalength*: cint
    mapmexponent*: cint
    mapmsign*: cint

  Mapminternal_1124073845 = ptr Mapmstruct_1124073844 ## Generated based on /tmp/mapm/m_apm.h:183:23
  Uchar_1124073842 = (when declared(Uchar):
    Uchar
   else:
    Uchar_1124073840)
  Mapmstruct_1124073844 = (when declared(Mapmstruct):
    Mapmstruct
   else:
    Mapmstruct_1124073843)
  Mapminternal_1124073846 = (when declared(Mapminternal):
    Mapminternal
   else:
    Mapminternal_1124073845)
when not declared(Uchar):
  type
    Uchar* = Uchar_1124073840
else:
  static :
    hint("Declaration of " & "Uchar" & " already exists, not redeclaring")
when not declared(Mapmstruct):
  type
    Mapmstruct* = Mapmstruct_1124073843
else:
  static :
    hint("Declaration of " & "Mapmstruct" & " already exists, not redeclaring")
when not declared(Mapminternal):
  type
    Mapminternal* = Mapminternal_1124073845
else:
  static :
    hint("Declaration of " & "Mapminternal" & " already exists, not redeclaring")
when not declared(mapmarcsin):
  proc mapmarcsin*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arcsin".}
else:
  static :
    hint("Declaration of " & "mapmarcsin" & " already exists, not redeclaring")
when not declared(mapmarccos):
  proc mapmarccos*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arccos".}
else:
  static :
    hint("Declaration of " & "mapmarccos" & " already exists, not redeclaring")
when not declared(mapmarctan):
  proc mapmarctan*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arctan".}
else:
  static :
    hint("Declaration of " & "mapmarctan" & " already exists, not redeclaring")
when not declared(mapmarctan2):
  proc mapmarctan2*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846;
                    a3: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_arctan2".}
else:
  static :
    hint("Declaration of " & "mapmarctan2" & " already exists, not redeclaring")
when not declared(mapmarcsinh):
  proc mapmarcsinh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arcsinh".}
else:
  static :
    hint("Declaration of " & "mapmarcsinh" & " already exists, not redeclaring")
when not declared(mapmarccosh):
  proc mapmarccosh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arccosh".}
else:
  static :
    hint("Declaration of " & "mapmarccosh" & " already exists, not redeclaring")
when not declared(mapmarctanh):
  proc mapmarctanh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_arctanh".}
else:
  static :
    hint("Declaration of " & "mapmarctanh" & " already exists, not redeclaring")
when not declared(Mmzero):
  var Mmzero* {.importc: "MM_Zero".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmzero" & " already exists, not redeclaring")
when not declared(Mmone):
  var Mmone* {.importc: "MM_One".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmone" & " already exists, not redeclaring")
when not declared(Mmtwo):
  var Mmtwo* {.importc: "MM_Two".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmtwo" & " already exists, not redeclaring")
when not declared(Mmthree):
  var Mmthree* {.importc: "MM_Three".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmthree" & " already exists, not redeclaring")
when not declared(Mmfour):
  var Mmfour* {.importc: "MM_Four".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmfour" & " already exists, not redeclaring")
when not declared(Mmfive):
  var Mmfive* {.importc: "MM_Five".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmfive" & " already exists, not redeclaring")
when not declared(Mmten):
  var Mmten* {.importc: "MM_Ten".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmten" & " already exists, not redeclaring")
when not declared(Mmpi):
  var Mmpi* {.importc: "MM_PI".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmpi" & " already exists, not redeclaring")
when not declared(Mmhalfpi):
  var Mmhalfpi* {.importc: "MM_HALF_PI".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmhalfpi" & " already exists, not redeclaring")
when not declared(Mm2pi):
  var Mm2pi* {.importc: "MM_2_PI".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mm2pi" & " already exists, not redeclaring")
when not declared(Mme):
  var Mme* {.importc: "MM_E".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mme" & " already exists, not redeclaring")
when not declared(Mmlogebase10):
  var Mmlogebase10* {.importc: "MM_LOG_E_BASE_10".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmlogebase10" & " already exists, not redeclaring")
when not declared(Mmlog10basee):
  var Mmlog10basee* {.importc: "MM_LOG_10_BASE_E".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmlog10basee" & " already exists, not redeclaring")
when not declared(Mmlog2basee):
  var Mmlog2basee* {.importc: "MM_LOG_2_BASE_E".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmlog2basee" & " already exists, not redeclaring")
when not declared(Mmlog3basee):
  var Mmlog3basee* {.importc: "MM_LOG_3_BASE_E".}: Mapminternal_1124073846
else:
  static :
    hint("Declaration of " & "Mmlog3basee" & " already exists, not redeclaring")
when not declared(mapminit):
  proc mapminit*(): Mapminternal_1124073846 {.cdecl, importc: "m_apm_init".}
else:
  static :
    hint("Declaration of " & "mapminit" & " already exists, not redeclaring")
when not declared(mapmfree):
  proc mapmfree*(a0: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_free".}
else:
  static :
    hint("Declaration of " & "mapmfree" & " already exists, not redeclaring")
when not declared(mapmfreeallmem):
  proc mapmfreeallmem*(): void {.cdecl, importc: "m_apm_free_all_mem".}
else:
  static :
    hint("Declaration of " & "mapmfreeallmem" &
        " already exists, not redeclaring")
when not declared(mapmtrimmemusage):
  proc mapmtrimmemusage*(): void {.cdecl, importc: "m_apm_trim_mem_usage".}
else:
  static :
    hint("Declaration of " & "mapmtrimmemusage" &
        " already exists, not redeclaring")
when not declared(mapmlibversion):
  proc mapmlibversion*(a0: cstring): cstring {.cdecl,
      importc: "m_apm_lib_version".}
else:
  static :
    hint("Declaration of " & "mapmlibversion" &
        " already exists, not redeclaring")
when not declared(mapmlibshortversion):
  proc mapmlibshortversion*(a0: cstring): cstring {.cdecl,
      importc: "m_apm_lib_short_version".}
else:
  static :
    hint("Declaration of " & "mapmlibshortversion" &
        " already exists, not redeclaring")
when not declared(mapmsetstring):
  proc mapmsetstring*(a0: Mapminternal_1124073846; a1: cstring): void {.cdecl,
      importc: "m_apm_set_string".}
else:
  static :
    hint("Declaration of " & "mapmsetstring" &
        " already exists, not redeclaring")
when not declared(mapmsetdouble):
  proc mapmsetdouble*(a0: Mapminternal_1124073846; a1: cdouble): void {.cdecl,
      importc: "m_apm_set_double".}
else:
  static :
    hint("Declaration of " & "mapmsetdouble" &
        " already exists, not redeclaring")
when not declared(mapmsetlong):
  proc mapmsetlong*(a0: Mapminternal_1124073846; a1: clong): void {.cdecl,
      importc: "m_apm_set_long".}
else:
  static :
    hint("Declaration of " & "mapmsetlong" & " already exists, not redeclaring")
when not declared(mapmtostring):
  proc mapmtostring*(a0: cstring; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_to_string".}
else:
  static :
    hint("Declaration of " & "mapmtostring" & " already exists, not redeclaring")
when not declared(mapmtofixptstring):
  proc mapmtofixptstring*(a0: cstring; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_to_fixpt_string".}
else:
  static :
    hint("Declaration of " & "mapmtofixptstring" &
        " already exists, not redeclaring")
when not declared(mapmtofixptstringex):
  proc mapmtofixptstringex*(a0: cstring; a1: cint; a2: Mapminternal_1124073846;
                            a3: cschar; a4: cschar; a5: cint): void {.cdecl,
      importc: "m_apm_to_fixpt_stringex".}
else:
  static :
    hint("Declaration of " & "mapmtofixptstringex" &
        " already exists, not redeclaring")
when not declared(mapmtofixptstringexp):
  proc mapmtofixptstringexp*(a0: cint; a1: Mapminternal_1124073846; a2: cschar;
                             a3: cschar; a4: cint): cstring {.cdecl,
      importc: "m_apm_to_fixpt_stringexp".}
else:
  static :
    hint("Declaration of " & "mapmtofixptstringexp" &
        " already exists, not redeclaring")
when not declared(mapmtointegerstring):
  proc mapmtointegerstring*(a0: cstring; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_to_integer_string".}
else:
  static :
    hint("Declaration of " & "mapmtointegerstring" &
        " already exists, not redeclaring")
when not declared(mapmabsolutevalue):
  proc mapmabsolutevalue*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_absolute_value".}
else:
  static :
    hint("Declaration of " & "mapmabsolutevalue" &
        " already exists, not redeclaring")
when not declared(mapmnegate):
  proc mapmnegate*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_negate".}
else:
  static :
    hint("Declaration of " & "mapmnegate" & " already exists, not redeclaring")
when not declared(mapmcopy):
  proc mapmcopy*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_copy".}
else:
  static :
    hint("Declaration of " & "mapmcopy" & " already exists, not redeclaring")
when not declared(mapmround):
  proc mapmround*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_round".}
else:
  static :
    hint("Declaration of " & "mapmround" & " already exists, not redeclaring")
when not declared(mapmcompare):
  proc mapmcompare*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): cint {.
      cdecl, importc: "m_apm_compare".}
else:
  static :
    hint("Declaration of " & "mapmcompare" & " already exists, not redeclaring")
when not declared(mapmsign):
  proc mapmsign*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_sign".}
else:
  static :
    hint("Declaration of " & "mapmsign" & " already exists, not redeclaring")
when not declared(mapmexponent):
  proc mapmexponent*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_exponent".}
else:
  static :
    hint("Declaration of " & "mapmexponent" & " already exists, not redeclaring")
when not declared(mapmsignificantdigits):
  proc mapmsignificantdigits*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_significant_digits".}
else:
  static :
    hint("Declaration of " & "mapmsignificantdigits" &
        " already exists, not redeclaring")
when not declared(mapmisinteger):
  proc mapmisinteger*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_is_integer".}
else:
  static :
    hint("Declaration of " & "mapmisinteger" &
        " already exists, not redeclaring")
when not declared(mapmiseven):
  proc mapmiseven*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_is_even".}
else:
  static :
    hint("Declaration of " & "mapmiseven" & " already exists, not redeclaring")
when not declared(mapmisodd):
  proc mapmisodd*(a0: Mapminternal_1124073846): cint {.cdecl,
      importc: "m_apm_is_odd".}
else:
  static :
    hint("Declaration of " & "mapmisodd" & " already exists, not redeclaring")
when not declared(mapmgcd):
  proc mapmgcd*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                a2: Mapminternal_1124073846): void {.cdecl, importc: "m_apm_gcd".}
else:
  static :
    hint("Declaration of " & "mapmgcd" & " already exists, not redeclaring")
when not declared(mapmlcm):
  proc mapmlcm*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                a2: Mapminternal_1124073846): void {.cdecl, importc: "m_apm_lcm".}
else:
  static :
    hint("Declaration of " & "mapmlcm" & " already exists, not redeclaring")
when not declared(mapmadd):
  proc mapmadd*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                a2: Mapminternal_1124073846): void {.cdecl, importc: "m_apm_add".}
else:
  static :
    hint("Declaration of " & "mapmadd" & " already exists, not redeclaring")
when not declared(mapmsubtract):
  proc mapmsubtract*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                     a2: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_subtract".}
else:
  static :
    hint("Declaration of " & "mapmsubtract" & " already exists, not redeclaring")
when not declared(mapmmultiply):
  proc mapmmultiply*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                     a2: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_multiply".}
else:
  static :
    hint("Declaration of " & "mapmmultiply" & " already exists, not redeclaring")
when not declared(mapmdivide):
  proc mapmdivide*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846;
                   a3: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_divide".}
else:
  static :
    hint("Declaration of " & "mapmdivide" & " already exists, not redeclaring")
when not declared(mapmintegerdivide):
  proc mapmintegerdivide*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                          a2: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_integer_divide".}
else:
  static :
    hint("Declaration of " & "mapmintegerdivide" &
        " already exists, not redeclaring")
when not declared(mapmintegerdivrem):
  proc mapmintegerdivrem*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                          a2: Mapminternal_1124073846; a3: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_integer_div_rem".}
else:
  static :
    hint("Declaration of " & "mapmintegerdivrem" &
        " already exists, not redeclaring")
when not declared(mapmreciprocal):
  proc mapmreciprocal*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_reciprocal".}
else:
  static :
    hint("Declaration of " & "mapmreciprocal" &
        " already exists, not redeclaring")
when not declared(mapmfactorial):
  proc mapmfactorial*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_factorial".}
else:
  static :
    hint("Declaration of " & "mapmfactorial" &
        " already exists, not redeclaring")
when not declared(mapmfloor):
  proc mapmfloor*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_floor".}
else:
  static :
    hint("Declaration of " & "mapmfloor" & " already exists, not redeclaring")
when not declared(mapmceil):
  proc mapmceil*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_ceil".}
else:
  static :
    hint("Declaration of " & "mapmceil" & " already exists, not redeclaring")
when not declared(mapmgetrandom):
  proc mapmgetrandom*(a0: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_get_random".}
else:
  static :
    hint("Declaration of " & "mapmgetrandom" &
        " already exists, not redeclaring")
when not declared(mapmsetrandomseed):
  proc mapmsetrandomseed*(a0: cstring): void {.cdecl,
      importc: "m_apm_set_random_seed".}
else:
  static :
    hint("Declaration of " & "mapmsetrandomseed" &
        " already exists, not redeclaring")
when not declared(mapmsqrt):
  proc mapmsqrt*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_sqrt".}
else:
  static :
    hint("Declaration of " & "mapmsqrt" & " already exists, not redeclaring")
when not declared(mapmcbrt):
  proc mapmcbrt*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_cbrt".}
else:
  static :
    hint("Declaration of " & "mapmcbrt" & " already exists, not redeclaring")
when not declared(mapmlog):
  proc mapmlog*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_log".}
else:
  static :
    hint("Declaration of " & "mapmlog" & " already exists, not redeclaring")
when not declared(mapmlog10):
  proc mapmlog10*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_log10".}
else:
  static :
    hint("Declaration of " & "mapmlog10" & " already exists, not redeclaring")
when not declared(mapmexp):
  proc mapmexp*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_exp".}
else:
  static :
    hint("Declaration of " & "mapmexp" & " already exists, not redeclaring")
when not declared(mapmpow):
  proc mapmpow*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846;
                a3: Mapminternal_1124073846): void {.cdecl, importc: "m_apm_pow".}
else:
  static :
    hint("Declaration of " & "mapmpow" & " already exists, not redeclaring")
when not declared(mapmintegerpow):
  proc mapmintegerpow*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846;
                       a3: cint): void {.cdecl, importc: "m_apm_integer_pow".}
else:
  static :
    hint("Declaration of " & "mapmintegerpow" &
        " already exists, not redeclaring")
when not declared(mapmintegerpownr):
  proc mapmintegerpownr*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                         a2: cint): void {.cdecl,
      importc: "m_apm_integer_pow_nr".}
else:
  static :
    hint("Declaration of " & "mapmintegerpownr" &
        " already exists, not redeclaring")
when not declared(mapmsincos):
  proc mapmsincos*(a0: Mapminternal_1124073846; a1: Mapminternal_1124073846;
                   a2: cint; a3: Mapminternal_1124073846): void {.cdecl,
      importc: "m_apm_sin_cos".}
else:
  static :
    hint("Declaration of " & "mapmsincos" & " already exists, not redeclaring")
when not declared(mapmsin):
  proc mapmsin*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_sin".}
else:
  static :
    hint("Declaration of " & "mapmsin" & " already exists, not redeclaring")
when not declared(mapmcos):
  proc mapmcos*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_cos".}
else:
  static :
    hint("Declaration of " & "mapmcos" & " already exists, not redeclaring")
when not declared(mapmtan):
  proc mapmtan*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_tan".}
else:
  static :
    hint("Declaration of " & "mapmtan" & " already exists, not redeclaring")
when not declared(mapmsinh):
  proc mapmsinh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_sinh".}
else:
  static :
    hint("Declaration of " & "mapmsinh" & " already exists, not redeclaring")
when not declared(mapmcosh):
  proc mapmcosh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_cosh".}
else:
  static :
    hint("Declaration of " & "mapmcosh" & " already exists, not redeclaring")
when not declared(mapmtanh):
  proc mapmtanh*(a0: Mapminternal_1124073846; a1: cint; a2: Mapminternal_1124073846): void {.
      cdecl, importc: "m_apm_tanh".}
else:
  static :
    hint("Declaration of " & "mapmtanh" & " already exists, not redeclaring")
when not declared(mapmcppprecision):
  proc mapmcppprecision*(a0: cint): void {.cdecl, importc: "m_apm_cpp_precision".}
else:
  static :
    hint("Declaration of " & "mapmcppprecision" &
        " already exists, not redeclaring")