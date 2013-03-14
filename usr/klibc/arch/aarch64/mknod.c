#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

// FIXME what is the second const char * ?

int mknod(const char *pathname, mode_t mode, dev_t dev)
{
	return mknodat(AT_FDCWD, pathname, pathname, mode, dev);
}
