#define CAT(x, y) CAT_(x, y)
#define CAT_(x, y) x##y

#define CAT3(x, y, z) CAT3_(x, y, z)
#define CAT3_(x, y, z) x##y##z

#define DOLLAR() $
