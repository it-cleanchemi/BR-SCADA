
TYPE
	Services_typ : 	STRUCT 
		DeviceName : STRING[255];
		Alarms : S_Alarms_typ;
	END_STRUCT;
	S_Alarms_typ : 	STRUCT 
		In : S_Alarms_In_typ;
		Internal : S_Alarms_Internal_typ;
		Out : S_Alarms_Out_typ;
	END_STRUCT;
	S_Alarms_In_typ : 	STRUCT 
		ResetAlarms : BOOL;
		ClearHistory : BOOL;
		ExportHistory : BOOL;
		AlarmList : ARRAY[0..HA_ALARMX_BUFFER_IDX]OF HA_AlarmX_Core_Buffer_typ;
	END_STRUCT;
	S_Alarms_Internal_typ : 	STRUCT 
		MpAlarmXListUI_0 : MpAlarmXListUI;
		MpAlarmXHistory_0 : MpAlarmXHistory;
		MpAlarmXCore_0 : MpAlarmXCore;
		CTON_ResetDelay : CTON;
		StateResetAlarms : INT;
		StateExportHistory : INT;
		MpAlarmXHistoryUI_0 : MpAlarmXHistoryUI;
		HA_AlarmXCore_0 : HA_AlarmXCore;
		Alarms_State : ARRAY[0..MAX_SKIDS]OF Alarms_Type;
		Alarm_Set_Delay : ARRAY[0..MAX_SKIDS]OF TON;
	END_STRUCT;
	S_Alarms_Out_typ : 	STRUCT 
		AlarmActive : BOOL;
		BufferInfo : HA_AlarmX_BufferInfo_typ;
	END_STRUCT;
END_TYPE
