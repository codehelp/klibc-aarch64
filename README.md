klibc-aarch64
=============

klibc experiments for AARCH64

Starting with the current klibc sources as per Debian unstable,
this repository tracks the changes needed for AARCH64 (arm64)
support within klibc assembly and the build system.

Testing with gcc-linaro-aarch64-linux-gnu-4.7+svn191987-20120925+bzr2498_linux.tar.xz

DEB_BUILD_MAINT_OPTIONS="hardening=-stackprotector" dpkg-architecture -aarm64 -c debian/rules build

Other resources:
ARM IHI 0042E : Procedure Call Standard for the ARM Architecture
PRD03-GENC-010197 15.0 : ARMv8 Instruction Set Overview
http://linux.codehelp.co.uk/serendipity/

Neil Williams <codehelp@debian.org>
Andy Simpkins <andy-debian@koipond.org>

