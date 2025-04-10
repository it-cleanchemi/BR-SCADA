
TYPE
	HA_IO_Digital_Sim_typ : 	STRUCT 
		Active : BOOL;
		Logical : BOOL;
	END_STRUCT;
	HA_IO_Digital_Signal_typ : 	STRUCT 
		Logical : BOOL;
		EdgePosLogical : BOOL;
		EdgeNegLogical : BOOL;
		Filtered : BOOL;
		EdgePosFiltered : BOOL;
		EdgeNegFiltered : BOOL;
		IOMapping : BOOL;
		InvertedIOMapping : BOOL;
		VisIOMapping : BOOL;
		VisRefresher : BOOL;
	END_STRUCT;
	HA_IO_Digital_Par_LimitSet_typ : 	STRUCT 
		FilterOnTime_Min : LREAL;
		FilterOnTime_Max : LREAL;
		FilterOffTime_Min : LREAL;
		FilterOffTime_Max : LREAL;
	END_STRUCT;
	HA_IO_Digital_Par_typ : 	STRUCT 
		InvertedIOMapping : BOOL;
		FilterOnTime : LREAL;
		FilterOffTime : LREAL;
	END_STRUCT;
	HA_IO_Digital_Internal_typ : 	STRUCT 
		StatusLogical : BOOL;
		StatusFiltered : BOOL;
		CTON_DB_Off : CTON;
		CTON_DB_On : CTON;
	END_STRUCT;
	HA_IO_Digital_Forcing_typ : 	STRUCT 
		Off : BOOL;
		On : BOOL;
	END_STRUCT;
	HA_IO_Analog_Sim_typ : 	STRUCT 
		Active : BOOL;
		Logical : LREAL;
	END_STRUCT;
	HA_IO_Analog_Signal_typ : 	STRUCT 
		UnlimitedLogical : LREAL;
		MinExceeded : BOOL;
		MaxExceeded : BOOL;
		Logical : LREAL;
		Filtered : LREAL;
		Vis : HA_IO_Analog_Vis_typ;
		IOMapping : HA_IO_Analog_Mapping_typ;
	END_STRUCT;
	HA_IO_Analog_Par_LimitSet_typ : 	STRUCT 
		M_Min : LREAL;
		M_Max : LREAL;
		B_Min : LREAL;
		B_Max : LREAL;
		Filter_Min : LREAL;
		Filter_Max : LREAL;
		MinValue_Min : LREAL;
		MinValue_Max : LREAL;
		MaxValue_Min : LREAL;
		MaxValue_Max : LREAL;
	END_STRUCT;
	HA_IO_Analog_Par_typ : 	STRUCT 
		M : LREAL;
		B : LREAL;
		Filter : LREAL;
		MaxValue : LREAL;
		MinValue : LREAL;
	END_STRUCT;
	HA_IO_Analog_Internal_typ : 	STRUCT 
		InitFilter : BOOL;
		Filter : LREAL;
		LastFilter : LREAL;
		Temp : LREAL;
	END_STRUCT;
	HA_IO_Analog_Forcing_typ : 	STRUCT 
		Off : BOOL;
		On : BOOL;
		Value : LREAL;
	END_STRUCT;
	HA_IO_Analog_Vis_typ : 	STRUCT 
		Raw : LREAL;
		IO : LREAL;
		App : LREAL;
	END_STRUCT;
	HA_IO_Analog_Mapping_typ : 	STRUCT 
		VarSINT : SINT;
		VarUSINT : USINT;
		VarINT : INT;
		VarUINT : UINT;
		VarDINT : DINT;
		VarUDINT : UDINT;
		VarREAL : REAL;
		VarLREAL : LREAL;
	END_STRUCT;
	HA_IO_ANALOG_TYPE_ENUM : 
		(
		HA_IO_ANALOG_TYPE_INT,
		HA_IO_ANALOG_TYPE_USINT,
		HA_IO_ANALOG_TYPE_SINT,
		HA_IO_ANALOG_TYPE_UINT,
		HA_IO_ANALOG_TYPE_DINT,
		HA_IO_ANALOG_TYPE_UDINT,
		HA_IO_ANALOG_TYPE_REAL,
		HA_IO_ANALOG_TYPE_LREAL
		);
END_TYPE
