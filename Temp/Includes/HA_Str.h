/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_Str  */

#ifndef _HA_STR_
#define _HA_STR_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct HA_brsstrcat_Internal_typ
{	unsigned long SrcSize;
	unsigned long DestSize;
} HA_brsstrcat_Internal_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC plcbit HA_brsstrcat(unsigned long pDest, unsigned long pSrc, unsigned long DestSize);


#ifdef __cplusplus
};
#endif
#endif /* _HA_STR_ */

