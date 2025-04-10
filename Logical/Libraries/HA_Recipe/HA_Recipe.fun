
{REDUND_ERROR} FUNCTION_BLOCK HA_Recipe_Helper (*A helper block for MpRecipe*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		Def : Recipe_Definition_typ;
		RemOK : BOOL;
		ErrorReset : BOOL;
		ForceLoad : BOOL;
		ForceSave : BOOL;
		ForceDefaults : BOOL;
	END_VAR
	VAR_OUTPUT
		AutoLoadSuccess : BOOL;
		AutoLoadFailed : BOOL;
		RemLost : BOOL;
		Initialized : BOOL;
		Ready : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : HA_Recipe_Helper_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
