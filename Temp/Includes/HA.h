/* Automation Studio generated header file */
/* Do not edit ! */
/* HA  */

#ifndef _HA_
#define _HA_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum HA_TYPE_ENUM
{	HA_TYPE_INT,
	HA_TYPE_USINT,
	HA_TYPE_SINT,
	HA_TYPE_UINT,
	HA_TYPE_DINT,
	HA_TYPE_UDINT,
	HA_TYPE_REAL,
	HA_TYPE_LREAL,
	HA_TYPE_TIME,
	HA_TYPE_DT,
	HA_TYPE_STRING,
	HA_TYPE_WSTRING
} HA_TYPE_ENUM;

typedef struct HA_TypeSelect_typ
{	enum HA_TYPE_ENUM Select;
	signed char VarSINT;
	unsigned char VarUSINT;
	signed short VarINT;
	unsigned short VarUINT;
	signed long VarDINT;
	unsigned long VarUDINT;
	float VarREAL;
	double VarLREAL;
	plctime VarTIME;
	plcdt VarDT;
	unsigned long VarSTRING_ADR;
	unsigned long VarSTRING_LEN;
	unsigned long VarWSTRING_ADR;
	unsigned long VarWSTRING_LEN;
} HA_TypeSelect_typ;

typedef struct CTON
{
	/* VAR_INPUT (analog) */
	plctime PT;
	/* VAR_OUTPUT (analog) */
	plctime ET;
	/* VAR (analog) */
	struct RTInfo RTInfo_0;
	double delta;
	double counter;
	/* VAR_INPUT (digital) */
	plcbit IN;
	plcbit PAUSE;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} CTON_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CTON(struct CTON* inst);


#ifdef __cplusplus
};
#endif
#endif /* _HA_ */

