#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int chmod(const char *path, mode_t mode)
{
	int fd = open (path, O_RDONLY);
	int ret = fchmod (fd, mode);
	close (fd);
	return ret;
}
