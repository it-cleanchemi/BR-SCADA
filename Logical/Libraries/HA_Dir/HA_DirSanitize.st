
(* Sanitizes File Device *)
FUNCTION_BLOCK HA_DirSanitize
	IF enable = FALSE THEN
		Internal.State										:= DIRSANITIZE_RESET;
	END_IF;

	CASE Internal.State OF
		DIRSANITIZE_RESET:
			status											:= 65534;
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			Internal.State									:= DIRSANITIZE_IDLE;
		DIRSANITIZE_IDLE:
			status											:= 65534;
			IF enable THEN
				IF pDevice <> 0 AND pDirDef <> 0 AND pFileList <> 0 THEN
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					status									:= 65535;
					Internal.State							:= DIRSANITIZE_EVALUATE_DIR;
				ELSE
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					status									:= 60001;
					Internal.State							:= DIRSANITIZE_ERROR;
				END_IF;
			END_IF;
		DIRSANITIZE_EVALUATE_DIR:
			status											:= 65535;
			// Determine DirIdx
			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
				brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
				IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
					EXIT;
				ELSE
					Internal.Found 							:= FALSE;
					FOR Internal.j := 0 TO MAX_DIR_DEF_IDX DO
						brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.j,SIZEOF(Internal.DirDefItem));
						IF Internal.DirDefItem.Valid THEN
							IF Internal.FileListItem.Path = Internal.DirDefItem.DirPath OR Internal.FileListItem.Path = '' THEN
								Internal.FileListItem.DirIdx := Internal.j;
								Internal.Found 				:= TRUE;
								EXIT;
							END_IF;
						END_IF;
					END_FOR;
					IF NOT Internal.Found THEN
						FOR Internal.j := MAX_DIR_DEF_IDX TO 0 BY -1 DO
							brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.j,SIZEOF(Internal.DirDefItem));
							IF Internal.DirDefItem.Valid THEN
								Internal.Find := FIND(Internal.FileListItem.Path,Internal.DirDefItem.DirPath);
								IF Internal.Find <> 0 THEN
									Internal.TempPath := DELETE(Internal.FileListItem.Path,LEN(Internal.DirDefItem.DirPath),1);
									IF FIND(Internal.TempPath,'/') <> 0 OR Internal.DirDefItem.DirPath = '' THEN
										Internal.FileListItem.DirIdx := Internal.j;
										EXIT;
									END_IF;
								END_IF;
							END_IF;
						END_FOR;
					END_IF;
					brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
				END_IF;
			END_FOR;

			// Handle Directory Sanitation
			Internal.Found									:= FALSE;
			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
				brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
				IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
					EXIT;
				ELSIF Internal.FileListItem.IsDir THEN
					brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.FileListItem.DirIdx,SIZEOF(Internal.DirDefItem));
					IF NOT Internal.DirDefItem.Sanitize.AllowUndefinedDir AND Internal.DirDefItem.DirPath <> Internal.FileListItem.Path THEN
						Internal.Found					:= TRUE;
						Internal.FileListItem.Internal.1 := 1;
						brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
					END_IF;
				END_IF;
			END_FOR;
			Internal.State 									:= DIRSANITIZE_DELETE_DIR_CMD;
		DIRSANITIZE_DELETE_DIR_CMD:
			status											:= 65535;
			Internal.Found									:= FALSE;
			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
				brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
				IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
					EXIT;
				ELSIF Internal.FileListItem.IsDir AND Internal.FileListItem.Internal.1 = 1 AND NOT Internal.FileListItem.Internal.2 = 1 THEN
					Internal.Found							:= TRUE;
					EXIT;
				END_IF;
			END_FOR;
			IF Internal.Found THEN
				Internal.DirDeleteEx_0.enable 				:= TRUE;
				Internal.DirDeleteEx_0.pDevice 				:= pDevice;
				Internal.DirDeleteEx_0.pName 				:= ADR(Internal.FileListItem.Path);
				Internal.State 								:= DIRSANITIZE_DELETE_DIR_WAIT;
			ELSE
				Internal.State 								:= DIRSANITIZE_EVALUATE_FILE;
			END_IF;
		DIRSANITIZE_DELETE_DIR_WAIT:
			status											:= 65535;
			IF Internal.DirDeleteEx_0.status = 0 OR (Internal.DirDeleteEx_0.status <> ERR_FUB_BUSY AND Internal.DirDeleteEx_0.status <> ERR_FUB_ENABLE_FALSE) THEN
				Internal.DirDeleteEx_0.enable 				:= FALSE;
				Internal.FileListItem1 						:= Internal.FileListItem;
				FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
					brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
					IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
						EXIT;
					ELSIF FIND(Internal.FileListItem.Path,Internal.FileListItem1.Path) <> 0 THEN
						Internal.FileListItem.Internal.3 	:= 1;
						brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
					END_IF;
				END_FOR;
				Internal.j 									:= 0;
				FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
					brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
					IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
						EXIT;
					ELSIF Internal.FileListItem.Internal.3 = 0 THEN
						IF Internal.j <> Internal.i THEN
							Internal.Size						:= (MAX_DIR_MAN_FILE_LIST_IDX+1-Internal.i);
							brsmemmove(pFileList+Internal.j*SIZEOF(Internal.FileListItem),pFileList+Internal.i*SIZEOF(Internal.FileListItem),SIZEOF(Internal.FileListItem)*Internal.Size);
							brsmemset(pFileList+(Internal.j+Internal.Size)*SIZEOF(Internal.FileListItem),0,SIZEOF(Internal.FileListItem)*(Internal.i-Internal.j));
						END_IF;
						Internal.j							:= Internal.j + (Internal.i-Internal.j)+1;
						Internal.i							:= Internal.j-1;
					ELSE
						brsmemset(pFileList+Internal.i*SIZEOF(Internal.FileListItem),0,SIZEOF(Internal.FileListItem));
					END_IF;
				END_FOR;
				Internal.State 								:= DIRSANITIZE_DELETE_DIR_CMD;
			END_IF;
		DIRSANITIZE_EVALUATE_FILE:
			status											:= 65535;

			// Handle File Sanitation By Root
			Internal.Found									:= FALSE;
			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
				brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
				IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
					EXIT;
				ELSIF NOT Internal.FileListItem.IsDir THEN
					brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.FileListItem.DirIdx,SIZEOF(Internal.DirDefItem));
					IF Internal.DirDefItem.Sanitize.SanitizeFilesByRoot THEN
						Internal.TempPath 					:= '';
						brsstrcat(ADR(Internal.TempPath),ADR(Internal.DirDefItem.DirPath));
						brsstrcat(ADR(Internal.TempPath),ADR('/'));
						brsstrcat(ADR(Internal.TempPath),ADR(Internal.DirDefItem.Sanitize.FileRoot));
						IF FIND(Internal.FileListItem.Path,Internal.TempPath) = 0 THEN
							Internal.Found					:= TRUE;
							Internal.FileListItem.Internal.1 := 1;
							brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
						END_IF;
					END_IF;
					IF Internal.DirDefItem.Sanitize.SanitizeFilesByExt THEN
						IF FIND(Internal.FileListItem.Path,Internal.DirDefItem.Sanitize.FileExtension) = 0 THEN
							Internal.Found					:= TRUE;
							Internal.FileListItem.Internal.1 := 1;
							brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
						END_IF;
					END_IF;
				END_IF;
			END_FOR;

			// Check if found in the last step. If so we have to go delete these files before counting them for size and number of files.
			IF Internal.Found THEN
				Internal.State 								:= DIRSANITIZE_DELETE_FILE_CMD;
			ELSE
				// Reorder Files for Evaluation
				FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX-1 DO
					brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
					brsmemcpy(ADR(Internal.FileListItem1),pFileList+SIZEOF(Internal.FileListItem1)*(Internal.i+1),SIZEOF(Internal.FileListItem1));
					IF (Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE) OR (Internal.FileListItem1.Path = '' AND Internal.FileListItem1.IsDir = FALSE) THEN
						EXIT;
					ELSE
						IF Internal.FileListItem.DirIdx = Internal.FileListItem1.DirIdx THEN
							IF Internal.FileListItem.DateUDINT < Internal.FileListItem1.DateUDINT THEN
								brsmemcpy(pFileList+SIZEOF(Internal.FileListItem1)*Internal.i,ADR(Internal.FileListItem1),SIZEOF(Internal.FileListItem1));
								brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*(Internal.i+1),ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
							END_IF;
						END_IF;
					END_IF;
				END_FOR;
				// Delete Files Based On File Number and Size Restriction
				Internal.Found								:= FALSE;
				Internal.CurrentDirIdx						:= 0;
				Internal.FileCount							:= 1;
				Internal.SizeCount							:= 0;
				FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
					brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
					IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
						EXIT;
					ELSIF NOT Internal.FileListItem.IsDir THEN
						IF Internal.CurrentDirIdx <> Internal.FileListItem.DirIdx THEN
							Internal.CurrentDirIdx 			:= Internal.FileListItem.DirIdx;
							Internal.FileCount				:= 1;
							Internal.SizeCount				:= Internal.FileListItem.Size;
						ELSE
							Internal.FileCount				:= Internal.FileCount + 1;
							Internal.SizeCount				:= Internal.SizeCount + Internal.FileListItem.Size;
						END_IF;
						brsmemcpy(ADR(Internal.DirDefItem),pDirDef+SIZEOF(Internal.DirDefItem)*Internal.FileListItem.DirIdx,SIZEOF(Internal.DirDefItem));
						IF Internal.FileCount > Internal.DirDefItem.Sanitize.MaxFiles OR Internal.SizeCount > Internal.DirDefItem.Sanitize.MaxSize THEN
							Internal.Found					:= TRUE;
							Internal.FileListItem.Internal.1 := 1;
							brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
						END_IF;
					END_IF;
				END_FOR;
				IF Internal.Found THEN
					Internal.State 							:= DIRSANITIZE_DELETE_FILE_CMD;
				ELSE
					Internal.State 							:= DIRSANITIZE_DONE;
				END_IF;
			END_IF;
		DIRSANITIZE_DELETE_FILE_CMD:
			status											:= 65535;
			Internal.Found									:= FALSE;
			FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
				brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
				IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
					EXIT;
				ELSIF NOT Internal.FileListItem.IsDir AND Internal.FileListItem.Internal.1 = 1 THEN
					Internal.FileListItem.Internal.1 := 0;
					Internal.FileListItem.Internal.3 := 1;
					brsmemcpy(pFileList+SIZEOF(Internal.FileListItem)*Internal.i,ADR(Internal.FileListItem),SIZEOF(Internal.FileListItem));
					Internal.Found							:= TRUE;
					EXIT;
				END_IF;
			END_FOR;
			IF Internal.Found THEN
				Internal.FileDelete_0.enable 				:= TRUE;
				Internal.FileDelete_0.pDevice 				:= pDevice;
				Internal.FileDelete_0.pName 				:= ADR(Internal.FileListItem.Path);
				Internal.State 								:= DIRSANITIZE_DELETE_FILE_WAIT;
			ELSE
				Internal.State 								:= DIRSANITIZE_EVALUATE_FILE;
			END_IF;
		DIRSANITIZE_DELETE_FILE_WAIT:
			status											:= 65535;
			IF Internal.FileDelete_0.status = 0 OR (Internal.FileDelete_0.status <> ERR_FUB_BUSY AND Internal.FileDelete_0.status <> ERR_FUB_ENABLE_FALSE) THEN
				Internal.FileDelete_0.enable 				:= FALSE;
				Internal.j 									:= 0;
				FOR Internal.i := 0 TO MAX_DIR_MAN_FILE_LIST_IDX DO
					brsmemcpy(ADR(Internal.FileListItem),pFileList+SIZEOF(Internal.FileListItem)*Internal.i,SIZEOF(Internal.FileListItem));
					IF Internal.FileListItem.Path = '' AND Internal.FileListItem.IsDir = FALSE THEN
						EXIT;
					ELSIF Internal.FileListItem.Internal.3 = 0 THEN
						IF Internal.j <> Internal.i THEN
							Internal.Size						:= (MAX_DIR_MAN_FILE_LIST_IDX+1-Internal.i);
							brsmemmove(pFileList+Internal.j*SIZEOF(Internal.FileListItem),pFileList+Internal.i*SIZEOF(Internal.FileListItem),SIZEOF(Internal.FileListItem)*Internal.Size);
							brsmemset(pFileList+(Internal.j+Internal.Size)*SIZEOF(Internal.FileListItem),0,SIZEOF(Internal.FileListItem)*(Internal.i-Internal.j));
						END_IF;
						Internal.j							:= Internal.j + (Internal.i-Internal.j)+1;
						Internal.i							:= Internal.j-1;
					ELSE
						brsmemset(pFileList+Internal.i*SIZEOF(Internal.FileListItem),0,SIZEOF(Internal.FileListItem));
					END_IF;
				END_FOR;
				Internal.State 								:= DIRSANITIZE_DELETE_FILE_CMD;
			END_IF;
		DIRSANITIZE_DONE:
			status											:= 0;
		DIRSANITIZE_ERROR:
			// Error
	END_CASE;

	Internal.FileDelete_0();
	Internal.DirDeleteEx_0();

END_FUNCTION_BLOCK
