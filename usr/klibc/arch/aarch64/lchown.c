#include <fcntl.h>
#include <unistd.h>

int lchown(const char *path, uid_t owner, gid_t group)
{
	return fchownat (AT_FDCWD, path, owner, group, AT_SYMLINK_NOFOLLOW);
}
