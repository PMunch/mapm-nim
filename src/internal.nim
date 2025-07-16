import os

{.passL: currentSourcePath.parentDir() / "/libmapm.a".}

when defined(useFuthark) or defined(useFutharkForMapm):
  import futhark

  importc:
    path currentSourcePath.parentDir() / "mapm"
    "m_apm.h"
    "m_apm_lc.h"
    rename M_APM, M_APM_INTERNAL
else:
  include futhark_EC9875269F340CC6
