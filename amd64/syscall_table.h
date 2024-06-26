#include "ppmacro.h"

#if OS_NAME == FreeBSD
    #include "freebsd_syscall.h"
    #define SYSCALL(X) CAT(SYS_, X)
#elif OS_NAME == NetBSD
    #include "netbsd_syscall.h"
    #define SYSCALL(X) CAT(SYS_, X)
#elif OS_NAME == OpenBSD
    #include "openbsd_syscall.h"
    #define SYSCALL(X) CAT(SYS_, X)
#elif OS_NAME == GNU_Linux
    #include "linux_syscall.h"
    #define SYSCALL(X) CAT(sys_, X)
#elif OS_NAME == MINGW64_NT
    //#include "windows10_syscall.h"
    //#define SYSCALL(X) CAT(Nt, X)
#else
#error "Detected OS not yet implemented."
#endif
