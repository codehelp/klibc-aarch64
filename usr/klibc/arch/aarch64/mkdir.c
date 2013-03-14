#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>

int mkdir(const char *pathname, mode_t mode)
{
	return mkdirat (AT_FDCWD, pathname, mode);
}
