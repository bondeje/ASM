#include "ppmacro.h"

#if OS_NAME == FreeBSD
#include "freebsd_syscall.h"
#define SYSCALL(X) CAT3(SYS, _, X)
#elif OS_NAME == Linux
#include "linux_syscall.h"
#define SYSCALL(X) CAT3(sys, _, X)
#else
#error "Detected OS not yet implemented."
#endif
