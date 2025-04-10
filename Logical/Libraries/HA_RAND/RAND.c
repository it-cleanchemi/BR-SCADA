
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
/* Generates random number */
signed short RAND(void)
{
	return (signed short)rand();
}
