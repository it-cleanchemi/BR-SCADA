/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_Array  */

#ifndef _HA_ARRAY_
#define _HA_ARRAY_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "AsBrStr.h"
#endif
#ifdef _SG4
		#include "AsBrStr.h"
#endif
#ifdef _SGC
		#include "AsBrStr.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define HA_ARRAY_MAXELEMENTSIZE 2000U
#else
 _GLOBAL_CONST unsigned short HA_ARRAY_MAXELEMENTSIZE;
#endif







/* Prototyping of functions and function blocks */
_BUR_PUBLIC signed short HA_Array_PeekTop(unsigned long pBuffer, unsigned long sizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC signed short HA_Array_AddTop(unsigned long pBuffer, unsigned long SizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC plcbit HA_Array_AddBottom(unsigned long pBuffer, unsigned long SizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC signed short HA_Array_PeekBtm(unsigned long pBuffer, unsigned long sizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC signed short HA_Array_Pop(unsigned long pBuffer, unsigned long sizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC signed short HA_Array_Dequeue(unsigned long pBuffer, unsigned long sizeBuffer, unsigned long pElement, unsigned long SizeElement);
_BUR_PUBLIC signed short HA_Array_Pack(unsigned long pBuffer, unsigned long sizeBuffer, unsigned long SizeElement);


#ifdef __cplusplus
};
#endif
#endif /* _HA_ARRAY_ */

