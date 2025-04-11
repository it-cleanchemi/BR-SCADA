/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_RAND 1.00.0 */

#ifndef _HA_RAND_
#define _HA_RAND_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _HA_RAND_VERSION
#define _HA_RAND_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif



/* Prototyping of functions and function blocks */
_BUR_PUBLIC plcbit SRAND(unsigned short Seed);
_BUR_PUBLIC signed long DRAND(signed long Low, signed long High);
_BUR_PUBLIC double RRAND(double Low, double High);
_BUR_PUBLIC signed short RAND(void);


#ifdef __cplusplus
};
#endif
#endif /* _HA_RAND_ */

