/*
 * arch/arm/syscall.S
 *
 * System call common handling
 */

	.type	__syscall_common,#function
	.globl	__syscall_common

	/* ARM version - this is executed after the swi
	 stack already populated
	 load x4, x5 & x7 from the current stack in places
	 set by the AARCH64 ABI.
	x64
	sp +  0  1  2  3  4  5  6  7 = sp
	sp +  8  9 10 11 12 13 14 15 = x4
	sp + 16 17 18 19 20 21 22 23 = x5
	sp + 24 25 26 27 28 29 30 31 = x7
	sp + 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 = lr
	    */

	.balign	8
__syscall_common:

	ldr	x4, [sp,#32]   : load x4 from the address of the stack pointer + 32
	ldr	x5, [sp,#40]   : load x5 from the address of the stack pointer + 40
	ldr	x7, [lr]       : load x7 from the address of the link register
	swi	0              : software interrupt 0

	ldmfd	sp!,{x4,x5,x7,pc}

	.balign 8
1:
	.word	errno
