#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int stat(const char *path, struct stat *buf)
{
	int fd = open (path, O_RDONLY);
	int ret = fstat (fd, buf);
	close (fd);
	return ret;
}
