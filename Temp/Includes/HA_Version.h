/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_Version 1.00.0 */

#ifndef _HA_VERSION_
#define _HA_VERSION_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _HA_Version_VERSION
#define _HA_Version_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "AsBrStr.h"
		#include "ArEventLog.h"
		#include "ArProject.h"
#endif
#ifdef _SG4
		#include "AsBrStr.h"
		#include "ArEventLog.h"
		#include "ArProject.h"
#endif
#ifdef _SGC
		#include "AsBrStr.h"
		#include "ArEventLog.h"
		#include "ArProject.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef struct IdentifyConfig_Internal_typ
{	signed short state;
	plcstring AddData[501];
	struct ArProjectGetInfo ArProjectGetInfo_0;
	struct ArEventLogWrite ArEventLogWrite_0;
	struct ArEventLogGetIdent ArEventLogGetIdent_0;
} IdentifyConfig_Internal_typ;

typedef struct IdentifyConfig
{
	/* VAR_OUTPUT (analog) */
	plcstring ConfigID[256];
	plcstring ConfigVersion[33];
	/* VAR (analog) */
	struct IdentifyConfig_Internal_typ internal;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
} IdentifyConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void IdentifyConfig(struct IdentifyConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _HA_VERSION_ */

