/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_AlarmX  */

#ifndef _HA_ALARMX_
#define _HA_ALARMX_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define HA_MODULE_MAX_ALARM 6U
 #define MAX_ALARM_ADD_DATA 255U
 #define MAX_ALARM_NAME_LEN 255U
 #define HA_ALARMX_BUFFER_IDX 255U
 #define HA_ALARMX_MAX_ADD_DATA_IDX 3U
#else
 _GLOBAL_CONST unsigned char HA_MODULE_MAX_ALARM;
 _GLOBAL_CONST unsigned long MAX_ALARM_ADD_DATA;
 _GLOBAL_CONST unsigned long MAX_ALARM_NAME_LEN;
 _GLOBAL_CONST unsigned long HA_ALARMX_BUFFER_IDX;
 _GLOBAL_CONST unsigned char HA_ALARMX_MAX_ADD_DATA_IDX;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum HA_ALARMX_ACTION_ENUM
{	HA_ALARMX_ACTION_NONE,
	HA_ALARMX_ACTION_SET,
	HA_ALARMX_ACTION_SET_NO_LOG,
	HA_ALARMX_ACTION_ACK,
	HA_ALARMX_ACTION_ACK_NO_LOG,
	HA_ALARMX_ACTION_LOG_ONLY
} HA_ALARMX_ACTION_ENUM;

typedef enum HA_ALARMX_CORE_STATE_ENUM
{	HA_ALARMX_CORE_RESET,
	HA_ALARMX_CORE_IDLE,
	HA_ALARMX_CORE_SET_C,
	HA_ALARMX_CORE_SET_W
} HA_ALARMX_CORE_STATE_ENUM;

typedef struct HA_AlarmX_Helper_Internal_typ
{	plcbit Active;
	plcstring AddText[1001];
	struct ArEventLogGetIdent ArEventLogGetIdent_0;
	struct ArEventLogWrite ArEventLogWrite_0;
} HA_AlarmX_Helper_Internal_typ;

typedef struct HA_AlarmX_Core_Buffer_typ
{	plcstring name[256];
	plcstring addText[4][256];
	plcbit allowMultiple;
} HA_AlarmX_Core_Buffer_typ;

typedef struct HA_AlarmX_Core_Internal_typ
{	enum HA_ALARMX_CORE_STATE_ENUM state;
	struct HA_AlarmX_Core_Buffer_typ currentAlarm;
	struct CTON tDelay;
	signed short i;
} HA_AlarmX_Core_Internal_typ;

typedef struct HA_AlarmX_AlarmExtraData_typ
{	plcstring AddData[4][256];
} HA_AlarmX_AlarmExtraData_typ;

typedef struct HA_AlarmX_CfgMod_Internal_typ
{	struct MpAlarmXConfigAlarm MpAlarmXConfigAlarm_0;
	struct MpAlarmXAlarmConfigType AlarmCfg;
	plcstring AlarmName[256];
	unsigned char i;
	struct CTON CTON_Timeout;
} HA_AlarmX_CfgMod_Internal_typ;

typedef struct HA_AlarmX_BufferInfo_typ
{	unsigned long Address;
	unsigned long Size;
} HA_AlarmX_BufferInfo_typ;

typedef struct HA_Module_Alarm_Info_typ
{	unsigned char ErrorInfo;
	unsigned char IgnoreInfo;
} HA_Module_Alarm_Info_typ;

typedef struct HA_AlarmXCore
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType MpLink;
	unsigned long pBuffer;
	struct HA_AlarmX_AlarmExtraData_typ* pOutputData;
	plctime delayTime;
	/* VAR (analog) */
	struct HA_AlarmX_Core_Internal_typ internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HA_AlarmXCore_typ;

typedef struct HA_AlarmX_CfgModule
{
	/* VAR_INPUT (analog) */
	unsigned long MpLink;
	plcstring Prefix[256];
	unsigned long CodePrefix;
	/* VAR (analog) */
	struct HA_AlarmX_CfgMod_Internal_typ internal;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} HA_AlarmX_CfgModule_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HA_AlarmXCore(struct HA_AlarmXCore* inst);
_BUR_PUBLIC void HA_AlarmX_CfgModule(struct HA_AlarmX_CfgModule* inst);
_BUR_PUBLIC signed long HA_AlarmX_Helper(struct MpComIdentType* MpLink, plcstring* AlarmName, enum HA_ALARMX_ACTION_ENUM AlarmAction, plcstring* LogEventAddText, plcbit AllowMultiple);


#ifdef __cplusplus
};
#endif
#endif /* _HA_ALARMX_ */

