#include <fcntl.h>
#include <unistd.h>

int chown(const char *path, uid_t owner, gid_t group)
{
	return fchownat(AT_FDCWD, path, owner, group, 0);
}
