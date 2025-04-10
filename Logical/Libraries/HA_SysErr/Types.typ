
TYPE
	Internal_HA_SysErr_Log : 	STRUCT 
		State : INT;
		HA_SysErr_Lookup_0 : HA_SysErr_Lookup;
		ArEventLogGetIdent_0 : ArEventLogGetIdent;
		ArEventLogWrite_0 : ArEventLogWrite;
		AddData : STRING[255];
	END_STRUCT;
	Internal_HA_SysErr_Lookup : 	STRUCT 
		ArTextSysGetText_0 : ArTextSysGetText;
		TextID : STRING[255];
		ErrorNumString : STRING[80];
		State : INT;
	END_STRUCT;
END_TYPE
