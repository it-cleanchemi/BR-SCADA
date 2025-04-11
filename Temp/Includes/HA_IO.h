/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_IO  */

#ifndef _HA_IO_
#define _HA_IO_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum HA_IO_ANALOG_TYPE_ENUM
{	HA_IO_ANALOG_TYPE_INT,
	HA_IO_ANALOG_TYPE_USINT,
	HA_IO_ANALOG_TYPE_SINT,
	HA_IO_ANALOG_TYPE_UINT,
	HA_IO_ANALOG_TYPE_DINT,
	HA_IO_ANALOG_TYPE_UDINT,
	HA_IO_ANALOG_TYPE_REAL,
	HA_IO_ANALOG_TYPE_LREAL
} HA_IO_ANALOG_TYPE_ENUM;

typedef struct HA_IO_Digital_Sim_typ
{	plcbit Active;
	plcbit Logical;
} HA_IO_Digital_Sim_typ;

typedef struct HA_IO_Digital_Signal_typ
{	plcbit Logical;
	plcbit EdgePosLogical;
	plcbit EdgeNegLogical;
	plcbit Filtered;
	plcbit EdgePosFiltered;
	plcbit EdgeNegFiltered;
	plcbit IOMapping;
	plcbit InvertedIOMapping;
	plcbit VisIOMapping;
	plcbit VisRefresher;
} HA_IO_Digital_Signal_typ;

typedef struct HA_IO_Digital_Par_LimitSet_typ
{	double FilterOnTime_Min;
	double FilterOnTime_Max;
	double FilterOffTime_Min;
	double FilterOffTime_Max;
} HA_IO_Digital_Par_LimitSet_typ;

typedef struct HA_IO_Digital_Par_typ
{	plcbit InvertedIOMapping;
	double FilterOnTime;
	double FilterOffTime;
} HA_IO_Digital_Par_typ;

typedef struct HA_IO_Digital_Internal_typ
{	plcbit StatusLogical;
	plcbit StatusFiltered;
	struct CTON CTON_DB_Off;
	struct CTON CTON_DB_On;
} HA_IO_Digital_Internal_typ;

typedef struct HA_IO_Digital_Forcing_typ
{	plcbit Off;
	plcbit On;
} HA_IO_Digital_Forcing_typ;

typedef struct HA_IO_Analog_Sim_typ
{	plcbit Active;
	double Logical;
} HA_IO_Analog_Sim_typ;

typedef struct HA_IO_Analog_Vis_typ
{	double Raw;
	double IO;
	double App;
} HA_IO_Analog_Vis_typ;

typedef struct HA_IO_Analog_Mapping_typ
{	signed char VarSINT;
	unsigned char VarUSINT;
	signed short VarINT;
	unsigned short VarUINT;
	signed long VarDINT;
	unsigned long VarUDINT;
	float VarREAL;
	double VarLREAL;
} HA_IO_Analog_Mapping_typ;

typedef struct HA_IO_Analog_Signal_typ
{	double UnlimitedLogical;
	plcbit MinExceeded;
	plcbit MaxExceeded;
	double Logical;
	double Filtered;
	struct HA_IO_Analog_Vis_typ Vis;
	struct HA_IO_Analog_Mapping_typ IOMapping;
} HA_IO_Analog_Signal_typ;

typedef struct HA_IO_Analog_Par_LimitSet_typ
{	double M_Min;
	double M_Max;
	double B_Min;
	double B_Max;
	double Filter_Min;
	double Filter_Max;
	double MinValue_Min;
	double MinValue_Max;
	double MaxValue_Min;
	double MaxValue_Max;
} HA_IO_Analog_Par_LimitSet_typ;

typedef struct HA_IO_Analog_Par_typ
{	double M;
	double B;
	double Filter;
	double MaxValue;
	double MinValue;
} HA_IO_Analog_Par_typ;

typedef struct HA_IO_Analog_Internal_typ
{	plcbit InitFilter;
	double Filter;
	double LastFilter;
	double Temp;
} HA_IO_Analog_Internal_typ;

typedef struct HA_IO_Analog_Forcing_typ
{	plcbit Off;
	plcbit On;
	double Value;
} HA_IO_Analog_Forcing_typ;

typedef struct HA_IO_DO
{
	/* VAR_INPUT (analog) */
	struct HA_IO_Digital_Forcing_typ Forcing;
	struct HA_IO_Digital_Par_typ Par;
	/* VAR_OUTPUT (analog) */
	struct HA_IO_Digital_Signal_typ Signal;
	/* VAR (analog) */
	struct HA_IO_Digital_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit Logical;
} HA_IO_DO_typ;

typedef struct HA_IO_DI
{
	/* VAR_INPUT (analog) */
	struct HA_IO_Digital_Forcing_typ Forcing;
	struct HA_IO_Digital_Par_typ Par;
	struct HA_IO_Digital_Sim_typ Sim;
	/* VAR_OUTPUT (analog) */
	struct HA_IO_Digital_Signal_typ Signal;
	/* VAR (analog) */
	struct HA_IO_Digital_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit IOMapping;
} HA_IO_DI_typ;

typedef struct HA_IO_AI
{
	/* VAR_INPUT (analog) */
	enum HA_IO_ANALOG_TYPE_ENUM VarType;
	struct HA_IO_Analog_Mapping_typ IOMapping;
	struct HA_IO_Analog_Forcing_typ Forcing;
	struct HA_IO_Analog_Sim_typ Sim;
	struct HA_IO_Analog_Par_typ Par;
	/* VAR_OUTPUT (analog) */
	struct HA_IO_Analog_Signal_typ Signal;
	/* VAR (analog) */
	struct HA_IO_Analog_Internal_typ Internal;
} HA_IO_AI_typ;

typedef struct HA_IO_AO
{
	/* VAR_INPUT (analog) */
	enum HA_IO_ANALOG_TYPE_ENUM VarType;
	double Logical;
	struct HA_IO_Analog_Forcing_typ Forcing;
	struct HA_IO_Analog_Par_typ Par;
	/* VAR_OUTPUT (analog) */
	struct HA_IO_Analog_Signal_typ Signal;
	/* VAR (analog) */
	struct HA_IO_Analog_Internal_typ Internal;
} HA_IO_AO_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HA_IO_DO(struct HA_IO_DO* inst);
_BUR_PUBLIC void HA_IO_DI(struct HA_IO_DI* inst);
_BUR_PUBLIC void HA_IO_AI(struct HA_IO_AI* inst);
_BUR_PUBLIC void HA_IO_AO(struct HA_IO_AO* inst);


#ifdef __cplusplus
};
#endif
#endif /* _HA_IO_ */

