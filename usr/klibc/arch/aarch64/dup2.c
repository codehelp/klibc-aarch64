#include <unistd.h>

int dup2 (int fd, int fd2) {
	return dup3 (fd, fd2, 0);
}
