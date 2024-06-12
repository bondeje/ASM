#include "ppmacro.h"

#if OS_NAME == FreeBSD
#include "freebsd_syscall.h"
#define SYSCALL(cmd) CAT3(SYS, _, cmd)
#endif
