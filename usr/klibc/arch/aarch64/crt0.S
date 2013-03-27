#
# arch/aarch64/crt0.S
#
# void _start(void)
# {
#    __libc_init(elf_structure, atexit_ptr);
# }
#

	.text
	.balign 8
	.type _start,#function
	.globl _start

_start:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	__libc_init
	.size _start,.-_start
