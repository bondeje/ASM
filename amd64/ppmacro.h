#define CAT(x, y) CAT_(x, y)
#define CAT_(x, y) x##y

#define CAT3(x, y, z) CAT3_(x, y, z)
#define CAT3_(x, y, z) x##y##z

#define DOLLAR() $

#define FreeBSD 0
#define NetBSD 1
#define OpenBSD 2
#define GNU_Linux 3
#define MINGW64_NT 4
#define Darwin 5
#define SunOS 6
