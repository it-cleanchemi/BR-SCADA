
TYPE
	S_Recipe_type : 	STRUCT 
		MpRecipeRegPar : MpRecipeRegPar;
		MpRecipeXml : MpRecipeXml;
		CreateNoteFile : BOOL;
	END_STRUCT;
	S_Alarms_global_type : 	STRUCT 
		MpAlarmXListUI_0 : MpAlarmXListUI;
		MpAlarmXHistory_0 : MpAlarmXHistory;
		MpAlarmXCore_0 : MpAlarmXCore;
		MpAlarmXHistoryUI_0 : MpAlarmXHistoryUI;
		HA_AlarmXCore_0 : HA_AlarmXCore;
		AlarmList : ARRAY[0..HA_ALARMX_BUFFER_IDX]OF HA_AlarmX_Core_Buffer_typ;
	END_STRUCT;
	Services_typ : 	STRUCT 
		DeviceName : STRING[255];
		Alarms_HR : ARRAY[0..MAX_SKIDS_HR]OF S_Alarms_typ;
		Alarms_LR : ARRAY[0..MAX_SKIDS_LR]OF S_Alarms_typ;
		Alarms_Global : S_Alarms_global_type;
		Recipe : S_Recipe_type;
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
		Alarms_State : Alarms_Type;
		Alarm_Set_Delay : TON;
	END_STRUCT;
	S_Alarms_Out_typ : 	STRUCT 
		AlarmActive : BOOL;
		BufferInfo : HA_AlarmX_BufferInfo_typ;
	END_STRUCT;
END_TYPE
