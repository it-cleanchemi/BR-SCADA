
FUNCTION_BLOCK HA_DirMake
	
	IF enable = FALSE THEN
		Internal.State									:= DIRMAKE_RESET;
	END_IF;

	CASE Internal.State OF
		DIRMAKE_RESET:
			status										:= 65534;
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			Internal.State								:= DIRMAKE_IDLE;
		DIRMAKE_IDLE:
			status										:= 65534;
			IF enable THEN
				IF pDevice <> 0 AND pDirDef <> 0 THEN
					status								:= 65535;
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					Internal.State						:= DIRMAKE_CREATE_CMD;
				ELSE
					status								:= 60001;
					Internal.State						:= DIRMAKE_ERROR;
				END_IF;
			END_IF;
		DIRMAKE_CREATE_CMD:
			status										:= 65535;
			IF Internal.DirIdx >= 0 AND Internal.DirIdx <= MAX_DIR_DEF_IDX THEN
				brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.DirIdx,SIZEOF(Internal.DirDefItem));
				IF Internal.DirDefItem.Valid THEN
					IF Internal.DirDefItem.DirPath <> '' AND Internal.DirDefItem.DirPath <> '/' THEN
						Internal.DirCreate_0.enable 	:= TRUE;
						Internal.DirCreate_0.pDevice	:= pDevice;
						Internal.DirCreate_0.pName		:= ADR(Internal.DirDefItem.DirPath);
						Internal.State					:= DIRMAKE_CREATE_WAIT;
					ELSE
						Internal.DirIdx 				:= Internal.DirIdx + 1;
					END_IF;
				ELSE
					Internal.State						:= DIRMAKE_DONE;
				END_IF;
			ELSE
				Internal.State							:= DIRMAKE_DONE;
			END_IF;
		DIRMAKE_CREATE_WAIT:
			status										:= 65535;
			IF Internal.DirCreate_0.status = ERR_OK OR Internal.DirCreate_0.status = fiERR_DIR_ALREADY_EXIST THEN
				Internal.DirCreate_0.enable 			:= FALSE;
				Internal.DirIdx 						:= Internal.DirIdx + 1;
				Internal.State 							:= DIRMAKE_CREATE_CMD;	
			ELSIF Internal.DirCreate_0.status <> ERR_FUB_BUSY AND Internal.DirCreate_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DirCreate_0.enable 			:= FALSE;
				status									:= Internal.DirCreate_0.status;
				Internal.State 							:= DIRMAKE_ERROR;	
			END_IF;
		DIRMAKE_DONE:
			status										:= 0;
		DIRMAKE_ERROR:
			// Error
	END_CASE;
	Internal.DirCreate_0();

END_FUNCTION_BLOCK
