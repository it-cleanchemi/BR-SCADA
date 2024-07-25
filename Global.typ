
TYPE
	IO_type : 	STRUCT 
		Modbus : Modbus_type;
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
END_TYPE
