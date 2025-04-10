
{REDUND_ERROR} FUNCTION HA_AlarmX_Helper : DINT (*Helper Function for Setting and Acknowledging Alarms with User Logger support.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		MpLink : MpComIdentType;
		AlarmName : STRING[255];
		AlarmAction : HA_ALARMX_ACTION_ENUM;
		LogEventAddText : STRING[255];
		AllowMultiple : BOOL;
	END_VAR
	VAR
		Internal : HA_AlarmX_Helper_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION_BLOCK HA_AlarmXCore (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		MpLink : MpComIdentType;
		pBuffer : UDINT;
		pOutputData : REFERENCE TO HA_AlarmX_AlarmExtraData_typ;
		delayTime : TIME;
	END_VAR
	VAR
		internal : HA_AlarmX_Core_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HA_AlarmX_CfgModule (*Adds the HA default module alarms to the given alarmxcore*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		MpLink : {REDUND_UNREPLICABLE} UDINT;
		Prefix : {REDUND_UNREPLICABLE} STRING[255];
		CodePrefix : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		internal : {REDUND_UNREPLICABLE} HA_AlarmX_CfgMod_Internal_typ;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
	END_VAR
END_FUNCTION_BLOCK
