(*Global Structrues*)
(**)
(*Raw Modbus Data*)

TYPE
	Modbus_Type : 	STRUCT 
		Modbus_Alarms : Modbus_Alarm_Type;
		Modbus_Dosing : Modbus_7000_Type;
		Modbus_PeroxyMAX : Modbus_6000_Type;
	END_STRUCT;
END_TYPE

(*Raw Modbus IO*)

TYPE
	Modbus_Alarm_Type : 	STRUCT 
		Block48_Int : ARRAY[0..60]OF INT;
	END_STRUCT;
	Modbus_6000_Type : 	STRUCT 
		Block1_Int : ARRAY[0..124]OF INT;
		Block2_Int : ARRAY[0..124]OF INT;
		Block3_Real : ARRAY[0..62]OF REAL;
		Block4_Real : ARRAY[0..62]OF REAL;
		Block5_Real : ARRAY[0..62]OF REAL;
	END_STRUCT;
	Modbus_7000_Type : 	STRUCT 
		Block6_Int : ARRAY[0..124]OF INT;
		Block7_Int : ARRAY[0..124]OF INT;
		Block61_Int : ARRAY[0..248]OF USINT;
		Block8_Real : ARRAY[0..62]OF REAL;
		Block9_Real : ARRAY[0..62]OF REAL;
		Block10_Real : ARRAY[0..62]OF REAL;
		Block11_Real : ARRAY[0..62]OF REAL;
	END_STRUCT;
END_TYPE

(**)
(*Final Mapping Variables*)

TYPE
	Skid_type : 	STRUCT 
		Pmax_Pump_101 : Pmax_Pump_101_Type;
		Pmax_Pump_101B : Pmax_Pump_101B_Type;
		Pmax_Pump_102 : Pmax_Pump_102_Type;
		Pmax_Pump_103 : Pmax_Pump_103_Type;
		Pmax_Pump_104 : Pmax_Pump_104_Type;
		BufferTank : BufferTank_Variables_Type;
		ConversionRatios : ConversionRatios_Type;
		Sensor_Variables : Sensor_Variables_Type;
		Heartbeat : Heartbeat_Type;
		Alarms : Alarms_Type;
		Pmax_General_Variables : Pmax_General_Variables_Type;
		Dosing_Pump_201 : Dosing_Pump_201_Type;
		Dosing_Pump_202 : Dosing_Pump_202_Type;
		Dosing_Pump_203 : Dosing_Pump_203_Type;
		Dosing_Pump_204 : Dosing_Pump_204_Type;
		Dosing_Pump_205 : Dosing_Pump_205_Type;
		Dosing_Pump_206 : Dosing_Pump_206_Type;
		Dosing_Pump_207 : Dosing_Pump_207_Type;
		Dosing_Pump_208 : Dosing_Pump_208_Type;
		VisBool : VisBool_Type;
		ErrorInfo : Skid_ErrorInfo_typ;
		tempAlarm : HA_AlarmX_Core_Buffer_typ;
		Error : BOOL;
		StateResetAlarms : UINT;
		AlarmName : STRING[80];
		i : USINT;
		AlarmCfg : MpAlarmXAlarmConfigType;
		MpAlarmXConfigAlarm : MpAlarmXConfigAlarm;
		AlarmsInitialized : BOOL;
		AlarmStartupDelay : TON;
	END_STRUCT;
END_TYPE

(**)
(*Visualization Components*)

TYPE
	Skid_ErrorInfo_typ : 	STRUCT 
		State : STRING[80];
		Text : STRING[255];
		Severity : USINT;
	END_STRUCT;
	Vis_Type : 	STRUCT 
		Pumps : USINT;
		Main : Vis_Main_Type;
		Global : Vis_Global;
		Alarms : Vis_Alarms_Type;
	END_STRUCT;
END_TYPE

(**)

TYPE
	Par_System_type : 	STRUCT 
		LanguageCode : STRING[80];
	END_STRUCT;
END_TYPE

(*Retain Machine State After Power Cycle*)

TYPE
	Par_Type : 	STRUCT 
		System : Par_System_type;
	END_STRUCT;
END_TYPE

(**)
(*Retain Parameter After Power Cycle*)

TYPE
	Rem_Type : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
END_TYPE

(**)
(*Master Write Command *)

TYPE
	CMD_Type : 	STRUCT 
		Stop : BOOL;
		Start : BOOL;
		Write_ESTOP : CMD_Write_ESTOP_Type;
		Write_UNIT_ID : CMD_Write_UNIT_ID_Type;
		Write_UNIT_ACK : CMD_Write_UNIT_ACK_Type;
		Write_P203_STP_CMD : CMD_Write_P203_STP_CMD_Type;
		Write_P203_STRT_CMD : CMD_Write_P203_STRT_CMD_Type;
		Write_P203_HOA : CMD_Write_P203_HOA_Type;
		Write_P203_PPM : CMD_Write_P203_PPM_Type;
		Write_P203_SP : CMD_Write_P203_SP_Type;
		Write_P202_STP_CMD : CMD_Write_P202_STP_CMD_Type;
		Write_P202_STRT_CMD : CMD_Write_P202_STRT_CMD_Type;
		Write_P202_HOA : CMD_Write_P202_HOA_Type;
		Write_P202_PPM : CMD_Write_P202_PPM_Type;
		Write_P202_SP : CMD_Write_P202_SP_Type;
		Write_P104_STP_CMD : CMD_Write_P104_STP_CMD_Type;
		Write_P104_STRT_CMD : CMD_Write_P104_STRT_CMD_Type;
		Write_P104_SP : CMD_Write_P104_SP_Type;
		Write_P103_STP_CMD : CMD_Write_P103_STP_CMD_Type;
		Write_P103_STRT_CMD : CMD_Write_P103_STRT_CMD_Type;
		Write_P103_SP : CMD_Write_P103_SP_Type;
		Write_P102_STP_CMD : CMD_Write_P102_STP_CMD_Type;
		Write_P102_STRT_CMD : CMD_Write_P102_STRT_CMD_Type;
		Write_P102_SP : CMD_Write_P102_SP_Type;
		Write_P101_STP_CMD : CMD_Write_P101_STP_CMD_Type;
		Write_P101_STRT_CMD : CMD_Write_P101_STRT_CMD_Type;
		Write_P101_SP : CMD_Write_P101_SP_Type;
		Write_P201_STP_CMD : CMD_Write_P201_STP_CMD_Type;
		Write_P201_STRT_CMD : CMD_Write_P201_STRT_CMD_Type;
		Write_P201_HOA : CMD_Write_P201_HOA_Type;
		Write_P201_PPM : CMD_Write_P201_PPM_Type;
		Write_P201_SP : CMD_Write_P201_SP_Type;
		Write_EFF_1 : CMD_Write_EFF_1_Type;
		Write_EFF_2 : CMD_Write_EFF_2_Type;
		Write_NAOH_TO_H2O2 : CMD_Write_NAOH_TO_H2O2_Type;
		Write_TRI_TO_H2O2 : CMD_Write_TRI_TO_H2O2_Type;
		Write_PMAX_HOA : CMD_Write_PMAX_HOA_Type;
		Write_PMAX_CONC : CMD_Write_PMAX_CONC_Type;
		Write_HP_CONC : CMD_Write_HP_CONC_Type;
		Write_NAOH_CONC : CMD_Write_NAOH_CONC_Type;
		Write_UNLOCK_CMD : CMD_Write_UNLOCK_CMD_Type;
		Write_LOCK_CMD : CMD_Write_LOCK_CMD_Type;
		Write_FI301_SIM_CMD : CMD_Write_FI301_SIM_CMD_Type;
		Write_FI301_MEA_CMD : CMD_Write_FI301_MEA_CMD_Type;
		Write_FI301_SIM : CMD_Write_FI301_SIM_Type;
		Write_FI302_SIM_CMD : CMD_Write_FI302_SIM_CMD_Type;
		Write_FI302_MEA_CMD : CMD_Write_FI302_MEA_CMD_Type;
		Write_FI302_SIM : CMD_Write_FI302_SIM_Type;
		Write_FI303_SIM_CMD : CMD_Write_FI303_SIM_CMD_Type;
		Write_FI303_MEA_CMD : CMD_Write_FI303_MEA_CMD_Type;
		Write_FI303_SIM : CMD_Write_FI303_SIM_Type;
		Write_XV101_OPEN_CMD : CMD_Write_XV101_OPEN_CMD_Type;
		Write_XV102_OPEN_CMD : CMD_Write_XV102_OPEN_CMD_Type;
		Write_XV103_OPEN_CMD : CMD_Write_XV103_OPEN_CMD_Type;
		Write_XV104_OPEN_CMD : CMD_Write_XV104_OPEN_CMD_Type;
		Write_XV201_OPEN_CMD : CMD_Write_XV201_OPEN_CMD_Type;
		Write_XV202_OPEN_CMD : CMD_Write_XV202_OPEN_CMD_Type;
		Write_XV203_OPEN_CMD : CMD_Write_XV203_OPEN_CMD_Type;
		Write_XV204_OPEN_CMD : CMD_Write_XV204_OPEN_CMD_Type;
		Write_RECALC_CMD : CMD_Write_RECALC_CMD_Type;
		Write_TOTALIZER_RESET : CMD_Write_TOTALIZER_RESET_Type;
		Write_AS_USER : CMD_Write_AS_USER_Type;
		Write_AS_ACCESS : CMD_Write_AS_ACCESS_Type;
		Write_P204_STP_CMD : CMD_Write_P204_STP_CMD_Type;
		Write_P204_STRT_CMD : CMD_Write_P204_STRT_CMD_Type;
		Write_P204_HOA : CMD_Write_P204_HOA_Type;
		Write_P204_PPM : CMD_Write_P204_PPM_Type;
		Write_P204_SP : CMD_Write_P204_SP_Type;
		Write_FI304_SIM_CMD : CMD_Write_FI304_SIM_CMD_Type;
		Write_FI304_MEA_CMD : CMD_Write_FI304_MEA_CMD_Type;
		Write_FI304_SIM : CMD_Write_FI304_SIM_Type;
	END_STRUCT;
END_TYPE

(*Misc. Write Commands*)

TYPE
	CMD_Write_ESTOP_Type : 	STRUCT 
		wESTOP : UINT := 1;
		Send : BOOL;
	END_STRUCT;
	CMD_Write_UNIT_ACK_Type : 	STRUCT 
		wUNIT_ACK : UINT := 1;
	END_STRUCT;
	CMD_Write_AS_ACCESS_Type : 	STRUCT 
		Send : BOOL;
		wAS_ACCESS : UINT := 1;
	END_STRUCT;
	CMD_Write_AS_USER_Type : 	STRUCT 
		Send : BOOL;
		wAS_USER : UINT := 1;
	END_STRUCT;
	CMD_Write_RECALC_CMD_Type : 	STRUCT 
		Send : BOOL;
		wRECALC_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_TOTALIZER_RESET_Type : 	STRUCT 
		Send : BOOL;
		wTOTALIZER_RESET : UINT := 1;
	END_STRUCT;
	CMD_Write_UNLOCK_CMD_Type : 	STRUCT 
		Send : BOOL;
		wUNLOCK_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_LOCK_CMD_Type : 	STRUCT 
		Send : BOOL;
		wLOCK_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_EFF_1_Type : 	STRUCT 
		Send : BOOL;
		wEFF_1 : REAL;
		wEFF_1_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_EFF_2_Type : 	STRUCT 
		Send : BOOL;
		wEFF_2 : REAL;
		wEFF_2_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_NAOH_TO_H2O2_Type : 	STRUCT 
		Send : BOOL;
		wNAOH_TO_H2O2 : REAL;
		wNAOH_TO_H2O2_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_TRI_TO_H2O2_Type : 	STRUCT 
		Send : BOOL;
		wTRI_TO_H2O2 : REAL;
		wTRI_TO_H2O2_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_PMAX_HOA_Type : 	STRUCT 
		Send : BOOL;
		wPMAX_HOA : UINT;
		Cancel : BOOL;
		wPMAX_HOA_String : STRING[80];
	END_STRUCT;
	CMD_Write_PMAX_CONC_Type : 	STRUCT 
		Send : BOOL;
		wPMAX_CONC : REAL;
		wPMAX_CONC_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_HP_CONC_Type : 	STRUCT 
		Send : BOOL;
		wHP_CONC : REAL;
		wHP_CONC_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_NAOH_CONC_Type : 	STRUCT 
		Send : BOOL;
		wNAOH_CONC : REAL;
		wNAOH_CONC_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P101 Write Commands*)

TYPE
	CMD_Write_P101_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP101_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P101_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP101_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P101_SP_Type : 	STRUCT 
		Send : BOOL;
		wP101_SP : REAL;
		wP101_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P102 Write Commands*)

TYPE
	CMD_Write_P102_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP102_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P102_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP102_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P102_SP_Type : 	STRUCT 
		Send : BOOL;
		wP102_SP : REAL;
		wP102_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P103 Write Commands*)

TYPE
	CMD_Write_P103_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP103_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P103_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP103_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P103_SP_Type : 	STRUCT 
		Send : BOOL;
		wP103_SP : REAL;
		wP103_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P104 Write Commands*)

TYPE
	CMD_Write_P104_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP104_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P104_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP104_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P104_SP_Type : 	STRUCT 
		Send : BOOL;
		wP104_SP : REAL;
		wP104_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P201 Write Commands*)

TYPE
	CMD_Write_P201_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP201_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P201_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP201_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P201_SP_Type : 	STRUCT 
		Send : BOOL;
		wP201_SP : REAL;
		wP201_SP_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P201_PPM_Type : 	STRUCT 
		Send : BOOL;
		wP201_PPM : REAL;
		wP201_PPM_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P201_HOA_Type : 	STRUCT 
		Cancel : BOOL;
		Send : BOOL;
		wP201_HOA_String : STRING[80];
		wP201_HOA : UINT;
	END_STRUCT;
END_TYPE

(*P202 Write Commands*)

TYPE
	CMD_Write_P202_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP202_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P202_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP202_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P202_SP_Type : 	STRUCT 
		Send : BOOL;
		wP202_SP : REAL;
		wP202_SP_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P202_PPM_Type : 	STRUCT 
		Send : BOOL;
		wP202_PPM : REAL;
		wP202_PPM_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P202_HOA_Type : 	STRUCT 
		Cancel : BOOL;
		Send : BOOL;
		wP202_HOA_String : STRING[80];
		wP202_HOA : UINT;
	END_STRUCT;
END_TYPE

(*P203 Write Commands*)

TYPE
	CMD_Write_P203_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP203_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P203_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP203_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P203_SP_Type : 	STRUCT 
		Send : BOOL;
		wP203_SP : REAL;
		wP203_SP_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P203_PPM_Type : 	STRUCT 
		Send : BOOL;
		wP203_PPM : REAL;
		wP203_PPM_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P203_HOA_Type : 	STRUCT 
		Send : BOOL;
		wP203_HOA : UINT;
		Cancel : BOOL;
		wP203_HOA_String : STRING[80];
	END_STRUCT;
END_TYPE

(*P204 Write Commands*)

TYPE
	CMD_Write_P204_STP_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP204_STP_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P204_STRT_CMD_Type : 	STRUCT 
		Send : BOOL;
		wP204_STRT_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_P204_SP_Type : 	STRUCT 
		Send : BOOL;
		wP204_SP : REAL;
		wP204_SP_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P204_PPM_Type : 	STRUCT 
		Send : BOOL;
		wP204_PPM : REAL;
		wP204_PPM_SWAPPED : REAL;
	END_STRUCT;
	CMD_Write_P204_HOA_Type : 	STRUCT 
		Send : BOOL;
		wP204_HOA : UINT;
		Cancel : BOOL;
		wP204_HOA_String : STRING[80];
	END_STRUCT;
END_TYPE

(*UID Write Command*)

TYPE
	CMD_Write_UNIT_ID_Type : 	STRUCT 
		Send : BOOL;
		wUNIT_ID : UINT;
	END_STRUCT;
END_TYPE

(*FI301 Write Commands*)

TYPE
	CMD_Write_FI301_SIM_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI301_SIM_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI301_MEA_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI301_MEA_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI301_SIM_Type : 	STRUCT 
		Send : BOOL;
		wFI301_SIM : REAL;
		wFI301_SIM_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*FI302 Write Commands*)

TYPE
	CMD_Write_FI302_SIM_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI302_SIM_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI302_MEA_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI302_MEA_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI302_SIM_Type : 	STRUCT 
		Send : BOOL;
		wFI302_SIM : REAL;
		wFI302_SIM_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*FI303 Write Commands*)

TYPE
	CMD_Write_FI303_SIM_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI303_SIM_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI303_MEA_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI303_MEA_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI303_SIM_Type : 	STRUCT 
		Send : BOOL;
		wFI303_SIM : REAL;
		wFI303_SIM_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*FI304 Write Commands*)

TYPE
	CMD_Write_FI304_SIM_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI304_SIM_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI304_MEA_CMD_Type : 	STRUCT 
		Send : BOOL;
		wFI304_MEA_CMD : UINT := 1;
	END_STRUCT;
	CMD_Write_FI304_SIM_Type : 	STRUCT 
		Send : BOOL;
		wFI304_SIM : REAL;
		wFI304_SIM_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*XV101 Solenoid Commands*)

TYPE
	CMD_Write_XV101_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV101_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV102 Solenoid Commands*)

TYPE
	CMD_Write_XV102_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV102_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV103 Solenoid Commands*)

TYPE
	CMD_Write_XV103_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV103_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV104 Solenoid Commands*)

TYPE
	CMD_Write_XV104_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV104_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV201 Solenoid Commands*)

TYPE
	CMD_Write_XV201_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV201_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV202 Solenoid Commands*)

TYPE
	CMD_Write_XV202_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV202_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV203 Solenoid Commands*)

TYPE
	CMD_Write_XV203_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV203_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(*XV204 Solenoid Commands*)

TYPE
	CMD_Write_XV204_OPEN_CMD_Type : 	STRUCT 
		Send : BOOL;
		wXV204_OPEN_CMD : UINT := 1;
	END_STRUCT;
END_TYPE

(**)

TYPE
	Vis_Global : 	STRUCT 
		ClientInfo : ARRAY[0..MAX_CLIENTS]OF Vis_Global_ClientInfo;
		ErrorReset : BOOL;
	END_STRUCT;
	Vis_Global_ClientInfo : 	STRUCT 
		LoginFailed : BOOL;
		LogoutSuccess : BOOL;
		LoginSuccess : BOOL;
		LogoutRequest : BOOL;
		LoginRequest : BOOL;
		Password : STRING[80];
		User : STRING[80];
		SelectedSkidIdx : USINT;
		UserID : STRING[80];
		IsValid : BOOL;
		LoginBypass : BOOL;
		LoginErrorInfo : STRING[80];
		SelectedAlrm_UnitID : STRING[80];
		SelectedAlrm_Skid : STRING[80];
		GoToSkid : BOOL;
		SelectedAlrmIndx_Temp : UINT;
		SelectedAlrmIndx : UINT;
	END_STRUCT;
	Vis_Alarms_Type : 	STRUCT 
		Active : Vis_Alarms_Active_typ;
		History : Vis_Alarms_History_typ;
	END_STRUCT;
	Vis_Alarms_Active_typ : 	STRUCT 
		UIConnect : MpAlarmXListUIConnectType;
		Reset : BOOL;
		PageDown : BOOL;
		PageUp : BOOL;
		SelectedIndex_Temp : UINT;
		SelectedIndex : UINT;
		TableConfig : STRING[255];
		TempINT : INT;
		TempSTRING : STRING[30];
		Enable : BOOL;
		Visable : BOOL;
		FilterString_HR : ARRAY[0..100]OF STRING[80];
		FilterString_LR : ARRAY[0..100]OF STRING[80];
		SelectedSkidIdx : UINT;
	END_STRUCT;
	Vis_Alarms_History_typ : 	STRUCT 
		UIConnect : MpAlarmXHistoryUIConnectType;
		State : ARRAY[0..49]OF UINT;
		Clear : BOOL;
		PageDown : BOOL;
		PageUp : BOOL;
		Export : BOOL;
		SelectedIndex : UINT;
		TableConfig : STRING[255];
		TempINT : INT;
		TempSTRING : STRING[30];
	END_STRUCT;
	Vis_Main_Internal_Type : 	STRUCT 
		IP_WSTRING_Temp : WSTRING[80];
		SkidAlarmName : STRING[80];
	END_STRUCT;
	Vis_Main_Out_Type : 	STRUCT 
		IPAddressDataProv_HR : ARRAY[0..MAX_SKIDS_HR]OF WSTRING[80];
		IPAddressDataProv_LR : ARRAY[0..MAX_SKIDS_LR]OF WSTRING[80];
		DialogOpen : BOOL;
		SkidIPAddress_LR : ARRAY[0..MAX_SKIDS_LR]OF STRING[20];
		SkidIPAddress_HR : ARRAY[0..MAX_SKIDS_HR]OF STRING[20];
	END_STRUCT;
	Vis_Main_In_Type : 	STRUCT 
		SelectedSkidSessionVar : INT;
		AckAllAlarms_Skid_HR : ARRAY[0..100]OF BOOL;
		AckAllAlarms_Skid_LR : ARRAY[0..100]OF BOOL;
	END_STRUCT;
	Vis_Main_Type : 	STRUCT 
		In : Vis_Main_In_Type;
		Internal : Vis_Main_Internal_Type;
		Out : Vis_Main_Out_Type;
	END_STRUCT;
END_TYPE

(*Bool Toggles for Hiding Visualiazation Elements*)

TYPE
	VisBool_Type : 	STRUCT 
		P204_WARN : BOOL;
		P204_ALARM : BOOL;
		P203_WARN : BOOL;
		P203_ALARM : BOOL;
		P202_WARN : BOOL;
		P202_ALARM : BOOL;
		P201_WARN : BOOL;
		P201_ALARM : BOOL;
		P102_WARN : BOOL;
		P102_ALARM : BOOL;
		P103_WARN : BOOL;
		P103_ALARM : BOOL;
		P104_WARN : BOOL;
		P104_ALARM : BOOL;
		P102_LS : BOOL;
		P103_LS : BOOL;
		LSHH200 : BOOL;
		P204_ENABLE_OPP : BOOL;
		P203_ENABLE_OPP : BOOL;
		P202_ENABLE_OPP : BOOL;
		P201_ENABLE_OPP : BOOL;
		P201_SP : BOOL;
		P202_SP : BOOL;
		P203_SP : BOOL;
		P204_SP : BOOL;
		P201_PPM : BOOL;
		P202_PPM : BOOL;
		P203_PPM : BOOL;
		P204_PPM : BOOL;
		PMAX_MANUAL : BOOL;
		P201_DDAGREEN : BOOL;
		P201_DDA : BOOL;
		P201_DMEGREEN : BOOL;
		P201_DME : BOOL;
		P201_APPM : BOOL;
		P202_APPM : BOOL;
		P203_APPM : BOOL;
		P204_APPM : BOOL;
		FI304_MODE : BOOL;
		FI303_MODE : BOOL;
		FI302_MODE : BOOL;
		FI301_MODE : BOOL;
		FI301_MODE_OPP : BOOL;
		FI302_MODE_OPP : BOOL;
		FI303_MODE_OPP : BOOL;
		FI304_MODE_OPP : BOOL;
		XV101 : BOOL;
		XV101_OPP : BOOL;
		XV102_OPP : BOOL;
		XV103_OPP : BOOL;
		XV104_OPP : BOOL;
		XV201_OPP : BOOL;
		XV202_OPP : BOOL;
		XV203_OPP : BOOL;
		XV204_OPP : BOOL;
		P201_PTYPE_OPP : BOOL;
		P101_MODE : BOOL;
		P102_MODE : BOOL;
		P103_MODE : BOOL;
		P104_MODE : BOOL;
		P201_MODE : BOOL;
		P202_MODE : BOOL;
		P203_MODE : BOOL;
		P204_MODE : BOOL;
		HR_TYPE : BOOL;
		LR_TYPE : BOOL;
		IOSTATUS : BOOL;
		CD102_TARGETHI : REAL;
		CD102_TARGETLO : REAL;
		CD101_TARGETHI : REAL;
		CD101_TARGETLO : REAL;
	END_STRUCT;
END_TYPE

(**)
(**)
(*Sensors, Flowmeters, Solenoids Variables*)

TYPE
	Sensor_Variables_Type : 	STRUCT  (*Flowmeter and Other Misc Sensor Variables*)
		SERNSORS_CONFIG : UINT; (*Datamap for sensors: DCBA >> sensor301 is type A, sensor302 is type B, sensor303 is type C, sensor304 is type D*)
		SENSOR301 : REAL; (*Sensor 301 Reading*)
		SENSOR302 : REAL; (*Sensor 302 Reading*)
		SENSOR303 : REAL; (*Sensor 303 Reading*)
		SENSOR304 : REAL; (*Sensor 304 Reading*)
		FI301 : REAL; (*Flowmeter 1 Reading*)
		FI301_QT : REAL; (*Totalized Flowmeter 1*)
		FI301_MODE : UINT; (*FI301 Mode 0 = Measure  1 = Simulation*)
		FI302 : REAL; (*Flowmeter 2 Reading*)
		FI302_QT : REAL; (*Totalized Flowmeter 2*)
		FI302_MODE : UINT; (*FI302 Mode 0 = Measure  1 = Simulation*)
		FI303 : REAL; (*Flowmeter 3 Reading*)
		FI303_QT : REAL; (*Totalized Flowmeter 3*)
		FI303_MODE : UINT; (*FI303 Mode 0 = Measure  1 = Simulation*)
		FI304 : REAL; (*Flowmeter 4 Reading*)
		FI304_QT : REAL; (*Totalized Flowmeter 4*)
		FI304_MODE : UINT; (*FI304 Mode 0 = Measure  1 = Simulation*)
		CD101 : REAL; (*Current Transducer 101*)
		CD101_SP : REAL; (*Current Transducer 101 Setpoint*)
		CD102 : REAL; (*Current Transducer 102*)
		CD102_SP : REAL; (*Current Transducer 102 Setpoint*)
		CD103 : REAL; (*Current Transducer 103*)
		CD103_SP : REAL; (*Current Transducer 103 Setpoint*)
		CD101_TI : REAL; (*Temperature After Caustic*)
		CD102_TI : REAL; (*Temperature After Hydrogen Peroxide*)
		CD103_TI : REAL; (*Temperature After Hydrogen Peroxide*)
		XV101_ENABLE : UINT; (*P101 Suction Side Solenoid Feedback Installed on Skid (0 = not installed 1 = installed)*)
		XV101 : UINT; (*P101 Suction Side Solenoid Feedback*)
		XV102 : UINT; (*P102 Off Gas Solenoid Valve*)
		XV103 : UINT; (*P103 Off Gas Solenoid Valve*)
		XV104 : UINT; (*P104 Off Gas Solenoid Valve*)
		XV201 : UINT; (*P201 Off Gas Solenoid Valve*)
		XV202 : UINT; (*P202 Off Gas Solenoid Valve*)
		XV203 : UINT; (*P203 Off Gas Solenoid Valve*)
		XV204 : UINT; (*P204 Off Gas Solenoid Valve*)
	END_STRUCT;
END_TYPE

(**)
(*Alarms*)

TYPE
	Alarms_Type : 	STRUCT  (*General Alarm Variables*)
		ALARM_AB1 : INT; (*General Alarm Block 1*)
		ALARM_AB2 : INT; (*General Alarm Block 2*)
		ALARM_AB3 : INT; (*General Alarm Block 3*)
		ALARM_AB4 : INT; (*General Alarm Block 4*)
		ALARM_AB5 : INT; (*General Alarm Block 5*)
		ALARM_AB6 : INT; (*General Alarm Block 6*)
		ALARM_AB7 : INT; (*General Alarm Block 7*)
		ALARM_AB8 : INT; (*General Alarm Block 8*)
		ALARM_AB9 : INT; (*General Alarm Block 9*)
		ALARM_AB10 : INT; (*General Alarm Block 10*)
		ALARM_AB11 : INT; (*General Alarm Block 11*)
		ALARM_AB12 : INT; (*General Alarm Block 12*)
		ALARM_AB13 : INT; (*General Alarm Block 13*)
		ALARM_AB14 : INT; (*General Alarm Block 14*)
		ALARM_AB15 : INT; (*General Alarm Block 15*)
		ALARM_AB16 : INT; (*General Alarm Block 16*)
		ALARM_AB17 : INT; (*General Alarm Block 17*)
		ALARM_AB18 : INT; (*General Alarm Block 18*)
		ALARM_AB19 : INT; (*General Alarm Block 19*)
	END_STRUCT;
END_TYPE

(**)
(*Heartbeat*)

TYPE
	Heartbeat_Type : 	STRUCT  (*Heartbeat Connection Status Components*)
		PREVIOUS_HEARTBEAT : INT; (*Last value of heartbeat from PLC*)
		MODBUS_RESET : R_TRIG; (*Timer window to detect heartbeat*)
		UNCHANGED_TIMER : TON; (*Timer window to detect heartbeat*)
		SYSTEM_OFFLINE : BOOL; (*System Online Status (1=Offline)*)
	END_STRUCT;
END_TYPE

(**)
(*Conversion/Chem Reaction Efficiencies*)

TYPE
	ConversionRatios_Type : 	STRUCT  (*Efficiency Conversion Ratio Variables*)
		EFF_1 : REAL; (*HP to PAA Conversion Efficiency *)
		EFF_2 : REAL; (*Acetyl Conversion Efficiency *)
		TRI_TO_H2O2 : REAL; (*Molar Ratio of Triacetin to HP*)
		NAOH_TO_TRI : REAL; (*Molar Ratio of NaOH to TRI*)
		NAOH_TO_H2O2 : REAL; (*Molar Ratio of NaOH to HP*)
	END_STRUCT;
END_TYPE

(**)
(*Pmax Generation General Variables*)

TYPE
	Pmax_General_Variables_Type : 	STRUCT  (*PeroxyMax General Variables*)
		PLC_REV_A : REAL; (*PLC Revision Part A*)
		PLC_REV_B : REAL; (*PLC Revision Part B*)
		HMI_REV_A : REAL; (*HMI Revision Part A*)
		HMI_REV_B : REAL; (*HMI Revision Part B*)
		SCREEN_LOCK : UINT; (*Unit HMI Lockout from SCADA, 1 = Locked   0 = Unlocked*)
		UNIT_ID : UINT; (*Pmax Skid ID*)
		PMAX_HOA : UINT; (*Pmax Generation is ON*)
		PMAX_STATUS : UINT; (*Pmax Status*)
		PMAX_CONC : REAL; (*Pmax Concentration*)
		PMAX_PV : REAL; (*Pmax Present Value*)
		PMAX_RATE : REAL; (*Pmax Rate*)
		HP_CONC_OD : REAL; (*HP Concentration On Deck*)
		HP_CONC : REAL; (*HP Concentration*)
		NAOH_CONC_OD : REAL; (*NaOh Concentration On Deck*)
		NAOH_CONC : REAL; (*NaOh Concentration*)
		USER_ID : UINT; (*Current Local User*)
		USER_ACCESS : UINT; (*Current Local User Access Level*)
		UNIT_TYPE : UINT; (*Unit Type ()*)
		UNIT_ID_DOSE : UINT;
		HEARTBEAT : INT; (*Unit Heartbeat*)
	END_STRUCT;
END_TYPE

(**)
(*Buffer Tank*)

TYPE
	BufferTank_Variables_Type : 	STRUCT  (*Buffer Tank Variables*)
		LSHH200 : REAL; (*Buffer Tank High High Sensor*)
		LI200P : REAL; (*Buffer Tank Level Percent*)
		LI200 : REAL; (*Buffer Tank Level*)
		DRAINTIME_SP : REAL; (*Tank Draintime Setpoint*)
		DRAINTIME_PV : REAL; (*Tank Draintime Present Value*)
		FILLTIME_SP : REAL; (*Tank Filltime Setpoint*)
		FILLTIME_PV : REAL; (*Tank Filltime Present Value*)
	END_STRUCT;
END_TYPE

(**)
(*PMAX Pumps*)

TYPE
	Pmax_Pump_101_Type : 	STRUCT  (*Pmax Generation Variables for Pump 101 - Water Pump*)
		P101_XS : UINT; (*Pump 101 On/Off Status*)
		P101_LS : REAL; (*Pump 101 Inlet Point Level*)
		P101_PFI : REAL; (*Pump 101 Feedback Percent*)
		P101_SP : REAL; (*Pump 101 Setpoint*)
		P101_PV : REAL; (*Pump 101 Current Value*)
		P101_OP : REAL; (*Pump 101 Output Percent*)
		P101_FQ : REAL; (*Pump 101 Totalized Flowmeter*)
		P101_TI : REAL; (*Pump 101 Temperature*)
		P101_PI : REAL; (*Pump 101 Pressure*)
	END_STRUCT;
	Pmax_Pump_101B_Type : 	STRUCT  (*Pmax Generation Variables for Pump 101 - Redundant Water Pump*)
		P101B_LS : REAL; (*Pump 101B Inlet Point Level*)
		P101B_PFI : REAL; (*Pump 101B Feedback Percent*)
		P101B_SP : REAL; (*Pump 101B Setpoint*)
		P101B_OP : REAL; (*Pump 101B Output Percent*)
	END_STRUCT;
	Pmax_Pump_102_Type : 	STRUCT  (*Pmax Generation Variables for Pump 102 - Sodium Hydroxide (Caustic) Pump*)
		P102_XS : UINT; (*Pump 102 On/Off Status*)
		P102_SP : REAL; (*Pump 102 Setpoint*)
		P102_PV : REAL; (*Pump 102 Current Value*)
		P102_OP : REAL; (*Pump 102 Output Percent*)
		P102_PFI : REAL; (*Pump 102 Feedback Percent*)
		P102_FQ : REAL; (*Pump 102 Totalized Flowmeter*)
		P102_PFQ : REAL; (*Pump 102 Totalizer*)
		P102_PPI : REAL; (*Pump 102 Internal Pressure*)
		P102_TI : REAL; (*Pump 102 Temperature*)
		P102_PI : REAL; (*Pump 102 Pressure*)
		P102_ALARM : UINT; (*Pump 102 Internal Alarm Message Index*)
		P102_WARN : UINT; (*Pump 102 Internal Warning Message Index*)
		P102_LS : REAL; (*Pump 102 Inlet Point Level*)
	END_STRUCT;
	Pmax_Pump_103_Type : 	STRUCT  (*Pmax Generation Variables for Pump 103 - Hydrogen Peroxide Pump*)
		P103_XS : UINT; (*Pump 103 On/Off Status*)
		P103_SP : REAL; (*Pump 103 Setpoint*)
		P103_PV : REAL; (*Pump 103 Current Value*)
		P103_OP : REAL; (*Pump 103 Output Percent*)
		P103_PFI : REAL; (*Pump 103 Feedback Percent*)
		P103_FQ : REAL; (*Pump 103 Totalized Flowmeter*)
		P103_PFQ : REAL; (*Pump 103 Totalizer*)
		P103_PPI : REAL; (*Pump 103 Internal Pressure*)
		P103_TI : REAL; (*Pump 103 Temperature*)
		P103_PI : REAL; (*Pump 103 Pressure*)
		P103_ALARM : UINT; (*Pump 103 Internal Alarm Message Index*)
		P103_WARN : UINT; (*Pump 103 Internal Warning Message Index*)
		P103_LS : REAL; (*Pump 103 Inlet Point Level*)
	END_STRUCT;
	Pmax_Pump_104_Type : 	STRUCT  (*Pmax Generation Variables for Pump 104 - Triacetin Pump*)
		P104_XS : UINT; (*Pump 104 On/Off Status*)
		P104_SP : REAL; (*Pump 104 Setpoint*)
		P104_PV : REAL; (*Pump 104 Current Value*)
		P104_OP : REAL; (*Pump 104  Output Percent*)
		P104_PFI : REAL; (*Pump 104  Feedback Percent*)
		P104_FQ : REAL; (*Pump 104 Totalized Flowmeter*)
		P104_PFQ : REAL; (*Pump 104 Totalizer*)
		P104_PI : REAL; (*Pump 104 Pressure*)
		P104_LS : REAL; (*Pump 104 Inlet Point Level*)
		P104_ALARM : UINT; (*Pump 104 Internal Alarm Message Index*)
		P104_WARN : UINT; (*Pump 104 Internal Warning Message Index*)
		P104_PPI : REAL; (*Pump 104 Internal Pressure*)
	END_STRUCT;
END_TYPE

(**)
(*Dosing Pumps*)

TYPE
	Dosing_Pump_201_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 201*)
		P201_PTYPE : UINT; (*Pump 201 Pump Type  0 = DDA   1 = DME*)
		P201_XS : UINT; (*Pump 201 On/Off Status*)
		P201_CHEM : UINT; (*Pump 201 Chemical*)
		P201_HOA : UINT; (*Pump 201 Mode*)
		P201_PPM : REAL; (*Pump 201 Dose*)
		P201_APPM : REAL; (*Pump 201 Adjusted Dose*)
		P201_SP : REAL; (*Pump 201 Setpoint*)
		P201_PV : REAL; (*Pump 201 Present Value*)
		P201_OP : REAL; (*Pump 201 Output %*)
		P201_PFI : REAL; (*Pump 201 Feedback %*)
		P201_FQ : REAL; (*Pump 201 Totalized Flowmeter*)
		P201_PI : REAL; (*Pump 201 Pressure*)
		P201_TI : REAL; (*Pump 201 Temperature*)
		P201_PFQ : REAL; (*Pump 201 Totalizer*)
		P201_CONC : REAL; (*Pump 201 Concentration*)
		P201_REF_SENSOR : REAL; (*Pump 201 Reference Sensor*)
		P201_LS : REAL; (*Pump 201 Inlet Point Level*)
		P201_ASP : REAL; (*Pump 201 Adjusted Setpoint Value*)
		P201_PPI : REAL; (*Pump 201 Internal Pressure*)
		P201_ADJ : UINT; (*Pump 201 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P201_ALARM : UINT; (*Pump 201 Internal Alarm Message Index*)
		P201_WARN : UINT; (*Pump 201 Internal Warning Message Index*)
		P201_ENABLE : UINT; (*Pump 202 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P201_TEXT : STRING[80]; (*Pump 201 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_202_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 202*)
		P202_XS : UINT; (*Pump 202 On/Off Status*)
		P202_HOA : UINT; (*Pump 202 Mode*)
		P202_CHEM : UINT; (*Pump 202 Chemical*)
		P202_PPM : REAL; (*Pump 202 Dose*)
		P202_APPM : REAL; (*Pump 202 Adjusted Dose*)
		P202_SP : REAL; (*Pump 202 Setpoint*)
		P202_PV : REAL; (*Pump 202 Present Value*)
		P202_OP : REAL; (*Pump 202 Output %*)
		P202_PFI : REAL; (*Pump 202 Feedback %*)
		P202_FQ : REAL; (*Pump 202 Totalized Flowmeter*)
		P202_PI : REAL; (*Pump 202 Pressure*)
		P202_TI : REAL; (*Pump 202 Temperature*)
		P202_PFQ : REAL; (*Pump 202 Totalizer*)
		P202_CONC : REAL; (*Pump 202 Concentration*)
		P202_REF_SENSOR : REAL; (*Pump 202 Reference Sensor*)
		P202_LS : REAL; (*Pump 202 Inlet Point Level*)
		P202_PPI : REAL; (*Pump 202 Internal Pressure*)
		P202_ASP : REAL; (*Pump 202 Adjusted Setpoint Value*)
		P202_ADJ : UINT; (*Pump 202 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P202_ALARM : UINT; (*Pump 202 Internal Alarm Message Index*)
		P202_WARN : UINT; (*Pump 202 Internal Warning Message Index*)
		P202_ENABLE : UINT; (*Pump 202 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P202_TEXT : STRING[80]; (*Pump 202 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_203_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 203*)
		P203_XS : UINT; (*Pump 203 On/Off Status*)
		P203_HOA : UINT; (*Pump 203 Mode*)
		P203_CHEM : UINT; (*Pump 203 Chemical*)
		P203_PPM : REAL; (*Pump 203 Dose*)
		P203_APPM : REAL; (*Pump 203 Adjusted Dose*)
		P203_SP : REAL; (*Pump 203 Setpoint*)
		P203_PV : REAL; (*Pump 203 Present Value*)
		P203_OP : REAL; (*Pump 203 Output %*)
		P203_PFI : REAL; (*Pump 203 Feedback %*)
		P203_FQ : REAL; (*Pump 203 Totalized Flowmeter*)
		P203_PI : REAL; (*Pump 203 Pressure*)
		P203_TI : REAL; (*Pump 203 Temperature*)
		P203_PFQ : REAL; (*Pump 203 Totalizer*)
		P203_CONC : REAL; (*Pump 203 Concentration*)
		P203_REF_SENSOR : REAL; (*Pump 203 Reference Sensor*)
		P203_LS : REAL; (*Pump 203 Inlet Point Level*)
		P203_PPI : REAL; (*Pump 203 Internal Pressure*)
		P203_ASP : REAL; (*Pump 203 Adjusted Setpoint Value*)
		P203_ADJ : UINT; (*Pump 203 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P203_ALARM : UINT; (*Pump 203 Internal Alarm Message Index*)
		P203_WARN : UINT; (*Pump 202 Internal Warning Message Index*)
		P203_ENABLE : UINT; (*Pump 203 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P203_TEXT : STRING[80]; (*Pump 203 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_204_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 204*)
		P204_XS : UINT; (*Pump 204 On/Off Status*)
		P204_HOA : UINT; (*Pump 204 Mode*)
		P204_CHEM : UINT; (*Pump 204 Chemical*)
		P204_PPM : REAL; (*Pump 204 Dose*)
		P204_APPM : REAL; (*Pump 204 Adjusted Dose*)
		P204_SP : REAL; (*Pump 204 Setpoint*)
		P204_PV : REAL; (*Pump 204 Present Value*)
		P204_OP : REAL; (*Pump 204 Output %*)
		P204_PFI : REAL; (*Pump 204 Feedback %*)
		P204_FQ : REAL; (*Pump 204 Totalized Flowmeter*)
		P204_PI : REAL; (*Pump 204 Pressure*)
		P204_TI : REAL; (*Pump 204 Temperature*)
		P204_PFQ : REAL; (*Pump 204 Totalizer*)
		P204_CONC : REAL; (*Pump 204 Concentration*)
		P204_REF_SENSOR : REAL; (*Pump 204 Reference Sensor*)
		P204_LS : REAL; (*Pump 204 Inlet Point Level*)
		P204_PPI : REAL; (*Pump 204 Internal Pressure*)
		P204_ASP : REAL; (*Pump 204 Adjusted Setpoint Value*)
		P204_ADJ : UINT; (*Pump 204 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P204_ALARM : UINT; (*Pump 204 Internal Alarm Message Index*)
		P204_WARN : UINT; (*Pump 204 Internal Warning Message Index*)
		P204_ENABLE : UINT; (*Pump 204 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P204_TEXT : STRING[80]; (*Pump 204 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_205_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 205*)
		P205_XS : UINT; (*Pump 205 On/Off Status*)
		P205_HOA : UINT; (*Pump 205 Mode*)
		P205_CHEM : UINT; (*Pump 205 Chemical*)
		P205_PPM : REAL; (*Pump 205 Dose*)
		P205_APPM : REAL; (*Pump 205 Adjusted Dose*)
		P205_SP : REAL; (*Pump 205 Setpoint*)
		P205_PV : REAL; (*Pump 205 Present Value*)
		P205_OP : REAL; (*Pump 205 Output %*)
		P205_PFI : REAL; (*Pump 205 Feedback %*)
		P205_FQ : REAL; (*Pump 205 Totalized Flowmeter*)
		P205_PI : REAL; (*Pump 205 Pressure*)
		P205_TI : REAL; (*Pump 205 Temperature*)
		P205_PFQ : REAL; (*Pump 205 Totalizer*)
		P205_CONC : REAL; (*Pump 205 Concentration*)
		P205_REF_SENSOR : REAL; (*Pump 205 Reference Sensor*)
		P205_LS : REAL; (*Pump 205 Inlet Point Level*)
		P205_PPI : REAL; (*Pump 205 Internal Pressure*)
		P205_ASP : REAL; (*Pump 205 Adjusted Setpoint Value*)
		P205_ADJ : UINT; (*Pump 205 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P205_ALARM : UINT; (*Pump 205 Internal Alarm Message Index*)
		P205_WARN : UINT; (*Pump 205 Internal Warning Message Index*)
		P205_ENABLE : UINT; (*Pump 205 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P205_TEXT : STRING[80]; (*Pump 205 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_206_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 206*)
		P206_XS : UINT; (*Pump 206 On/Off Status*)
		P206_HOA : UINT; (*Pump 206 Mode*)
		P206_CHEM : UINT; (*Pump 206 Chemical*)
		P206_PPM : REAL; (*Pump 206 Dose*)
		P206_APPM : REAL; (*Pump 206 Adjusted Dose*)
		P206_SP : REAL; (*Pump 206 Setpoint*)
		P206_PV : REAL; (*Pump 206 Present Value*)
		P206_OP : REAL; (*Pump 206 Output %*)
		P206_PFI : REAL; (*Pump 206 Feedback %*)
		P206_FQ : REAL; (*Pump 206 Totalized Flowmeter*)
		P206_PI : REAL; (*Pump 206 Pressure*)
		P206_TI : REAL; (*Pump 206 Temperature*)
		P206_PFQ : REAL; (*Pump 206 Totalizer*)
		P206_CONC : REAL; (*Pump 206 Concentration*)
		P206_REF_SENSOR : REAL; (*Pump 206 Reference Sensor*)
		P206_LS : REAL; (*Pump 206 Inlet Point Level*)
		P206_PPI : REAL; (*Pump 206 Internal Pressure*)
		P206_ASP : REAL; (*Pump 206 Adjusted Setpoint Value*)
		P206_ADJ : UINT; (*Pump 206 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P206_ALARM : UINT; (*Pump 206 Internal Alarm Message Index*)
		P206_WARN : UINT; (*Pump 206 Internal Warning Message Index*)
		P206_ENABLE : UINT; (*Pump 206 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P206_TEXT : STRING[80]; (*Pump 206 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_207_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 207*)
		P207_XS : UINT; (*Pump 207 On/Off Status*)
		P207_HOA : UINT; (*Pump 207 Mode*)
		P207_CHEM : UINT; (*Pump 207 Chemical*)
		P207_PPM : REAL; (*Pump 207 Dose*)
		P207_APPM : REAL; (*Pump 207 Adjusted Dose*)
		P207_SP : REAL; (*Pump 207 Setpoint*)
		P207_PV : REAL; (*Pump 207 Present Value*)
		P207_OP : REAL; (*Pump 207 Output %*)
		P207_PFI : REAL; (*Pump 207 Feedback %*)
		P207_FQ : REAL; (*Pump 207 Totalized Flowmeter*)
		P207_PI : REAL; (*Pump 207 Pressure*)
		P207_TI : REAL; (*Pump 207 Temperature*)
		P207_PFQ : REAL; (*Pump 207 Totalizer*)
		P207_CONC : REAL; (*Pump 207 Concentration*)
		P207_REF_SENSOR : REAL; (*Pump 207 Reference Sensor*)
		P207_LS : REAL; (*Pump 207 Inlet Point Level*)
		P207_PPI : REAL; (*Pump 207 Internal Pressure*)
		P207_ASP : REAL; (*Pump 203 Adjusted Setpoint Value*)
		P207_ADJ : UINT; (*Pump 207 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P207_ALARM : UINT; (*Pump 207 Internal Alarm Message Index*)
		P207_WARN : UINT; (*Pump 207 Internal Warning Message Index*)
		P207_ENABLE : UINT; (*Pump 207 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P207_TEXT : STRING[80]; (*Pump 207 HMI Text Input Description*)
	END_STRUCT;
	Dosing_Pump_208_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 208*)
		P208_XS : UINT; (*Pump 208 On/Off Status*)
		P208_HOA : UINT; (*Pump 208 Mode*)
		P208_CHEM : UINT; (*Pump 208 Chemical*)
		P208_PPM : REAL; (*Pump 208 Dose*)
		P208_APPM : REAL; (*Pump 208 Adjusted Dose*)
		P208_SP : REAL; (*Pump 208 Setpoint*)
		P208_PV : REAL; (*Pump 208 Present Value*)
		P208_OP : REAL; (*Pump 208 Output %*)
		P208_PFI : REAL; (*Pump 208 Feedback %*)
		P208_FQ : REAL; (*Pump 208 Totalized Flowmeter*)
		P208_PI : REAL; (*Pump 208 Pressure*)
		P208_TI : REAL; (*Pump 208 Temperature*)
		P208_PFQ : REAL; (*Pump 208 Totalizer*)
		P208_CONC : REAL; (*Pump 208 Concentration*)
		P208_REF_SENSOR : REAL; (*Pump 208 Reference Sensor*)
		P208_LS : REAL; (*Pump 208 Inlet Point Level*)
		P208_PPI : REAL; (*Pump 208 Internal Pressure*)
		P208_ASP : REAL; (*Pump 208 Adjusted Setpoint Value*)
		P208_ADJ : UINT; (*Pump 208 Adjusted Max SP Condition Present  0 = Hidden   1 = Visible*)
		P208_ALARM : UINT; (*Pump 208 Internal Alarm Message Index*)
		P208_WARN : UINT; (*Pump 208 Internal Warning Message Index*)
		P208_ENABLE : UINT; (*Pump 208 Visualization Enable Bit 0 = Visible  1 = Hidden*)
		P208_TEXT : STRING[80]; (*Pump 208 HMI Text Input Description*)
	END_STRUCT;
END_TYPE

(**)
(*System Information for swapping in between different modes and functionalities*)

TYPE
	Sys_Mode_Information : 	STRUCT 
		Sys_Mode : UINT; (*Mode for Visability/Changability of Variables*)
	END_STRUCT;
	ModbusDriver_Type : 	STRUCT 
		BlockRecieved : BOOL;
		BlockSend : BOOL;
	END_STRUCT;
END_TYPE
