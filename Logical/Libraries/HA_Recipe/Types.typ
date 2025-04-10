
TYPE
	Recipe_Definition_typ : 	STRUCT 
		MpLink : MpComIdentType;
		VarName : STRING[100];
		pVar : UDINT;
		SizeVar : UDINT;
		pCmpVar : UDINT;
		pDefaultVar : UDINT;
		DeviceName : STRING[50];
		FileName : STRING[255];
	END_STRUCT;
	HA_Recipe_Helper_Internal_typ : 	STRUCT 
		MpRecipeRegPar_0 : MpRecipeRegPar;
		MpRecipeXml_0 : MpRecipeXml;
		LastState : HA_RECIPE_HELPER_STATE_ENUM;
		State : HA_RECIPE_HELPER_STATE_ENUM;
		ErrorReset : BOOL;
		CTON_Timeout : CTON;
	END_STRUCT;
	HA_RECIPE_HELPER_STATE_ENUM : 
		(
		HA_RH_ST_RESET,
		HA_RH_ST_VALIDATE_INPUTS,
		HA_RH_ST_REG_PAR_W,
		HA_RH_ST_READY,
		HA_RH_ST_SAVE_W,
		HA_RH_ST_LOAD_W,
		HA_RH_ST_AUTO_LOAD_W,
		HA_RH_ST_AUTO_RESET_D,
		HA_RH_ST_AUTO_RESET_C,
		HA_RH_ST_AUTO_RESET_W,
		HA_RH_ST_AUTO_SAVE_W,
		HA_RH_ST_ERROR
		);
END_TYPE
