#ifndef  __util_h__
#define __util_h__

#include <cpctelera.h>

//asm routines
u16 get_multi(u8 factor1, u8 factor2);
u16 get_divi(u16 dividendo, u8 divisor);
//c routines
i16 sine(i16 angle);
i16 cosine(i16 angle);
void wait4OneKey();

#endif