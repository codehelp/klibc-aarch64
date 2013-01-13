# -*- perl -*-
#
# arch/aarch64/sysstub.ph
#
# Script to generate system call stubs
#

sub make_sysstub($$$$$@) {
    my($outputdir, $fname, $type, $sname, $stype, @args) = @_;

    open(OUT, '>', "${outputdir}/${fname}.S");
    print  OUT "#include <asm/unistd.h>\n";
    print  OUT "#include <klibc/asmmacros.h>\n";
    print  OUT "	.text\n";
    print  OUT "	.type	${fname}, #function\n";
    print  OUT "	.globl	${fname}\n";
    print  out "	.balign	8\n";
    print  OUT "${fname}:\n";
    print  OUT "	mov x0,__NR_${sname}\n";
    print  OUT "	svc	0\n";
    print  OUT "	.word	__NR_${sname}\n";
    print  OUT "	.size	${fname},.-${fname}\n";
# branch if not set
#    print  OUT "	b .__syscall_error\n";
#    print  OUT "	.size .${fname},.-.${fname}\n";

}

1;
