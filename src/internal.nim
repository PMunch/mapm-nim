{.compile: "mapm/mapm5sin.c".}
{.compile: "mapm/mapm_add.c".}
{.compile: "mapm/mapm_cpi.c".}
{.compile: "mapm/mapm_div.c".}
{.compile: "mapm/mapm_exp.c".}
{.compile: "mapm/mapm_fam.c".}
{.compile: "mapm/mapm_fft.c".}
{.compile: "mapm/mapm_flr.c".}
{.compile: "mapm/mapm_fpf.c".}
{.compile: "mapm/mapm_gcd.c".}
{.compile: "mapm/mapm_lg2.c".}
{.compile: "mapm/mapm_lg3.c".}
{.compile: "mapm/mapm_lg4.c".}
{.compile: "mapm/mapm_log.c".}
{.compile: "mapm/mapm_mul.c".}
{.compile: "mapm/mapm_pow.c".}
{.compile: "mapm/mapm_rcp.c".}
{.compile: "mapm/mapm_rnd.c".}
{.compile: "mapm/mapm_set.c".}
{.compile: "mapm/mapm_sin.c".}
{.compile: "mapm/mapmasin.c".}
{.compile: "mapm/mapmasn0.c".}
{.compile: "mapm/mapmcbrt.c".}
{.compile: "mapm/mapmcnst.c".}
{.compile: "mapm/mapmfact.c".}
{.compile: "mapm/mapmfmul.c".}
{.compile: "mapm/mapmgues.c".}
{.compile: "mapm/mapmhasn.c".}
{.compile: "mapm/mapmhsin.c".}
{.compile: "mapm/mapmipwr.c".}
{.compile: "mapm/mapmistr.c".}
{.compile: "mapm/mapmpwr2.c".}
{.compile: "mapm/mapmrsin.c".}
{.compile: "mapm/mapmsqrt.c".}
{.compile: "mapm/mapmstck.c".}
{.compile: "mapm/mapmutil.c".}
{.compile: "mapm/mapmutl1.c".}
{.compile: "mapm/mapmutl2.c".}

when defined(useFuthark) or defined(useFutharkForMapm):
  import std/os
  import futhark

  importc:
    path currentSourcePath.parentDir() / "mapm"
    "m_apm.h"
    "m_apm_lc.h"
    rename M_APM, M_APM_INTERNAL
else:
  include futhark_EC9875269F340CC6
