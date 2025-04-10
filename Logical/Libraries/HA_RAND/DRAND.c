
#include <bur/plctypes.h>
#include <stdlib.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "HA_RAND.h"
#ifdef __cplusplus
	};
#endif
/* Generates random number between the (low,high) */
signed long DRAND(signed long low, signed long high)
{
	return (rand() % (high - low + 1)) + low;
}
