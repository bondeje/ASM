# ASM
basic assembly programs

# syscall tables

## FreeBSD
	`curl https://raw.githubusercontent.com/freebsd/freebsd-src/main/sys/sys/syscall.h -o syscall.h`

## Linux
	`curl https://raw.githubusercontent.com/torvalds/linux/master/arch/x86/entry/syscalls/syscall_64.tbl -o linux_syscall.hp`

	manually removing empty lines and lines beginning with '#' (not that well acquainted with awk
	
	`awk '{print "#define " $4 " " $1}' linux_syscall.hp > linux_syscall.h
