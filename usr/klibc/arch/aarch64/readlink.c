#include <fcntl.h>
#include <unistd.h>

int readlink(const char *path, char *buf, size_t bufsiz)
{
	return readlinkat(AT_FDCWD, path, buf, bufsiz);
}
