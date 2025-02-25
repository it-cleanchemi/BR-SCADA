(*Global Structrues*)

TYPE
	Pump_Data_Real : 	STRUCT 
	END_STRUCT;
	Modbus_Type : 	STRUCT 
		Pump_Data_Real : ARRAY[0..5]OF USINT;
	END_STRUCT;
	Skid_type : 	STRUCT 
		Pmax_Pumps : Pmax_Pumps_type;
		Pmax_Pump_101 : Pmax_Pump_101_type;
		Pmax_Pump_101b : Pmax_Pump_101b_type;
		Pmax_Pump_102 : Pmax_Pump_102_type;
		BufferTank : BufferTank_Variables;
		GeneralDosingVariables : Dosing_General_Variables_type;
		Pmax_General_Variables : Pmax_General_Variables_type;
	END_STRUCT;
	Vis_Type : 	STRUCT 
		Pumps : USINT;
		Main : Vis_Main_type;
		Global : USINT;
	END_STRUCT;
	Par_Type : 	STRUCT 
	END_STRUCT;
	Rem_Type : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
	CMD_type : 	STRUCT 
		Stop : BOOL;
		Start : BOOL;
	END_STRUCT;
END_TYPE

(**)

TYPE
	Vis_Main_In_type : 	STRUCT 
		TestButton : BOOL;
	END_STRUCT;
	Vis_Main_type : 	STRUCT 
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

(*Dosing Pump Alarms*)
(**)
(*Dosing Side General Variables*)

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
	Sensor_Variables : 	STRUCT  (*Flowmeter and Other Misc Sensor Variables*)
		sensors_config : UINT; (*Sensor Configurations*)
		sensor_301 : UINT; (*Sensor 301, Type Unknown*)
		sensor_302 : UINT; (*Sensor 302, Type Unknown*)
		sensor_303 : UINT; (*Sensor 303, Type Unknown*)
		sensor_304 : UINT; (*Sensor 304, Type Unknown*)
		flowmeter_301 : UINT; (*Flowmeter 301 Value*)
		flowmeter_301_tot : UINT; (*Flowmeter 301 Totalizer*)
		flowmeter_302 : UINT; (*Flowmeter 302 Value*)
		flowmeter_302_tot : UINT; (*Flowmeter 302 Totalizer*)
		flowmeter_303 : UINT; (*Flowmeter 303 Value*)
		flowmeter_303_tot : UINT; (*Flowmeter 303 Totalizer*)
		flowmeter_304 : UINT; (*Flowmeter 304 Value*)
		flowmeter_304_tot : UINT; (*Flowmeter 304 Totalizer*)
		cd101 : UINT; (*Current Tranducer 101*)
		cd101_target_Send : UINT; (*Current Tranducer 101 Send Bit*)
		cd101_target_Write : UINT; (*Current Tranducer 101 Write Variable*)
		cd101_target_Ack : UINT; (*Current Tranducer 101 Ack Bit*)
		cd101_target : UINT; (*Current Tranducer 101 Setpoint*)
		cd102 : UINT; (*Current Tranducer 102*)
		cd102_target : UINT; (*Current Tranducer 102 Setpoint*)
		cd103 : UINT; (*Current Tranducer 103*)
		pi101 : UINT; (*Pressure in Mixing Train*)
		ti101 : UINT; (*Temperature After Caustic*)
		ti102 : UINT; (*Temperature After Hydrogen Peroxide*)
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
	ConversionRatios : 	STRUCT  (*Efficiency Conversion Ratio Variables*)
		e_1 : UINT; (*HP to PAA Conversion Efficiency *)
		e_2 : UINT; (*Acetyl Conversion Efficiency *)
		tri_to_h202 : UINT; (*Molar Ration of NaOH to HP*)
		naoh_to_h202 : UINT; (*Molar Ratio of Triacetin to HP*)
	END_STRUCT;
END_TYPE

(**)
(*Pmax Generation General Variables*)

TYPE
	Pmax_General_Variables_type : 	STRUCT  (*PeroxyMax General Variables*)
		time_stamp : UINT; (*Pmax Time Stamp*)
		skid_id : UINT; (*Pmax Skid ID*)
		is_on : UINT; (*Pmax Generation is ON*)
		status : UINT; (*Pmax Status*)
		pmax_conc : UINT; (*Pmax Concentration*)
		pmax_rate : UINT; (*Pmax Rate*)
		pmax_pv : UINT; (*Pmax Value*)
		hp_conc : UINT; (*HP Concentration*)
		hp_conc_od : UINT; (*HP Concentration On Deck*)
		naoh_conc : UINT; (*NaOh Concentration*)
		naoh_conc_od : UINT; (*NaOh Concentration On Deck*)
	END_STRUCT;
END_TYPE

(**)
(*Buffer Tank Variables*)

TYPE
	BufferTank_Variables : 	STRUCT  (*Buffer Tank Variables*)
		filltime_sp : UINT; (*Filltime Setpoint*)
		filltime_pv : UINT; (*Filltime Current Value*)
		draintime_sp : UINT; (*Draintime Setpoint*)
		draintime_pv : UINT; (*Draintime Current Value*)
		bt_level : UINT; (*Buffer Tank Level*)
		bt_time : UINT; (*Buffer Tank Time for Graphs*)
	END_STRUCT;
END_TYPE

(**)
(*All Pumps Below*)

TYPE
	Pmax_Pumps_type : 	STRUCT  (*Peroxymax Pump Variables*)
		Pump_101 : Pmax_Pump_101_type;
		Pump_101b : Pmax_Pump_101b_type;
		Pump_102 : Pmax_Pump_102_type;
		Pump_103 : Pmax_Pump_103_type;
		Pump_104 : Pmax_Pump_104_type;
	END_STRUCT;
	Pmax_Pump_101_type : 	STRUCT  (*Pmax Generation Variables for Pump 101*)
		p101_sp : REFERENCE TO UINT; (*Pump 101 Setpoint*)
		p101_sp_Write : UINT; (*Pump 101 Write to Setpoint*)
		p101_sp_Ack : BOOL; (*Pump 101 Ack for Setpoint*)
		p101_sp_Send : BOOL; (*Pump 101 Send for Setpoint*)
		p101_pv : UINT; (*Pump 101 Current Value*)
		p101_op : UINT; (*Pump 101 Output percentage*)
		p101_fb : UINT; (*Pump 101 Feedback percentage*)
		p101_fm_tot : UINT; (*Pump 101 Flowmeter Totatilizer*)
		p101_g_tm : UINT; (*Pump 101 Graph Time Setpoint*)
	END_STRUCT;
	Pmax_Pump_101b_type : 	STRUCT  (*Pmax Generation Variables for Pump 101b*)
		p101b_sp_Write : UINT; (*Pump 101 Write to Setpoint*)
		p101b_sp_Ack : BOOL; (*Pump 101 Ack for Setpoint*)
		p101_sp_Send : BOOL; (*Pump 101 Send for Setpoint*)
		p101b_sp : UINT; (*Pump 101b Setpoint*)
		p101b_op : UINT; (*Pump 101b Output percentage*)
		p101b_fb : UINT; (*Pump 101b Feedback percentage*)
		p101b_g_tm : UINT; (*Pump 101b Graph time*)
	END_STRUCT;
	Pmax_Pump_102_type : 	STRUCT  (*Pmax Generation Variables for Pump 102*)
		p102_sp : UINT; (*Pump 102 Setpoint*)
		p102_sp_Write : UINT; (*Pump 102 Write to Setpoint*)
		p102_sp_Ack : BOOL; (*Pump 102 Ack for Setpoint*)
		p102_sp_Send : BOOL; (*Pump 102 Send for Setpoint*)
		p102_pv : UINT; (*Pump 102 Current Value*)
		p102_op : UINT; (*Pump 102 Output percentage*)
		p102_fb : UINT; (*Pump 102 Feedback percentage*)
		p102_fm_tot : UINT; (*Pump 102 Flowmeter Totatilizer*)
		p102_g_tm : UINT; (*Pump 102 Graph Time*)
	END_STRUCT;
	Pmax_Pump_103_type : 	STRUCT  (*Pmax Generation Variables for Pump 103*)
		p103_sp : UINT; (*Pump 103 Setpoint*)
		p103_sp_Write : UINT; (*Pump 103 Write to Setpoint*)
		p103_sp_Ack : BOOL; (*Pump 103 Ack for Setpoint*)
		p103_sp_Send : BOOL; (*Pump 103 Send for Setpoint*)
		p103_pv : UINT; (*Pump 103 Current Value*)
		p103_op : UINT; (*Pump 103 Output percentage*)
		p103_fb : UINT; (*Pump 103 Feedback percentage*)
		p103_fm_tot : UINT; (*Pump 103 Flowmeter Totatilizer*)
		p103_g_tm : UINT; (*Pump 103 Graph Time*)
	END_STRUCT;
	Pmax_Pump_104_type : 	STRUCT  (*Pmax Generation Variables for Pump 104*)
		p104_sp : UINT; (*Pump 104 Setpoint*)
		p104_sp_Write : UINT; (*Pump 104 Write to Setpoint*)
		p104_sp_Ack : BOOL; (*Pump 104 Ack for Setpoint*)
		p104_sp_Send : BOOL; (*Pump 104 Send for Setpoint*)
		p104_pv : UINT; (*Pump 104 Current Value*)
		p104_op : UINT; (*Pump 104 Output percentage*)
		p104_fb : UINT; (*Pump 104 Feedback percentage*)
		p104_g_tm : UINT; (*Pump 104 Graph Time *)
		p104_fm_tot : UINT; (*Pump 104 Flowmeter Totatilizer*)
	END_STRUCT;
	Dosing_Pump_201_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 201*)
		p201_is_on : UINT;
		p201_sp_Write : UINT; (*Pump 201 Write to Setpoint*)
		p201_sp_Ack : BOOL; (*Pump 201 Ack for Setpoint*)
		p201_sp_Send : BOOL; (*Pump 201 Send for Setpoint*)
		p201_chem : UINT; (*Pump 201 Chemical*)
		p201_ref_fm : UINT; (*Pump 201 Reference Flowmeter*)
		p201_ref_sensor : UINT; (*Pump 201 Reference Sensor*)
		p201_conc : UINT; (*Pump 201 Concentration*)
		p201_ppm : UINT;
		p201_appm : UINT;
		p201_sp : UINT;
		p201_pv : UINT;
		p201_op : UINT;
		p201_fb : UINT;
		p201_fm_tot : UINT;
		p201_pi : UINT;
		p201_g_tm : UINT; (*Pump 201 Graph Time *)
	END_STRUCT;
	Dosing_Pump_202_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 202*)
		p202_is_on : UINT;
		p202_chem : UINT;
		p202_ref_fm : UINT;
		p202_ref_sensor : UINT;
		p202_conc : UINT;
		p202_ppm : UINT;
		p202_appm : UINT;
		p202_sp_Write : UINT; (*Pump 202 Write to Setpoint*)
		p202_sp_Ack : BOOL; (*Pump 202 Ack for Setpoint*)
		p202_sp_Send : BOOL; (*Pump 202 Send for Setpoint*)
		p202_sp : UINT;
		p202_pv : UINT;
		p202_op : UINT;
		p202_fb : UINT;
		p202_fm_tot : UINT;
		p202_pi : UINT;
		p202_g_tm : UINT; (*Pump 202 Graph Time*)
	END_STRUCT;
	Dosing_Pump_203_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 203*)
		p203_is_on : UINT;
		p203_chem : UINT;
		p203_ref_fm : UINT;
		p203_ref_sensor : UINT;
		p203_conc : UINT;
		p203_ppm : UINT;
		p203_appm : UINT;
		p203_sp : UINT;
		p203_sp_Write : UINT; (*Pump 203 Write to Setpoint*)
		p203_sp_Ack : BOOL; (*Pump 203 Ack for Setpoint*)
		p203_sp_Send : BOOL; (*Pump 203 Send for Setpoint*)
		p203_pv : UINT;
		p203_op : UINT;
		p203_fb : UINT;
		p203_fm_tot : UINT;
		p203_pi : UINT;
		p203_g_tm : UINT; (*Pump 203 Graph Time *)
	END_STRUCT;
	Dosing_Pump_204_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 204*)
		p204_is_on : UINT;
		p204_chem : UINT;
		p204_ref_fm : UINT;
		p204_ref_sensor : UINT;
		p204_conc : UINT;
		p204_ppm : UINT;
		p204_appm : UINT;
		p204_sp : UINT;
		p204_sp_Write : UINT; (*Pump 204 Write to Setpoint*)
		p204_sp_Ack : BOOL; (*Pump 204 Ack for Setpoint*)
		p204_sp_Send : BOOL; (*Pump 204 Send for Setpoint*)
		p204_pv : UINT;
		p204_op : UINT;
		p204_fb : UINT;
		p204_fm_tot : UINT;
		p204_pi : UINT;
		p204_g_tm : UINT; (*Pump 204 Graph Time*)
	END_STRUCT;
	Dosing_Pump_205_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 205*)
		p205_is_on : UINT;
		p205_chem : UINT;
		p205_ref_fm : UINT;
		p205_ref_sensor : UINT;
		p205_conc : UINT;
		p205_ppm : UINT;
		p205_appm : UINT;
		p205_sp : UINT;
		p205_sp_Write : UINT; (*Pump 205 Write to Setpoint*)
		p205_sp_Ack : BOOL; (*Pump 205 Ack for Setpoint*)
		p205_sp_Send : BOOL; (*Pump 205 Send for Setpoint*)
		p205_pv : UINT;
		p205_op : UINT;
		p205_fb : UINT;
		p205_fm_tot : UINT;
		p205_pi : UINT;
		p205_g_tm : UINT; (*Pump 205 Graph Time*)
	END_STRUCT;
	Dosing_Pump_206_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 206*)
		p206_is_on : UINT;
		p206_chem : UINT;
		p206_ref_fm : UINT;
		p206_ref_sensor : UINT;
		p206_conc : UINT;
		p206_ppm : UINT;
		p206_appm : UINT;
		p206_sp : UINT;
		p206_sp_Write : UINT; (*Pump 206 Write to Setpoint*)
		p206_sp_Ack : BOOL; (*Pump 206 Ack for Setpoint*)
		p206_sp_Send : BOOL; (*Pump 206 Send for Setpoint*)
		p206_pv : UINT;
		p206_op : UINT;
		p206_fb : UINT;
		p206_fm_tot : UINT;
		p206_pi : UINT;
		p206_g_tm : UINT; (*Pump 206 Graph Time*)
	END_STRUCT;
	Dosing_Pump_207_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 207*)
		p207_is_on : UINT;
		p207_chem : UINT;
		p207_ref_fm : UINT;
		p207_ref_sensor : UINT;
		p207_conc : UINT;
		p207_ppm : UINT;
		p207_appm : UINT;
		p207_sp : UINT;
		p207_sp_Write : UINT; (*Pump 207 Write to Setpoint*)
		p207_sp_Ack : BOOL; (*Pump 207 Ack for Setpoint*)
		p207_sp_Send : BOOL; (*Pump 207 Send for Setpoint*)
		p207_pv : UINT;
		p207_op : UINT;
		p207_fb : UINT;
		p207_fm_tot : UINT;
		p207_pi : UINT;
		p207_g_tm : UINT; (*Pump 207 Graph time*)
	END_STRUCT;
	Dosing_Pump_208_type : 	STRUCT  (*Dosing Pump Variables for Dosing Pump 207*)
		p208_is_on : UINT;
		p208_chem : UINT;
		p208_ref_fm : UINT;
		p208_ref_sensor : UINT;
		p208_conc : UINT;
		p208_ppm : UINT;
		p208_appm : UINT;
		p208_sp : UINT;
		p208_sp_Write : UINT; (*Pump 208 Write to Setpoint*)
		p208_sp_Ack : BOOL; (*Pump 208 Ack for Setpoint*)
		p208_sp_Send : BOOL; (*Pump 208 Send for Setpoint*)
		p208_pv : UINT;
		p208_op : UINT;
		p208_fb : UINT;
		p208_fm_tot : UINT;
		p208_pi : UINT;
		p208_g_tm : UINT; (*Pump 208 Graph Time*)
	END_STRUCT;
END_TYPE

(**)
(*System Information for swapping in between different modes and functionalities*)

TYPE
	Sys_Mode_Information : 	STRUCT 
		Sys_Mode : UINT; (*Mode for Visability/Changability of Variables*)
	END_STRUCT;
	ModbusDriver_type : 	STRUCT 
		BlockRecieved : BOOL;
		BlockSend : BOOL;
	END_STRUCT;
END_TYPE
