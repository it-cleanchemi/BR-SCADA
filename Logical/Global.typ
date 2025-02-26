(*Global Structrues*)

TYPE
	Pump_Data_Real : 	STRUCT 
	END_STRUCT;
	Modbus_Type : 	STRUCT 
		Pump_Data_201 : Modbus_Pump_Type;
		Pump_Data_202 : Modbus_Pump_Type;
		Pump_Data_203 : Modbus_Pump_Type;
		Pump_Data_101 : Modbus_Pump_Type;
		Pump_Data_102 : Modbus_Pump_Type;
		Pump_Data_103 : Modbus_Pump_Type;
		Pump_Data_104 : Modbus_Pump_Type;
		Modbus_SkidMisc : Modbus_SkidMisc_Type;
	END_STRUCT;
	Skid_type : 	STRUCT 
		Pmax_Pumps : Pmax_Pumps_Type;
		Pmax_Pump_101 : Pmax_Pump_101_Type;
		Pmax_Pump_101b : Pmax_Pump_101b_Type;
		Pmax_Pump_103 : Pmax_Pump_103_Type;
		Pmax_Pump_104 : Pmax_Pump_104_Type;
		Pmax_Pump_102 : Pmax_Pump_102_Type;
		BufferTank : BufferTank_Variables_Type;
		GeneralDosingVariables : Dosing_General_Variables_Type;
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
		Main : Vis_Main_type;
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
(*Insert your comment here.*)

TYPE
	CMD_Type : 	STRUCT 
		Stop : BOOL;
		Start : BOOL;
	END_STRUCT;
END_TYPE

(**)

TYPE
	Vis_Main_In_Type : 	STRUCT 
		TestButton : BOOL;
	END_STRUCT;
	Vis_Main_Type : 	STRUCT 
		In : Vis_Main_In_type;
		Internal : USINT;
		Out : USINT;
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
(*Raw Modbus IO*)

TYPE
	Modbus_Pump_Type : 	STRUCT 
		Block_Int : ARRAY[0..7]OF INT;
		Block_Real : ARRAY[0..13]OF REAL;
	END_STRUCT;
	Modbus_SkidMisc_Type : 	STRUCT 
		Block_Int : ARRAY[0..10]OF INT;
		Block_Real : ARRAY[0..30]OF REAL;
	END_STRUCT;
END_TYPE

(**)
(*Dosing Side General Variables   ---   Delete??*)

TYPE
	Dosing_General_Variables_type : 	STRUCT  (*Dosing Pump Variables*)
		skid_id_dose : UINT;
		time_stamp : UINT;
		Pump_201 : Dosing_Pump_201_type;
		Pump_202 : Dosing_Pump_202_type;
		Pump_203 : Dosing_Pump_203_type;
		Pump_204 : Dosing_Pump_204_type;
		Pump_205 : Dosing_Pump_205_type;
		Pump_206 : Dosing_Pump_206_type;
		Pump_207 : Dosing_Pump_207_type;
		Pump_208 : Dosing_Pump_208_type;
	END_STRUCT;
END_TYPE

(**)
(*Sensors and Flowmeters Variables*)

TYPE
	Sensor_Variables_Type : 	STRUCT  (*Flowmeter and Other Misc Sensor Variables*)
		flowmeter301 : REAL; (*Flowmeter 1 Reading*)
		flowmeter302 : REAL; (*Flowmeter 2 Reading*)
		flowmeter303 : REAL; (*Flowmeter 1 Reading*)
		cd101 : REAL; (*Current Transducer 101*)
		cd101_target_Send : BOOL; (*Current Transducer 101 Send Bit*)
		cd101_target_Write : REAL; (*Current Transducer 101 Write Variable*)
		cd101_target_Ack : BOOL; (*Current Transducer 101 Ack Bit*)
		cd101_target : REAL; (*Current Transducer 101 Setpoint*)
		cd102 : REAL; (*Current Transducer 102*)
		cd102_target : REAL; (*Current Transducer 102 Setpoint*)
		ti101 : REAL; (*Temperature After Caustic*)
		ti102 : REAL; (*Temperature After Hydrogen Peroxide*)
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
END_TYPE

(**)
(*Conversion/Chem Reaction Efficiencies*)

TYPE
	ConversionRatios_Type : 	STRUCT  (*Efficiency Conversion Ratio Variables*)
		e_1 : REAL; (*HP to PAA Conversion Efficiency *)
		e_2 : REAL; (*Acetyl Conversion Efficiency *)
		tri_to_h202 : REAL; (*Molar Ratio of Triacetin to HP*)
		naoh_to_h202 : REAL; (*Molar Ratio of NaOH to HP*)
	END_STRUCT;
END_TYPE

(**)
(*Pmax Generation General Variables*)

TYPE
	Pmax_General_Variables_Type : 	STRUCT  (*PeroxyMax General Variables*)
		time_stamp : UINT; (*Pmax Time Stamp*)
		skid_id : UINT; (*Pmax Skid ID*)
		is_on : UINT; (*Pmax Generation is ON*)
		status : UINT; (*Pmax Status*)
		pmax_conc : REAL; (*Pmax Concentration*)
		pmax_rate : REAL; (*Pmax Rate*)
		hp_conc : REAL; (*HP Concentration*)
		naoh_conc : REAL; (*NaOh Concentration*)
	END_STRUCT;
END_TYPE

(**)
(*Buffer Tank*)

TYPE
	BufferTank_Variables_Type : 	STRUCT  (*Buffer Tank Variables*)
		filltime_sp : REAL; (*Filltime Setpoint*)
		filltime_pv : REAL; (*Filltime Current Value*)
		draintime_sp : REAL; (*Draintime Setpoint*)
		draintime_pv : REAL; (*Draintime Current Value*)
		bt_hihi : REAL; (*Buffer Tank High High Sensor*)
		bt_level : REAL; (*Buffer Tank Level*)
		bt_time : REAL; (*Buffer Tank Time for Graphs*)
	END_STRUCT;
END_TYPE

(**)
(*PMAX Pumps*)

TYPE
	Pmax_Pump_101_Type : 	STRUCT  (*Pmax Generation Variables for Pump 101 - Water Pump*)
		p101_is_on : UINT; (*Pump 101 On/Off Status*)
		p101_sp : REAL; (*Pump 101 Setpoint*)
		p101_sp_Write : REAL; (*Pump 101 Write to Setpoint*)
		p101_sp_Ack : BOOL; (*Pump 101 Ack for Setpoint*)
		p101_sp_Send : BOOL; (*Pump 101 Send for Setpoint*)
		p101_pv : REAL; (*Pump 101 Current Value*)
		p101_pi : REAL; (*Pump 101 Pressure*)
		p101_ti : REAL; (*Pump 101 Temperature*)
		p101_fm_tot : REAL; (*Pump 101 Flowmeter Totatilizer*)
		p101_g_tm : UINT; (*Pump 101 Graph Time Setpoint*)
	END_STRUCT;
	Pmax_Pump_102_Type : 	STRUCT  (*Pmax Generation Variables for Pump 102 - Sodium Hydroxide (Caustic) Pump*)
		p102_is_on : UINT; (*Pump 102 On/Off Status*)
		p102_sp : REAL; (*Pump 102 Setpoint*)
		p102_sp_Write : REAL; (*Pump 102 Write to Setpoint*)
		p102_sp_Ack : BOOL; (*Pump 102 Ack for Setpoint*)
		p102_sp_Send : BOOL; (*Pump 102 Send for Setpoint*)
		p102_pfq : REAL; (*Pump 102 Totalizer*)
		p102_ppi : REAL; (*Pump 102 Internal Pressure*)
		p102_fb : REAL; (*Pump 102 Feedback percentage*)
		p102_ls : REAL; (*Pump 102 Inlet Point Level*)
		p102_g_tm : UINT; (*Pump 102 Graph Time*)
	END_STRUCT;
	Pmax_Pump_103_Type : 	STRUCT  (*Pmax Generation Variables for Pump 103 - Hydrogen Peroxide Pump*)
		p103_is_on : UINT; (*Pump 103 On/Off Status*)
		p103_sp : REAL; (*Pump 103 Setpoint*)
		p103_sp_Write : REAL; (*Pump 103 Write to Setpoint*)
		p103_sp_Ack : BOOL; (*Pump 103 Ack for Setpoint*)
		p103_sp_Send : BOOL; (*Pump 103 Send for Setpoint*)
		p103_pfq : REAL; (*Pump 103 Totalizer*)
		p103_ppi : REAL; (*Pump 103 Internal Pressure*)
		p103_fb : REAL; (*Pump 103 Feedback percentage*)
		p103_ls : REAL; (*Pump 103 Inlet Point Level*)
		p103_g_tm : UINT; (*Pump 103 Graph Time*)
	END_STRUCT;
	Pmax_Pump_104_Type : 	STRUCT  (*Pmax Generation Variables for Pump 104 - Triacetin Pump*)
		p104_is_on : UINT; (*Pump 104 On/Off Status*)
		p104_sp : REAL; (*Pump 104 Setpoint*)
		p104_sp_Write : REAL; (*Pump 104 Write to Setpoint*)
		p104_sp_Ack : BOOL; (*Pump 104 Ack for Setpoint*)
		p104_sp_Send : BOOL; (*Pump 104 Send for Setpoint*)
		p104_pv : REAL; (*Pump 104 Current Value*)
		p104_ppi : REAL; (*Pump 104  Internal Pressure*)
		p104_pfq : REAL; (*Pump 104  Totalizer*)
		p104_fb : REAL; (*Pump 104 Feedback percentage*)
		p104_g_tm : REAL; (*Pump 104 Graph Time *)
		p104_fm_tot : REAL; (*Pump 104 Flowmeter Totatilizer*)
	END_STRUCT;
END_TYPE

(**)
(*Dosing Pumps*)

TYPE
	Dosing_Pump_201_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 201*)
		p201_is_on : UINT; (*Pump 201 On/Off Status*)
		p201_sp_Write : REAL; (*Pump 201 Write to Setpoint*)
		p201_sp_Ack : BOOL; (*Pump 201 Ack for Setpoint*)
		p201_sp_Send : BOOL; (*Pump 201 Send for Setpoint*)
		p201_ref_fm : UINT; (*Pump 201 Reference Flowmeter*)
		p201_ti : REAL; (*Pump 201 Temperature*)
		p201_ppm : REAL; (*Pump 201 Dose*)
		p201_appm : REAL; (*Pump 201 Adjusted Dose*)
		p201_sp : REAL; (*Pump 201 Setpoint*)
		p201_pv : REAL; (*Pump 201 Present Value*)
		p201_op : REAL; (*Pump 201 Output %*)
		p201_fb : REAL; (*Pump 201 Feedback %*)
		p201_fm_tot : REAL; (*Pump 201 Totalized Flowmeter*)
		p201_pi : REAL; (*Pump 201 Pressure*)
		p201_ppi : REAL; (*Pump 201 Internal Pressure*)
		p201_pfq : REAL; (*Pump 201 Totalizer*)
	END_STRUCT;
	Dosing_Pump_202_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 202*)
		p202_is_on : UINT; (*Pump 202 On/Off Status*)
		p202_sp_Write : REAL; (*Pump 202 Write to Setpoint*)
		p202_sp_Ack : BOOL; (*Pump 202 Ack for Setpoint*)
		p202_sp_Send : BOOL; (*Pump 202 Send for Setpoint*)
		p202_ref_fm : UINT; (*Pump 202 Reference Flowmeter*)
		p202_ti : REAL; (*Pump 202 Temperature*)
		p202_ppm : REAL; (*Pump 202 Dose*)
		p202_appm : REAL; (*Pump 202 Adjusted Dose*)
		p202_sp : REAL; (*Pump 202 Setpoint*)
		p202_pv : REAL; (*Pump 202 Present Value*)
		p202_op : REAL; (*Pump 202 Output %*)
		p202_fb : REAL; (*Pump 202 Feedback %*)
		p202_fm_tot : REAL; (*Pump 202 Totalized Flowmeter*)
		p202_pi : REAL; (*Pump 202 Pressure*)
		p202_ppi : REAL; (*Pump 202 Internal Pressure*)
		p202_pfq : REAL; (*Pump 202 Totalizer*)
	END_STRUCT;
	Dosing_Pump_203_Type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 203*)
		p203_is_on : UINT; (*Pump 203 On/Off Status*)
		p203_sp_Write : REAL; (*Pump 203 Write to Setpoint*)
		p203_sp_Ack : BOOL; (*Pump 203 Ack for Setpoint*)
		p203_sp_Send : BOOL; (*Pump 203 Send for Setpoint*)
		p203_ref_fm : UINT; (*Pump 203 Reference Flowmeter*)
		p203_ti : REAL; (*Pump 203 Temperature*)
		p203_ppm : REAL; (*Pump 203 Dose*)
		p203_appm : REAL; (*Pump 203 Adjusted Dose*)
		p203_sp : REAL; (*Pump 203 Setpoint*)
		p203_pv : REAL; (*Pump 203 Present Value*)
		p203_op : REAL; (*Pump 203 Output %*)
		p203_fb : REAL; (*Pump 203 Feedback %*)
		p203_fm_tot : REAL; (*Pump 203 Totalized Flowmeter*)
		p203_pi : REAL; (*Pump 203 Pressure*)
		p203_ppi : REAL; (*Pump 203 Internal Pressure*)
		p203_pfq : REAL; (*Pump 203 Totalizer*)
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
