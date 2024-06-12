#define CAT(x, y) CAT_(x, y)
#define CAT_(x, y) x##y

#define CAT3(x, y, z) CAT3_(x, y, z)
#define CAT3_(x, y, z) x##y##z

#define DOLLAR() $

#define FreeBSD 0
#define Linux 1
#define Darwin 2
#define SunOS 3
