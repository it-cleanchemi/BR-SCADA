
(* Transfer List from Device to Another. Always Overwrites Existing. If either src or dest path includes directories, then the directories need to exist (this will not create them automatically) *)
FUNCTION_BLOCK HA_Dir_Transfer
	IF NOT enable THEN
		Internal.State 											:= TRANSFER_RESET;
	END_IF;

	CASE Internal.State OF
		TRANSFER_RESET:
			status												:= 65534;
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			Internal.State 										:= TRANSFER_IDLE;
		TRANSFER_IDLE:
			IF enable THEN
				IF pTransferList <> 0 THEN
					status										:= 65535;
					brsmemset(ADR(Internal),0,SIZEOF(Internal));
					Internal.ListIdx		 					:= 0;
					Internal.State 								:= TRANSFER_CHECK_LIST;
				ELSE
					status										:= 60001;
					Internal.State								:= TRANSFER_ERROR;
				END_IF;
			END_IF;
		TRANSFER_CHECK_LIST:
			status												:= 65535;
			IF Internal.ListIdx >= 0 AND Internal.ListIdx <= MAX_TRANSFER_LIST_IDX THEN
				brsmemcpy(ADR(Internal.TransferListItem),pTransferList+SIZEOF(Internal.TransferListItem)*Internal.ListIdx,SIZEOF(Internal.TransferListItem));
				IF Internal.TransferListItem.Valid THEN
					IF Internal.TransferListItem.SrcDelete AND Internal.TransferListItem.NoTransfer THEN
						IF Internal.TransferListItem.IsDir THEN
							Internal.State 						:= TRANSFER_DIR_DELETE_CMD;
						ELSE
							Internal.State 						:= TRANSFER_FILE_DELETE_CMD;
						END_IF;
					ELSIF Internal.TransferListItem.SrcCreateDir THEN
						Internal.State 							:= TRANSFER_DIR_CREATE_CMD;
					ELSIF Internal.TransferListItem.IsDir THEN
						Internal.State 							:= TRANSFER_DIR_COPY_CMD;
					ELSE
						Internal.State 							:= TRANSFER_FILE_COPY_CMD;
					END_IF;
				ELSE
					Internal.State 								:= TRANSFER_DONE;
				END_IF;
			ELSE
				Internal.State 									:= TRANSFER_DONE;
			END_IF;
		TRANSFER_DIR_COPY_CMD:
			status												:= 65535;
			Internal.DirCopy_0.enable 							:= TRUE;
			Internal.DirCopy_0.option 							:= fiOVERWRITE;
			Internal.DirCopy_0.pSrcDev 							:= ADR(Internal.TransferListItem.SrcDev);
			Internal.DirCopy_0.pSrcDir 							:= ADR(Internal.TransferListItem.SrcPath);
			Internal.DirCopy_0.pDestDev 						:= ADR(Internal.TransferListItem.DestDev);
			Internal.DirCopy_0.pDestDir 						:= ADR(Internal.TransferListItem.DestPath);
			Internal.State 										:= TRANSFER_DIR_COPY_WAIT;
		TRANSFER_DIR_COPY_WAIT:
			status												:= 65535;
			IF Internal.TransferListItem.SrcOrDestUSB AND NOT USB_Connected THEN
				Internal.DirCopy_0.enable 						:= FALSE;
				status											:= 65000;
				Internal.State 									:= TRANSFER_ERROR;
			ELSIF Internal.DirCopy_0.status = 0 THEN
				Internal.DirCopy_0.enable 						:= FALSE;
				IF Internal.TransferListItem.SrcDelete THEN
					Internal.State 								:= TRANSFER_DIR_DELETE_CMD;
				ELSE
					Internal.ListIdx							:= Internal.ListIdx + 1;
					Internal.State 								:= TRANSFER_CHECK_LIST;
				END_IF;
			ELSIF Internal.DirCopy_0.status <> ERR_FUB_BUSY AND Internal.DirCopy_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DirCopy_0.enable 						:= FALSE;
				status											:= Internal.DirCopy_0.status;
				Internal.State 									:= TRANSFER_ERROR;
			END_IF;
		TRANSFER_DIR_DELETE_CMD:
			status												:= 65535;
			Internal.DirDeleteEx_0.enable 						:= TRUE;
			Internal.DirDeleteEx_0.pDevice 						:= ADR(Internal.TransferListItem.SrcDev);
			Internal.DirDeleteEx_0.pName	 					:= ADR(Internal.TransferListItem.SrcPath);
			Internal.State 										:= TRANSFER_DIR_DELETE_WAIT;
		TRANSFER_DIR_DELETE_WAIT:
			status												:= 65535;
			IF Internal.TransferListItem.SrcOrDestUSB AND NOT USB_Connected THEN
				Internal.DirDeleteEx_0.enable 					:= FALSE;
				status											:= 65000;
				Internal.State 									:= TRANSFER_ERROR;
			ELSIF Internal.DirDeleteEx_0.status = 0 THEN
				Internal.DirDeleteEx_0.enable 					:= FALSE;
				Internal.ListIdx								:= Internal.ListIdx + 1;
				Internal.State 									:= TRANSFER_CHECK_LIST;
			ELSIF Internal.DirDeleteEx_0.status <> ERR_FUB_BUSY AND Internal.DirDeleteEx_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DirDeleteEx_0.enable 					:= FALSE;
				status											:= Internal.DirDeleteEx_0.status;
				Internal.State 									:= TRANSFER_ERROR;
			END_IF;
		TRANSFER_FILE_COPY_CMD:
			status												:= 65535;
			Internal.FileCopy_0.enable 							:= TRUE;
			Internal.FileCopy_0.option 							:= fiOVERWRITE;
			Internal.FileCopy_0.pSrcDev 						:= ADR(Internal.TransferListItem.SrcDev);
			Internal.FileCopy_0.pSrc	 						:= ADR(Internal.TransferListItem.SrcPath);
			Internal.FileCopy_0.pDestDev 						:= ADR(Internal.TransferListItem.DestDev);
			Internal.FileCopy_0.pDest							:= ADR(Internal.TransferListItem.DestPath);
			Internal.State 										:= TRANSFER_FILE_COPY_WAIT;
		TRANSFER_FILE_COPY_WAIT:
			status												:= 65535;
			IF Internal.TransferListItem.SrcOrDestUSB AND NOT USB_Connected THEN
				Internal.FileCopy_0.enable 						:= FALSE;
				status											:= 65000;
				Internal.State 									:= TRANSFER_ERROR;
			ELSIF Internal.FileCopy_0.status = 0 THEN
				Internal.FileCopy_0.enable 						:= FALSE;
				IF Internal.TransferListItem.SrcDelete THEN
					Internal.State 								:= TRANSFER_FILE_DELETE_CMD;
				ELSE
					Internal.ListIdx							:= Internal.ListIdx + 1;
					Internal.State 								:= TRANSFER_CHECK_LIST;
				END_IF;
			ELSIF Internal.FileCopy_0.status <> ERR_FUB_BUSY AND Internal.FileCopy_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.FileCopy_0.enable 						:= FALSE;
				status											:= Internal.FileCopy_0.status;
				Internal.State 									:= TRANSFER_ERROR;
			END_IF;
		TRANSFER_FILE_DELETE_CMD:
			status												:= 65535;
			Internal.FileDelete_0.enable 						:= TRUE;
			Internal.FileDelete_0.pDevice 						:= ADR(Internal.TransferListItem.SrcDev);
			Internal.FileDelete_0.pName	 						:= ADR(Internal.TransferListItem.SrcPath);
			Internal.State 										:= TRANSFER_FILE_DELETE_WAIT;
		TRANSFER_FILE_DELETE_WAIT:
			status												:= 65535;
			IF Internal.TransferListItem.SrcOrDestUSB AND NOT USB_Connected THEN
				Internal.FileDelete_0.enable 					:= FALSE;
				status											:= 65000;
				Internal.State 									:= TRANSFER_ERROR;
			ELSIF Internal.FileDelete_0.status = 0 THEN
				Internal.FileDelete_0.enable 					:= FALSE;
				Internal.ListIdx								:= Internal.ListIdx + 1;
				Internal.State 									:= TRANSFER_CHECK_LIST;
			ELSIF Internal.FileDelete_0.status <> ERR_FUB_BUSY AND Internal.FileDelete_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.FileDelete_0.enable 					:= FALSE;
				status											:= Internal.FileDelete_0.status;
				Internal.State 									:= TRANSFER_ERROR;
			END_IF;
		TRANSFER_DIR_CREATE_CMD:
			status												:= 65535;
			Internal.DirCreate_0.enable 						:= TRUE;
			Internal.DirCreate_0.pDevice 						:= ADR(Internal.TransferListItem.SrcDev);
			Internal.DirCreate_0.pName	 						:= ADR(Internal.TransferListItem.SrcPath);
			Internal.State 										:= TRANSFER_DIR_CREATE_WAIT;
		TRANSFER_DIR_CREATE_WAIT:
			status												:= 65535;
			IF Internal.TransferListItem.SrcOrDestUSB AND NOT USB_Connected THEN
				Internal.DirCreate_0.enable 					:= FALSE;
				status											:= 65000;
				Internal.State 									:= TRANSFER_ERROR;
			ELSIF Internal.DirCreate_0.status = 0 THEN
				Internal.DirCreate_0.enable 					:= FALSE;
				Internal.ListIdx								:= Internal.ListIdx + 1;
				Internal.State 									:= TRANSFER_CHECK_LIST;
			ELSIF Internal.DirCreate_0.status <> ERR_FUB_BUSY AND Internal.DirCreate_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.FileDelete_0.enable 					:= FALSE;
				status											:= Internal.DirCreate_0.status;
				Internal.State 									:= TRANSFER_ERROR;
			END_IF;
		TRANSFER_DONE:
			status												:= 0;
		TRANSFER_ERROR:
			// Error
	END_CASE;

	index 														:= Internal.ListIdx;

	Internal.DirCreate_0();
	Internal.DirCopy_0();
	Internal.FileCopy_0();
	Internal.DirDeleteEx_0();
	Internal.FileDelete_0();

END_FUNCTION_BLOCK
