
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
double RRAND(double low, double high)
{
	return (((double)rand())/2147483647.0)*(high-low)+low;
}
