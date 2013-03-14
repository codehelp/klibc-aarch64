#include <fcntl.h>
#include <sys/time.h>

int utimes (const char *file, const struct timeval tvp[2]) {
	struct timespec ts[2];

	if (tvp) {
		ts->tv_sec = tvp->tv_sec;
		ts->tv_nsec = tvp->tv_usec * 1000;
	}
	return utimensat (AT_FDCWD, file, &ts[0], 0);
}

