.global print
.type print, %function
.section .text
print:
 mov $ 4, %rax
 mov %rsi, %rdx
 mov %rdi, %rsi
 mov $1, %rdi
 syscall
 ret
