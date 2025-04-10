
(* A helper block for MpRecipe *)
FUNCTION_BLOCK HA_Recipe_Helper

//Reset in not enabled
	IF NOT Enable THEN
		Internal.State								:= HA_RH_ST_RESET;
	END_IF;
	
	//Reset Status Flags
	Ready 											:= FALSE;
	Error											:= FALSE;
	AutoLoadSuccess									:= FALSE;
	AutoLoadFailed									:= FALSE;
	RemLost											:= FALSE;
	
	//Main Case
	CASE Internal.State OF
		HA_RH_ST_RESET:
			Initialized								:= FALSE;
			Internal.ErrorReset 					:= FALSE;
			Internal.MpRecipeXml_0.Load				:= FALSE;
			Internal.MpRecipeXml_0.Save				:= FALSE;
			Internal.State							:= HA_RH_ST_VALIDATE_INPUTS;
		HA_RH_ST_VALIDATE_INPUTS:
			IF Def.pVar = 0 OR Def.SizeVar = 0 OR Def.DeviceName = '' OR Def.FileName = '' OR Def.VarName = '' THEN
				Internal.State						:= HA_RH_ST_ERROR;
			ELSE
				Internal.State						:= HA_RH_ST_REG_PAR_W;
			END_IF;
		HA_RH_ST_REG_PAR_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF Internal.MpRecipeRegPar_0.Error THEN
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF Internal.CTON_Timeout.Q THEN
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF Internal.MpRecipeRegPar_0.Active THEN
				IF RemOK THEN
					Internal.State					:= HA_RH_ST_READY;
				ELSE
					RemLost							:= TRUE;
					Internal.MpRecipeXml_0.Load		:= TRUE;
					Internal.State					:= HA_RH_ST_AUTO_LOAD_W;
				END_IF;
			END_IF;
		HA_RH_ST_READY:
			IF ForceLoad THEN
				Internal.MpRecipeXml_0.Load			:= TRUE;
				Internal.State						:= HA_RH_ST_LOAD_W;
			ELSIF ForceDefaults THEN
				IF Def.pDefaultVar <> 0 THEN
					brsmemcpy(Def.pVar,Def.pDefaultVar,Def.SizeVar);
				ELSE
					brsmemset(Def.pVar,0,Def.SizeVar);
				END_IF;
				Internal.MpRecipeXml_0.Save			:= TRUE;
				Internal.State						:= HA_RH_ST_SAVE_W;
			ELSIF ForceSave THEN
				Internal.MpRecipeXml_0.Save			:= TRUE;
				Internal.State						:= HA_RH_ST_SAVE_W;
			ELSIF Def.pCmpVar <> 0 THEN //AutoSave Enabled
				IF brsmemcmp(Def.pCmpVar,Def.pVar,Def.SizeVar) <> 0 THEN //AutoSave On Change
					brsmemcpy(Def.pCmpVar,Def.pVar,Def.SizeVar);
					Internal.MpRecipeXml_0.Save		:= TRUE;
					Internal.State					:= HA_RH_ST_SAVE_W;
				ELSE
					Ready 							:= TRUE;
					Initialized						:= TRUE;
				END_IF;
			ELSE
				Initialized							:= TRUE;
				Ready 								:= TRUE;
			END_IF;
		HA_RH_ST_LOAD_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.Error) OR Internal.CTON_Timeout.Q THEN
				Internal.MpRecipeXml_0.Load			:= FALSE;
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.CommandDone AND NOT Internal.MpRecipeXml_0.Error) THEN
				Internal.MpRecipeXml_0.Load			:= FALSE;
				Internal.State						:= HA_RH_ST_READY;
			END_IF;
		HA_RH_ST_SAVE_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.Error) OR Internal.CTON_Timeout.Q THEN
				Internal.MpRecipeXml_0.Save			:= FALSE;
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.CommandDone AND NOT Internal.MpRecipeXml_0.Error) THEN
				Internal.MpRecipeXml_0.Save			:= FALSE;
				Internal.State						:= HA_RH_ST_READY;
			END_IF;
		HA_RH_ST_AUTO_LOAD_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.Error) OR Internal.CTON_Timeout.Q THEN
				AutoLoadFailed						:= TRUE;
				IF Def.pDefaultVar <> 0 THEN
					brsmemcpy(Def.pVar,Def.pDefaultVar,Def.SizeVar);
				ELSE
					brsmemset(Def.pVar,0,Def.SizeVar);
				END_IF;
				Internal.MpRecipeXml_0.Load			:= FALSE;
				Internal.State						:= HA_RH_ST_AUTO_RESET_D;
			ELSIF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.CommandDone AND NOT Internal.MpRecipeXml_0.Error) THEN
				AutoLoadSuccess						:= TRUE;
				Internal.MpRecipeXml_0.Load			:= FALSE;
				Internal.State						:= HA_RH_ST_READY;
			END_IF;
		HA_RH_ST_AUTO_RESET_D:
			Internal.State							:= HA_RH_ST_AUTO_RESET_C;
		HA_RH_ST_AUTO_RESET_C:
			Internal.ErrorReset						:= TRUE;
			Internal.State							:= HA_RH_ST_AUTO_RESET_W;
		HA_RH_ST_AUTO_RESET_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF Internal.CTON_Timeout.Q THEN
				Internal.ErrorReset					:= FALSE;
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF NOT Internal.MpRecipeXml_0.Error THEN
				Internal.ErrorReset					:= FALSE;
				Internal.MpRecipeXml_0.Save			:= TRUE;
				Internal.State						:= HA_RH_ST_AUTO_SAVE_W;
			END_IF;
		HA_RH_ST_AUTO_SAVE_W:
			Internal.CTON_Timeout.IN				:= TRUE;
			Internal.CTON_Timeout.PT				:= T#2s;
			IF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.Error) OR Internal.CTON_Timeout.Q THEN
				Internal.MpRecipeXml_0.Save			:= FALSE;
				Internal.State						:= HA_RH_ST_ERROR;
			ELSIF (NOT Internal.MpRecipeXml_0.CommandBusy AND Internal.MpRecipeXml_0.CommandDone AND NOT Internal.MpRecipeXml_0.Error) THEN
				Internal.MpRecipeXml_0.Save			:= FALSE;
				Internal.State						:= HA_RH_ST_READY;
			END_IF;
		HA_RH_ST_ERROR:
			Error									:= TRUE;
			IF ErrorReset THEN
				Internal.State						:= HA_RH_ST_RESET;
			END_IF;
	END_CASE;
	
	//Reset Commands
	ForceDefaults 									:= FALSE;
	ForceLoad 										:= FALSE;
	ForceSave 										:= FALSE;
	
	//Reset Timeout On State Change
	IF Internal.LastState <> Internal.State OR Internal.State = HA_RH_ST_RESET THEN
		Internal.LastState 							:= Internal.State;
		Internal.CTON_Timeout.IN					:= FALSE;
	END_IF;
	
	//FB Calls
	Internal.CTON_Timeout();
	Internal.MpRecipeRegPar_0(MpLink := ADR(Def.MpLink), Enable := Enable, ErrorReset := (ErrorReset OR Internal.ErrorReset), PVName := ADR(Def.VarName), Category := ADR(Def.VarName));
	Internal.MpRecipeXml_0(MpLink := ADR(Def.MpLink), Enable := Enable, ErrorReset := (ErrorReset OR Internal.ErrorReset), DeviceName := ADR(Def.DeviceName), FileName := ADR(Def.FileName), Category := ADR(Def.VarName));

END_FUNCTION_BLOCK
