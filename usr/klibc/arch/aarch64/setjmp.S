#
# arch/aarch64/setjmp.S
#
# setjmp/longjmp for the AARCH64 architecture
#

#include <klibc/asmmacros.h>

	.text
	.balign 8
	.globl setjmp
	.type setjmp, #function
setjmp:
	// x0-x7 are temporary, possibly skip x16
	// glibc stores only x19 to x30, this may need to be clarified.
	// also store the d registers, same as glibc
	stp	x8, x9,   [x0, #0]
	stp	x10, x11, [x0, #16]
	stp	x12, x13, [x0, #32]
	stp	x14, x15, [x0, #48]
	stp	x17, x18, [x0, #64]
	stp	x19, x20, [x0, #80]
	stp	x21, x22, [x0, #96]
	stp	x23, x24, [x0, #112]
	stp	x25, x26, [x0, #128]
	stp	x27, x28, [x0, #144]
	stp	x29, x30, [x0, #160]
	stp	d8, d9,   [x0, #176]
	stp	d10, d11, [x0, #192]
	stp	d12, d13, [x0, #208]
	stp	d14, d15, [x0, #224]
	mov x0, #0 			// set the return value of setjmp
	br x30
	.size setjmp,.-setjmp

	.text
	.balign 8
	.globl longjmp
	.type longjmp, #function
longjmp:
	ldp x8, x9,   [x0, #0]
	ldp x10, x11, [x0, #16]
	ldp x12, x13, [x0, #32]
	ldp x14, x15, [x0, #48]
	ldp x17, x18, [x0, #64]
	ldp x19, x20, [x0, #80]
	ldp x21, x22, [x0, #96]
	ldp x23, x24, [x0, #112]
	ldp x25, x26, [x0, #128]
	ldp x27, x28, [x0, #144]
	ldp x29, x30, [x0, #160]
	ldp	d8, d9,   [x0, #176]
	ldp	d10, d11, [x0, #192]
	ldp	d12, d13, [x0, #208]
	ldp	d14, d15, [x0, #224]
	mov x0, x1
	cbnz x1, 1f // if x1 is not zero, branch to 1:
	mov x0, #1
1:
	br x30
	.size longjmp,.-longjmp
