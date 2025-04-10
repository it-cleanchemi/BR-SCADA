
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
/* seed function */
plcbit SRAND(unsigned short Seed)
{
	srand(Seed);
	return 1;
}
