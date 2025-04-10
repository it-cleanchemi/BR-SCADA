
{REDUND_ERROR} FUNCTION_BLOCK IdentifyConfig (*returns the ID and Version of the configuration as strings and also enters a record in the log book*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_OUTPUT
		Done : BOOL;
		ConfigID : STRING[255];
		ConfigVersion : STRING[32];
	END_VAR
	VAR
		internal : IdentifyConfig_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
