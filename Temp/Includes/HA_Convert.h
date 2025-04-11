/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_Convert  */

#ifndef _HA_CONVERT_
#define _HA_CONVERT_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct HA_DT_Parser_Internal_typ
{	plcdt DateTime;
	struct DTStructure dateTimeStruct;
	plcstring year[5];
	plcstring month[3];
	plcstring day[3];
	plcstring hour[3];
	plcstring minute[3];
	plcstring second[3];
} HA_DT_Parser_Internal_typ;

typedef struct HA_DT_Formatter_Internal_typ
{	struct DTStructure dateTimeStruct;
	plcstring year[5];
	plcstring month[3];
	plcstring day[3];
	plcstring hour[3];
	plcstring minute[3];
	plcstring second[3];
	plcstring separator[2];
	unsigned char c;
	unsigned long i;
	unsigned long formatLen;
	plcstring format[81];
	plcstring output[81];
	unsigned long length;
} HA_DT_Formatter_Internal_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC plcbit HA_DT_Parser(unsigned long pValueString, unsigned long pOutDT);
_BUR_PUBLIC plcbit HA_DT_Formatter(plcdt value, unsigned long pInFormatString, unsigned long pOutString, unsigned long OutStringLength);


#ifdef __cplusplus
};
#endif
#endif /* _HA_CONVERT_ */

