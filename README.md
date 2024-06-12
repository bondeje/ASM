# ASM
basic assembly programs

# syscall tables

## FreeBSD
```curl https://raw.githubusercontent.com/freebsd/freebsd-src/main/sys/sys/syscall.h -o freebsd_syscall.h```

## NetBSD
```curl https://raw.githubusercontent.com/NetBSD/src/trunk/sys/sys/syscall.h -o netbsd_syscall.h```

## OpenBSD
```curl https://raw.githubusercontent.com/openbsd/src/master/sys/sys/syscall.h -o openbsd_syscall.h```

## Linux
```curl https://raw.githubusercontent.com/torvalds/linux/master/arch/x86/entry/syscalls/syscall_64.tbl -o linux_syscall.hp```

manually removing empty lines and lines beginning with '#' (not that well acquainted with awk)
	
```awk '{print "#define " $4 " " $1}' linux_syscall.hp > linux_syscall.h```

In future, use: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/entry/syscalls/syscall_64.tbl