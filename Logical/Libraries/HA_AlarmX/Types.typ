
TYPE
	HA_AlarmX_Helper_Internal_typ : 	STRUCT 
		Active : BOOL;
		AddText : STRING[1000];
		ArEventLogGetIdent_0 : ArEventLogGetIdent;
		ArEventLogWrite_0 : ArEventLogWrite;
	END_STRUCT;
	HA_ALARMX_ACTION_ENUM : 
		(
		HA_ALARMX_ACTION_NONE,
		HA_ALARMX_ACTION_SET,
		HA_ALARMX_ACTION_SET_NO_LOG,
		HA_ALARMX_ACTION_ACK,
		HA_ALARMX_ACTION_ACK_NO_LOG,
		HA_ALARMX_ACTION_LOG_ONLY
		);
	HA_ALARMX_CORE_STATE_ENUM : 
		(
		HA_ALARMX_CORE_RESET,
		HA_ALARMX_CORE_IDLE,
		HA_ALARMX_CORE_SET_C,
		HA_ALARMX_CORE_SET_W
		);
	HA_AlarmX_Core_Internal_typ : 	STRUCT 
		state : HA_ALARMX_CORE_STATE_ENUM;
		currentAlarm : HA_AlarmX_Core_Buffer_typ;
		tDelay : CTON;
		i : INT;
	END_STRUCT;
	HA_AlarmX_Core_Buffer_typ : 	STRUCT 
		name : STRING[MAX_ALARM_NAME_LEN];
		addText : ARRAY[0..HA_ALARMX_MAX_ADD_DATA_IDX]OF STRING[MAX_ALARM_ADD_DATA];
		allowMultiple : BOOL;
	END_STRUCT;
	HA_AlarmX_AlarmExtraData_typ : 	STRUCT 
		AddData : ARRAY[0..HA_ALARMX_MAX_ADD_DATA_IDX]OF STRING[MAX_ALARM_ADD_DATA];
	END_STRUCT;
	HA_AlarmX_CfgMod_Internal_typ : 	STRUCT 
		MpAlarmXConfigAlarm_0 : MpAlarmXConfigAlarm;
		AlarmCfg : MpAlarmXAlarmConfigType;
		AlarmName : STRING[MAX_ALARM_NAME_LEN];
		i : USINT;
		CTON_Timeout : CTON;
	END_STRUCT;
	HA_AlarmX_BufferInfo_typ : 	STRUCT 
		Address : UDINT;
		Size : UDINT;
	END_STRUCT;
	HA_Module_Alarm_Info_typ : 	STRUCT 
		ErrorInfo : USINT;
		IgnoreInfo : USINT;
	END_STRUCT;
END_TYPE
