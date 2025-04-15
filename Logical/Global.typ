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
		Block1_Int : ARRAY[0..25]OF INT;
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
		initAlarms : HA_AlarmX_CfgModule;
		ErrorInfo : Skid_ErrorInfo_typ;
		LastErrorInfo : Skid_ErrorInfo_typ;
		tempAlarm : HA_AlarmX_Core_Buffer_typ;
		Error : BOOL;
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
(*Retain Machine State After Power Cycle*)

TYPE
	Par_Type : 	STRUCT 
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
		Write_UNIT_ID : CMD_Write_UNIT_ID_Type;
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
	END_STRUCT;
END_TYPE

(*Misc. Write Commands*)

TYPE
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

(*UID Write Command*)

TYPE
	CMD_Write_UNIT_ID_Type : 	STRUCT 
		Send : BOOL;
		wUNIT_ID : UINT;
	END_STRUCT;
END_TYPE

(**)

TYPE
	Vis_Global : 	STRUCT 
		ClientInfo : Vis_Global_ClientInfo;
	END_STRUCT;
	Vis_Global_ClientInfo : 	STRUCT 
		SelectedSkidIdx : ARRAY[0..MAX_CLIENTS]OF USINT;
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
		SelectedIndex : UINT;
		TableConfig : STRING[255];
		TempINT : INT;
		TempSTRING : STRING[30];
		FilterString : ARRAY[0..MAX_SKIDS]OF STRING[80];
		Test : STRING[200];
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
	END_STRUCT;
	Vis_Main_Out_Type : 	STRUCT 
		IPAddressDataProv : ARRAY[0..MAX_SKIDS]OF WSTRING[80];
		DialogOpen : BOOL;
		SkidIPAddress : ARRAY[0..MAX_SKIDS]OF STRING[20];
	END_STRUCT;
	Vis_Main_In_Type : 	STRUCT 
		SelectedSkidSessionVar : INT;
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
		P102_LS : BOOL;
		P103_LS : BOOL;
		LSHH200 : BOOL;
		P202_ENABLE_OPP : BOOL;
		P201_ENABLE_OPP : BOOL;
		P201_SP : BOOL;
		P202_SP : BOOL;
		P203_SP : BOOL;
		P201_PPM : BOOL;
		P202_PPM : BOOL;
		P203_PPM : BOOL;
		PMAX_MANUAL : BOOL;
		P201_DDAGREEN : BOOL;
		P201_DDA : BOOL;
		P201_DMEGREEN : BOOL;
		P201_DME : BOOL;
	END_STRUCT;
END_TYPE

(**)
(**)
(*Sensors and Flowmeters Variables*)

TYPE
	Sensor_Variables_Type : 	STRUCT  (*Flowmeter and Other Misc Sensor Variables*)
		SERNSORS_CONFIG : UINT; (*Datamap for sensors: DCBA >> sensor301 is type A, sensor302 is type B, sensor303 is type C, sensor304 is type D*)
		SENSOR301 : REAL; (*Sensor 301 Reading*)
		SENSOR302 : REAL; (*Sensor 302 Reading*)
		SENSOR303 : REAL; (*Sensor 303 Reading*)
		SENSOR304 : REAL; (*Sensor 304 Reading*)
		FI301 : REAL; (*Flowmeter 1 Reading*)
		FI301_QT : REAL; (*Totalized Flowmeter 1*)
		FI302 : REAL; (*Flowmeter 2 Reading*)
		FI302_QT : REAL; (*Totalized Flowmeter 2*)
		FI303 : REAL; (*Flowmeter 3 Reading*)
		FI303_QT : REAL; (*Totalized Flowmeter 3*)
		FI304 : REAL; (*Flowmeter 4 Reading*)
		FI304_QT : REAL; (*Totalized Flowmeter 4*)
		CD101 : REAL; (*Current Transducer 101*)
		CD101_SP : REAL; (*Current Transducer 101 Setpoint*)
		CD102 : REAL; (*Current Transducer 102*)
		CD102_SP : REAL; (*Current Transducer 102 Setpoint*)
		CD103 : REAL; (*Current Transducer 103*)
		CD103_SP : REAL; (*Current Transducer 103 Setpoint*)
		CD101_TI : REAL; (*Temperature After Caustic*)
		CD102_TI : REAL; (*Temperature After Hydrogen Peroxide*)
		CD103_TI : REAL; (*Temperature After Hydrogen Peroxide*)
	END_STRUCT;
END_TYPE

(**)
(*Alarms*)

TYPE
	Alarms_Type : 	STRUCT  (*PeroxyMax Gen alarm Variables*)
		ALARM_AB1 : INT; (*General Alarm Block 1*)
		ALARM_AB2 : INT; (*General Alarm Block 2*)
		ALARM_AB3 : INT; (*General Alarm Block 3*)
		ALARM_AB4 : INT; (*General Alarm Block 4*)
		ALARM_AB5 : INT; (*General Alarm Block 5*)
		ALARM_AB6 : INT; (*General Alarm Block 6*)
		ALARM_AB7 : INT; (*General Alarm Block 7*)
		ALARM_AB8 : INT; (*General Alarm Block 8*)
		ALARM_P102 : INT; (*Pump 102 Alarms*)
		ALARM_P103 : INT; (*Pump 103 Alarms*)
		ALARM_P104 : INT; (*Pump 104 Alarms*)
		ALARM_P201 : INT; (*Pump 201 Alarms*)
		ALARM_P202 : INT; (*Pump 202 Alarms*)
		ALARM_P203 : INT; (*Pump 203 Alarms*)
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
		USER_ID : UINT; (*Current User*)
		USER_ACCESS : UINT; (*Current User Access Level*)
		UNIT_ID_DOSE : UINT;
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
		P104_PPI : REAL; (*Pump 104 Internal Pressure*)
	END_STRUCT;
END_TYPE

(**)
(*Dosing Pumps*)

TYPE
	Dosing_Pump_201_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 201*)
		P201_PTYPE : UINT; (*Pump 201 Pump Type*)
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
		P201_PPI : REAL; (*Pump 201 Internal Pressure*)
		P201_ENABLE : BOOL; (*Pump 201 Visualization Enable Bit*)
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
		P202_ENABLE : BOOL; (*Pump 202 Visualization Enable Bit*)
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
		P203_ENABLE : BOOL; (*Pump 203 Visualization Enable Bit*)
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
