#include <sys/time.h>
#include <sys/types.h>
#include <sys/select.h>
#include <errno.h>
//#include <sysdep-cancel.h>

int select(int nfds, fd_set *readfds, fd_set *writefds,
			fd_set *exceptfds, struct timeval *timeout) {
	int result;
	struct timespec ts;
	if (timeout) {
		ts.tv_sec = timeout->tv_sec;
		ts.tv_nsec = timeout->tv_usec * 1000;
	}
	result = __pselect6 (nfds, readfds, writefds, exceptfds, &ts, NULL);
	if (timeout) {
		ts.tv_sec = timeout->tv_sec;
		ts.tv_nsec = timeout->tv_usec * 1000;
	}
	return result;
}
