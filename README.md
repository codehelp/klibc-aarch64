klibc-aarch64
=============

klibc experiments for AARCH64

Starting with the current klibc sources as per Debian unstable,
this repository tracks the changes needed for AARCH64 (arm64)
support within klibc assembly and the build system.

Testing with gcc-linaro-aarch64-linux-gnu-4.7+svn191987-20120925+bzr2498_linux.tar.xz

DEB_BUILD_MAINT_OPTIONS="hardening=-stackprotector" dpkg-architecture -aarm64 -c debian/rules build
