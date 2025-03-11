(*Global Structrues*)

TYPE
	Modbus_Type : 	STRUCT 
		Modbus_Dosing : Modbus_7000_Type;
		Modbus_PeroxyMAX : Modbus_6000_Type;
	END_STRUCT;
	Skid_type : 	STRUCT 
		Pmax_Pump_101 : Pmax_Pump_101_Type;
		Pmax_Pump_103 : Pmax_Pump_103_Type;
		Pmax_Pump_104 : Pmax_Pump_104_Type;
		Pmax_Pump_102 : Pmax_Pump_102_Type;
		BufferTank : BufferTank_Variables_Type;
		ConversionRatios : ConversionRatios_Type;
		Sensor_Variables : Sensor_Variables_Type;
		Pmax_General_Variables : Pmax_General_Variables_Type;
		Dosing_Pump_203 : Dosing_Pump_203_Type;
		Dosing_Pump_202 : Dosing_Pump_202_Type;
		Dosing_Pump_201 : Dosing_Pump_201_Type;
	END_STRUCT;
END_TYPE

(**)
(*Visualization Components*)

TYPE
	Vis_Type : 	STRUCT 
		Pumps : USINT;
		Main : Vis_Main_Type;
		Global : USINT;
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
	CMD_Write_P101_XS_Type : 	STRUCT 
		Send : BOOL;
		wP101_XS : UINT;
	END_STRUCT;
	CMD_Write_P101_SP_Type : 	STRUCT 
		Send : BOOL;
		wP101_SP : REAL;
		wP101_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P102 Write Commands*)

TYPE
	CMD_Write_P102_XS_Type : 	STRUCT 
		Send : BOOL;
		wP102_XS : UINT;
	END_STRUCT;
	CMD_Write_P102_SP_Type : 	STRUCT 
		Send : BOOL;
		wP102_SP : REAL;
		wP102_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P103 Write Commands*)

TYPE
	CMD_Write_P103_XS_Type : 	STRUCT 
		Send : BOOL;
		wP103_XS : UINT;
	END_STRUCT;
	CMD_Write_P103_SP_Type : 	STRUCT 
		Send : BOOL;
		wP103_SP : REAL;
		wP103_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P104 Write Commands*)

TYPE
	CMD_Write_P104_XS_Type : 	STRUCT 
		Send : BOOL;
		wP104_XS : UINT;
	END_STRUCT;
	CMD_Write_P104_SP_Type : 	STRUCT 
		Send : BOOL;
		wP104_SP : REAL;
		wP104_SP_SWAPPED : REAL;
	END_STRUCT;
END_TYPE

(*P201 Write Commands*)

TYPE
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
	CMD_Write_P201_XS_Type : 	STRUCT 
		Send : BOOL;
		wP201_XS : UINT;
	END_STRUCT;
	CMD_Write_P201_HOA_Type : 	STRUCT 
		Send : BOOL;
		wP201_HOA : UINT;
	END_STRUCT;
END_TYPE

(*P202 Write Commands*)

TYPE
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
	CMD_Write_P202_XS_Type : 	STRUCT 
		Send : BOOL;
		wP202_XS : UINT;
	END_STRUCT;
	CMD_Write_P202_HOA_Type : 	STRUCT 
		Send : BOOL;
		wP202_HOA : UINT;
	END_STRUCT;
END_TYPE

(*P203 Write Commands*)

TYPE
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
	CMD_Write_P203_XS_Type : 	STRUCT 
		Send : BOOL;
		wP203_XS : UINT;
	END_STRUCT;
	CMD_Write_P203_HOA_Type : 	STRUCT 
		Send : BOOL;
		wP203_HOA : UINT;
	END_STRUCT;
END_TYPE

(*UID Write Command*)

TYPE
	CMD_Write_UNIT_ID_Type : 	STRUCT 
		Send : BOOL;
		wUNIT_ID : UINT;
	END_STRUCT;
END_TYPE

(*Write Command *)

TYPE
	CMD_Type : 	STRUCT 
		Stop : BOOL;
		Start : BOOL;
		Write_UNIT_ID : CMD_Write_UNIT_ID_Type;
		Write_P203_XS : CMD_Write_P203_XS_Type;
		Write_P203_HOA : CMD_Write_P203_HOA_Type;
		Write_P203_PPM : CMD_Write_P203_PPM_Type;
		Write_P203_SP : CMD_Write_P203_SP_Type;
		Write_P202_XS : CMD_Write_P202_XS_Type;
		Write_P202_HOA : CMD_Write_P202_HOA_Type;
		Write_P202_PPM : CMD_Write_P202_PPM_Type;
		Write_P202_SP : CMD_Write_P202_SP_Type;
		Write_P104_XS : CMD_Write_P104_XS_Type;
		Write_P104_SP : CMD_Write_P104_SP_Type;
		Write_P103_XS : CMD_Write_P103_XS_Type;
		Write_P103_SP : CMD_Write_P103_SP_Type;
		Write_P102_XS : CMD_Write_P102_XS_Type;
		Write_P102_SP : CMD_Write_P102_SP_Type;
		Write_P101_XS : CMD_Write_P101_XS_Type;
		Write_P101_SP : CMD_Write_P101_SP_Type;
		Write_P201_XS : CMD_Write_P201_XS_Type;
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

(**)

TYPE
	Vis_Main_In_Type : 	STRUCT 
		TestButton : ARRAY[0..5]OF BOOL;
	END_STRUCT;
	Vis_Main_Type : 	STRUCT 
		In : Vis_Main_In_Type;
		Internal : USINT;
		Out : USINT;
	END_STRUCT;
END_TYPE

(**)
(*Raw Modbus IO*)

TYPE
	Modbus_6000_Type : 	STRUCT 
		Block3_Int : ARRAY[0..124]OF INT;
		Block4_Real : ARRAY[0..62]OF REAL;
	END_STRUCT;
	Modbus_7000_Type : 	STRUCT 
		Block1_Int : ARRAY[0..124]OF INT;
		Block2_Real : ARRAY[0..62]OF REAL;
	END_STRUCT;
END_TYPE

(**)
(*Sensors and Flowmeters Variables*)

TYPE
	Sensor_Variables_Type : 	STRUCT  (*Flowmeter and Other Misc Sensor Variables*)
		FI301 : REAL; (*Flowmeter 1 Reading*)
		FI302 : REAL; (*Flowmeter 2 Reading*)
		FI303 : REAL; (*Flowmeter 3 Reading*)
		CD101 : REAL; (*Current Transducer 101*)
		CD101_SP : REAL; (*Current Transducer 101 Setpoint*)
		CD102 : REAL; (*Current Transducer 102*)
		CD102_SP : REAL; (*Current Transducer 102 Setpoint*)
		CD101_TI : REAL; (*Temperature After Caustic*)
		CD102_TI : REAL; (*Temperature After Hydrogen Peroxide*)
	END_STRUCT;
END_TYPE

(**)
(*PeroxyMax Generation Alarms*)

TYPE
	Pmax_Alarms : 	STRUCT  (*PeroxyMax Gen alarm Variables*)
		pmax_alarm : UINT; (*General Pmax Generation Side Alarm*)
		p101_alarm : UINT; (*Pump 101 Alarms*)
		p101b_alarm : UINT; (*Pump 101b Alarms*)
		p102_alarm : UINT; (*Pump 102 Alarms*)
		p103_alarm : UINT; (*Pump 103 Alarms*)
		p104_alarm : UINT; (*Pump 104 Alarms*)
	END_STRUCT;
	Dosing_Alarms : 	STRUCT  (*Dosing Pump Alarm Variables*)
		alarm : UINT;
		p201_alarm : UINT;
		p202_alarm : UINT;
		p203_alarm : UINT;
		p204_alarm : UINT;
		p205_alarm : UINT;
		p207_alarm : UINT;
		p206_alarm : UINT;
		p208_alarm : UINT;
	END_STRUCT;
END_TYPE

(**)
(*Conversion/Chem Reaction Efficiencies*)

TYPE
	ConversionRatios_Type : 	STRUCT  (*Efficiency Conversion Ratio Variables*)
		EFF_1 : REAL; (*HP to PAA Conversion Efficiency *)
		EFF_2 : REAL; (*Acetyl Conversion Efficiency *)
		TRI_TO_H2O2 : REAL; (*Molar Ratio of Triacetin to HP*)
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
		PMAX_RATE : REAL; (*Pmax Rate*)
		HP_CONC : REAL; (*HP Concentration*)
		NAOH_CONC : REAL; (*NaOh Concentration*)
		USER_ID : UINT; (*Current User*)
		USER_ACCESS : UINT; (*Current User Access Level*)
	END_STRUCT;
END_TYPE

(**)
(*Buffer Tank*)

TYPE
	BufferTank_Variables_Type : 	STRUCT  (*Buffer Tank Variables*)
		LSHH200 : REAL; (*Buffer Tank High High Sensor*)
		LI200 : REAL; (*Buffer Tank Level*)
	END_STRUCT;
END_TYPE

(**)
(*PMAX Pumps*)

TYPE
	Pmax_Pump_101_Type : 	STRUCT  (*Pmax Generation Variables for Pump 101 - Water Pump*)
		P101_XS : UINT; (*Pump 101 On/Off Status*)
		P101_SP : REAL; (*Pump 101 Setpoint*)
		P101_PV : REAL; (*Pump 101 Current Value*)
		P101_OP : REAL; (*Pump 101 Output Percent*)
		P101_FQ : REAL; (*Pump 101 Totalized Flowmeter*)
		P101_TI : REAL; (*Pump 101 Temperature*)
		P101_PI : REAL; (*Pump 101 Pressure*)
	END_STRUCT;
	Pmax_Pump_102_Type : 	STRUCT  (*Pmax Generation Variables for Pump 102 - Sodium Hydroxide (Caustic) Pump*)
		P102_XS : UINT; (*Pump 102 On/Off Status*)
		P102_SP : REAL; (*Pump 102 Setpoint*)
		P102_OP : REAL; (*Pump 102 Output Percent*)
		P102_PFI : REAL; (*Pump 102 Feedback Percent*)
		P102_PFQ : REAL; (*Pump 102 Totalizer*)
		P102_PPI : REAL; (*Pump 102 Internal Pressure*)
		P102_LS : REAL; (*Pump 102 Inlet Point Level*)
	END_STRUCT;
	Pmax_Pump_103_Type : 	STRUCT  (*Pmax Generation Variables for Pump 103 - Hydrogen Peroxide Pump*)
		P103_XS : UINT; (*Pump 103 On/Off Status*)
		P103_SP : REAL; (*Pump 103 Setpoint*)
		P103_OP : REAL; (*Pump 103 Output Percent*)
		P103_PFI : REAL; (*Pump 103 Feedback Percent*)
		P103_PFQ : REAL; (*Pump 103 Totalizer*)
		P103_PPI : REAL; (*Pump 103 Internal Pressure*)
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
		P104_PPI : REAL; (*Pump 104 Internal Pressure*)
	END_STRUCT;
END_TYPE

(**)
(*Dosing Pumps*)

TYPE
	Dosing_Pump_201_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 201*)
		P201_XS : UINT; (*Pump 201 On/Off Status*)
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
		P201_PPI : REAL; (*Pump 201 Internal Pressure*)
	END_STRUCT;
	Dosing_Pump_202_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 202*)
		P202_XS : UINT; (*Pump 202 On/Off Status*)
		P202_HOA : UINT; (*Pump 202 Mode*)
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
		P202_PPI : REAL; (*Pump 202 Internal Pressure*)
	END_STRUCT;
	Dosing_Pump_203_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 203*)
		P203_XS : UINT; (*Pump 203 On/Off Status*)
		P203_HOA : UINT; (*Pump 203 Mode*)
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
		P203_PPI : REAL; (*Pump 203 Internal Pressure*)
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
