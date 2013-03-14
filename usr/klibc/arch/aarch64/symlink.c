#include <fcntl.h>
#include <unistd.h>

int symlink (const char *oldpath, const char *newpath)
{
	return symlinkat (AT_FDCWD, oldpath, newpath);
}
