/*
 * arch/i386/include/klibc/archsetjmp.h
 */

#ifndef _KLIBC_ARCHSETJMP_H
#define _KLIBC_ARCHSETJMP_H

/* 0-7 are temporary, starting at x8, skip x16, go up to x30
also store the d registers, d8 to d15.
*/

struct __jmp_buf {
	uint64_t __gregs[22];
	uint64_t __fpregs[8];
};

typedef struct __jmp_buf jmp_buf[1];

#endif				/* _SETJMP_H */
