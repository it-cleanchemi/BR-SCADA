/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_SysErr 1.00.0 */

#ifndef _HA_SYSERR_
#define _HA_SYSERR_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _HA_SysErr_VERSION
#define _HA_SysErr_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "AsBrStr.h"
		#include "ArTextSys.h"
		#include "ArEventLog.h"
#endif
#ifdef _SG4
		#include "AsBrStr.h"
		#include "ArTextSys.h"
		#include "ArEventLog.h"
#endif
#ifdef _SGC
		#include "AsBrStr.h"
		#include "ArTextSys.h"
		#include "ArEventLog.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef struct Internal_HA_SysErr_Lookup
{	struct ArTextSysGetText ArTextSysGetText_0;
	plcstring TextID[256];
	plcstring ErrorNumString[81];
	signed short State;
} Internal_HA_SysErr_Lookup;

typedef struct HA_SysErr_Lookup
{
	/* VAR_INPUT (analog) */
	signed long ErrorNum;
	/* VAR_OUTPUT (analog) */
	plcstring ErrorNumText[256];
	/* VAR (analog) */
	struct Internal_HA_SysErr_Lookup Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Done;
} HA_SysErr_Lookup_typ;

typedef struct Internal_HA_SysErr_Log
{	signed short State;
	struct HA_SysErr_Lookup HA_SysErr_Lookup_0;
	struct ArEventLogGetIdent ArEventLogGetIdent_0;
	struct ArEventLogWrite ArEventLogWrite_0;
	plcstring AddData[256];
} Internal_HA_SysErr_Log;

typedef struct HA_SysErr_Log
{
	/* VAR_INPUT (analog) */
	signed long ErrorNum;
	/* VAR_OUTPUT (analog) */
	plcstring ErrorNumText[256];
	/* VAR (analog) */
	struct Internal_HA_SysErr_Log Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Done;
} HA_SysErr_Log_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HA_SysErr_Lookup(struct HA_SysErr_Lookup* inst);
_BUR_PUBLIC void HA_SysErr_Log(struct HA_SysErr_Log* inst);


#ifdef __cplusplus
};
#endif
#endif /* _HA_SYSERR_ */

