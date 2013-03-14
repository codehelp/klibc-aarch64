#include <fcntl.h>
#include <unistd.h>

int rmdir(const char *pathname) {
	return unlinkat (AT_FDCWD, pathname, AT_REMOVEDIR);
}

