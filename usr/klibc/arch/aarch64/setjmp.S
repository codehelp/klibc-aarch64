#
# arch/arm/setjmp.S
#
# setjmp/longjmp for the ARM architecture
#

#include <klibc/asmmacros.h>

#
# "Pure ARM" version
#
# The jmp_buf is assumed to contain the following, in order:
#		r4
#		r5
#		r6
#		r7
#		r8
#		r9
#		r10
#		fp
#		sp
#		lr
#

	.text
	.balign 8
	.globl setjmp
	.type setjmp, #function
setjmp:
#	str [x0], x4
#	add x0, x0, #8     : add numeric 8 to register x0, store result in x0
#	str [x0], x5
	stmia x0, {x4-x5}
#	stmia	x0, {x4, x5, x6, x7, x8, x9, x10, fp, sp, lr}
	mov	x0, #0
	BX(lr)
	.size setjmp,.-setjmp

	.text
	.balign 8
	.globl longjmp
	.type longjmp, #function
longjmp:
	ldmia	x0, {x4, x5, x6, x7, x8, x9, x10, fp, sp, lr}
	movs	x0, x1
	moveq	x0, #1
	BX(lr)
	.size longjmp,.-longjmp
