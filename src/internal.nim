import os

{.passL: currentSourcePath.parentDir() & "/libmapm.a".}

when defined(useFuthark) or defined(useFutharkForMapm):
  import futhark

  importc:
    path "./mapm"
    "m_apm.h"
    rename M_APM, M_APM_INTERNAL
else:
  include futhark_CBA43C8F1062BEDE
