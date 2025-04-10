
(* Reads Entire File Device *)
FUNCTION_BLOCK HA_DirReadAll
	IF enable = FALSE THEN
		Internal.State														:= DIRREADALL_RESET;
	END_IF;

	CASE Internal.State OF
		DIRREADALL_RESET:
			status															:= 65534;
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			Internal.State													:= DIRREADALL_IDLE;
		DIRREADALL_IDLE:
			status															:= 65534;
			IF enable THEN
				IF pDevice <> 0 AND pFileList <> 0 THEN
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					brsmemset(pFileList,0,(SIZEOF(Internal.FileListItem)*(MAX_DIR_MAN_FILE_LIST_IDX+1)));
					Internal.FileListItem.DateUDINT := 0;
					Internal.FileListItem.IsDir := TRUE;
					Internal.FileListItem.Path := '';
					Internal.FileListItem.Size := 0;
					Internal.FileListItem.Internal.0 := 0;
					Internal.FileListIdx									:= 0;
					IF Internal.FileListIdx <= MAX_DIR_MAN_FILE_LIST_IDX THEN
						brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.FileListIdx,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
					END_IF;
					Internal.FileListIdx									:= Internal.FileListIdx + 1;
					status													:= 65535;
					Internal.CurrentDirPath									:= '';
					Internal.State											:= DIRREADALL_OPEN_CMD;
				ELSE
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					status													:= 60001;
					Internal.State											:= DIRREADALL_ERROR;
				END_IF;
			END_IF;
		DIRREADALL_OPEN_CMD:
			status															:= 65535;
			Internal.DirOpen_0.enable 										:= TRUE;
			Internal.DirOpen_0.pDevice 										:= pDevice;
			Internal.DirOpen_0.pName 										:= ADR(Internal.CurrentDirPath);
			Internal.State 													:= DIRREADALL_OPEN_WAIT;
		DIRREADALL_OPEN_WAIT:	
			status															:= 65535;
			IF Internal.DirOpen_0.status = 0 THEN
				Internal.DirOpen_0.enable 									:= FALSE;
				Internal.DirIdent 											:= Internal.DirOpen_0.ident;
				Internal.State 												:= DIRREADALL_READ_CMD;
			ELSIF Internal.DirOpen_0.status <> ERR_FUB_BUSY AND Internal.DirOpen_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DirOpen_0.enable 									:= FALSE;
				status														:= Internal.DirOpen_0.status;
				Internal.State 												:= DIRREADALL_ERROR;
			END_IF;
		DIRREADALL_READ_CMD:
			status															:= 65535;
			brsmemset(ADR(Internal.DirData),0,SIZEOF(Internal.DirData));
			Internal.DirReadEx_0.enable 									:= TRUE;
			Internal.DirReadEx_0.ident 										:= Internal.DirIdent;
			Internal.DirReadEx_0.pData 										:= ADR(Internal.DirData);
			Internal.DirReadEx_0.data_len 									:= SIZEOF(Internal.DirData);
			Internal.State 													:= DIRREADALL_READ_WAIT;
		DIRREADALL_READ_WAIT:
			status															:= 65535;
			IF Internal.DirReadEx_0.status = 0 THEN
				Internal.DirReadEx_0.enable 								:= FALSE;
				brsmemset(ADR(Internal.FileListItem),0,SIZEOF(Internal.FileListItem));
				IF Internal.DirData.Filename[0] <> 46 THEN // check for '.' or '..' and filter out, '.' is decimal 46 in ascii
					IF Internal.CurrentDirPath <> '' THEN
						brsstrcat(ADR(Internal.FileListItem.Path),ADR(Internal.CurrentDirPath));
						brsstrcat(ADR(Internal.FileListItem.Path),ADR('/'));
					END_IF;
					brsstrcat(ADR(Internal.FileListItem.Path),ADR(Internal.DirData.Filename));
					Internal.FileListItem.DateUDINT 						:= DT_TO_UDINT(Internal.DirData.Date);
					Internal.FileListItem.Size 								:= Internal.DirData.Filelength;
					Internal.FileListItem.IsDir 							:= Internal.DirData.Mode = 1;
					Internal.FileListItem.Internal.0						:= Internal.DirData.Mode = 1;
					IF Internal.FileListIdx >= MAX_DIR_MAN_FILE_LIST_IDX THEN
						Internal.State 										:= DIRREADALL_CLOSE_WAIT;
						Internal.DirClose_0.ident 							:= Internal.DirIdent;
						Internal.DirClose_0.enable 							:= TRUE;
					ELSE
						brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.FileListIdx,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
						Internal.FileListIdx								:= Internal.FileListIdx + 1;
						Internal.State 										:= DIRREADALL_READ_CMD;
					END_IF;
				ELSE
					Internal.State 											:= DIRREADALL_READ_CMD;
				END_IF;
			ELSIF Internal.DirReadEx_0.status <> ERR_FUB_BUSY AND Internal.DirReadEx_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DirReadEx_0.enable 								:= FALSE;
				Internal.DirClose_0.ident 									:= Internal.DirIdent;
				Internal.DirClose_0.enable 									:= TRUE;
				Internal.State 												:= DIRREADALL_CLOSE_WAIT;
			END_IF;
		DIRREADALL_CLOSE_WAIT:
			status															:= 65535;
			IF Internal.DirClose_0.status = 0 OR (Internal.DirClose_0.status <> ERR_FUB_BUSY AND Internal.DirClose_0.status <> ERR_FUB_ENABLE_FALSE) THEN
				Internal.DirClose_0.enable 									:= FALSE;
				IF Internal.FileListIdx >= MAX_DIR_MAN_FILE_LIST_IDX THEN
					Internal.State 											:= DIRREADALL_EVALUATE;
				ELSE
					FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
						brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
						IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
							Internal.State 									:= DIRREADALL_EVALUATE;
							EXIT;
						ELSIF Internal.FileListItem.Internal.0 = 1 THEN
							Internal.CurrentDirPath							:= Internal.FileListItem.Path;
							Internal.FileListItem.Internal.0				:= 0;
							brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
							Internal.State 									:= DIRREADALL_OPEN_CMD;
							EXIT;
						END_IF;
					END_FOR;
				END_IF;
			END_IF;
		DIRREADALL_EVALUATE:
			status															:= 65535;
//			// Build Lists
//			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
//				IF Internal.FileList[Internal.i].Path = '' THEN
//					EXIT;
//				ELSIF Internal.FileList[Internal.i].IsDir THEN
//					FileList[Internal.FileListIdx] 							:= Internal.FileList[Internal.i];
//					IF Internal.FileListIdx < MAX_DIR_MAN_FILE_LIST_IDX THEN
//						Internal.FileListIdx								:= Internal.FileListIdx + 1;
//					END_IF;
//				ELSE
//					FileList[Internal.FileListIdx] 							:= Internal.FileList[Internal.i];
//					IF Internal.FileListIdx < MAX_DIR_MAN_FILE_LIST_IDX THEN
//						Internal.FileListIdx								:= Internal.FileListIdx + 1;
//					END_IF;
//				END_IF;
//			END_FOR;
//			FileList 														:= Internal.FileList;
//			Internal.FileListIdx 											:= 0;
			Internal.State 													:= DIRREADALL_DONE;
		DIRREADALL_DONE:
			status															:= 0;
		DIRREADALL_ERROR:
			// Error
	END_CASE;

	Internal.DirOpen_0();
	Internal.DirReadEx_0();
	Internal.DirClose_0();

END_FUNCTION_BLOCK
