
TYPE
	IO_type : 	STRUCT 
		Modbus : Modbus_type;
		Pump1Information : Pump1_Type;
		BufferTank : BufferTank_Type;
		DosingPump : DosingPump_Type;
		CD : CD_Type;
		Pump2Information : Pump2_Typ;
	END_STRUCT;
	Modbus_type : 	STRUCT 
		pmax_rate : REAL;
		pmax_conc : REAL;
		msgbox : UINT;
		start_stop : BOOL;
		skid_id : UINT;
		SkidIDWrite : UINT;
		SkidIDAck : BOOL;
		SkidIDSend : BOOL;
	END_STRUCT;
	Pump2_Type : 	STRUCT 
		Pump2_OnOff : BOOL;
		Pump2_OnOff_Write : BOOL;
		Pump2_OnOff_Ack : BOOL;
		Pump2_OnOff_Send : BOOL;
		Pump2_AutoMan : BOOL;
		Pump2_AutoMan_Write : BOOL;
		Pump2_AutoMan_Ack : BOOL;
		Pump2_AutoMan_Send : BOOL;
		Pump2_Speed_Write : UINT;
		Pump2_Speed : UINT;
		Pump2_Speed_Ack : BOOL;
		Pump2_Speed_Send : BOOL;
		Pump2_PSI : UINT;
		Pump2_LPM : UINT;
	END_STRUCT;
	Pump1_Type : 	STRUCT 
		Pump1_OnOff : BOOL;
		Pump1_OnOff_Write : BOOL;
		Pump1_OnOff_Ack : BOOL;
		Pump1_OnOff_Send : BOOL;
		Pump1_AutoMan : BOOL;
		Pump1_AutoMan_Write : BOOL;
		Pump1_AutoMan_Ack : BOOL;
		Pump1_AutoMan_Send : BOOL;
		Pump1_Speed_Write : UINT;
		Pump1_Speed : UINT;
		Pump1_Speed_Ack : BOOL;
		Pump1_Speed_Send : BOOL;
		Pump1_PSI : UINT;
		Pump1_LPM : UINT;
	END_STRUCT;
	BufferTank_Type : 	STRUCT 
		BufferTankLvl : UINT;
	END_STRUCT;
	DosingPump_Type : 	STRUCT 
		Dosing_SetPT : UINT;
		Dosing_SetPT_Write : UINT;
		Dosing_SetPT_Ack : BOOL;
		Dosing_SetPT_Send : BOOL;
		Dosing_Total : UINT;
		Dosing_LPM : UINT;
		Dosing_PSI : UINT;
	END_STRUCT;
	CD_Type : 	STRUCT 
		CD_Cond : UINT;
		CD_Temp : UINT;
	END_STRUCT;
END_TYPE
