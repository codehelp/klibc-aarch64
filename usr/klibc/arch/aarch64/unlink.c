#include <fcntl.h>
#include <unistd.h>

int unlink(const char *pathname) {
	return unlinkat (AT_FDCWD, pathname, 0);
}

