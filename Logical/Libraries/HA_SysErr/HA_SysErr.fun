
{REDUND_ERROR} FUNCTION_BLOCK HA_SysErr_Lookup (*Returns System Error If It Exists In Table*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Execute : BOOL;
		ErrorNum : DINT;
	END_VAR
	VAR_OUTPUT
		ErrorNumText : STRING[255];
		Error : BOOL;
		Done : BOOL;
	END_VAR
	VAR
		Internal : Internal_HA_SysErr_Lookup;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_SysErr_Log (*Returns System Error If It Exists In Table*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Execute : BOOL;
		ErrorNum : DINT;
	END_VAR
	VAR_OUTPUT
		ErrorNumText : STRING[255];
		Error : BOOL;
		Done : BOOL;
	END_VAR
	VAR
		Internal : Internal_HA_SysErr_Log;
	END_VAR
END_FUNCTION_BLOCK
