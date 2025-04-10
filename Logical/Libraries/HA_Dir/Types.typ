
TYPE
	HA_FileList_typ : 	STRUCT 
		Path : STRING[260];
		DateUDINT : UDINT;
		Size : UDINT;
		IsDir : BOOL;
		DirIdx : INT;
		Internal : USINT; (*0=unread, 1=delete, 2=parentDirDelete, 3=remove*)
	END_STRUCT;
	HA_DirDef_typ : 	STRUCT 
		Valid : BOOL;
		DirPath : STRING[260];
		Sanitize : HA_DirDef_Sanitize_typ;
	END_STRUCT;
	HA_DirDef_Sanitize_typ : 	STRUCT 
		AllowUndefinedDir : BOOL;
		SanitizeFilesByExt : BOOL;
		SanitizeFilesByRoot : BOOL;
		FileExtension : STRING[260];
		FileRoot : STRING[260];
		MaxSize : UDINT;
		MaxFiles : UDINT;
	END_STRUCT;
	HA_DirMake_Internal_typ : 	STRUCT 
		State : HA_DIRMAKE_STATE_ENUM;
		DirDefItem : HA_DirDef_typ;
		DirCreate_0 : DirCreate;
		DirIdx : INT;
	END_STRUCT;
	HA_DIRMAKE_STATE_ENUM : 
		(
		DIRMAKE_RESET,
		DIRMAKE_IDLE,
		DIRMAKE_CREATE_CMD,
		DIRMAKE_CREATE_WAIT,
		DIRMAKE_DONE,
		DIRMAKE_ERROR
		);
	HA_DirSanitize_Internal_typ : 	STRUCT 
		State : HA_DIRSANITIZE_STATE_ENUM;
		DirDeleteEx_0 : DirDeleteEx;
		FileDelete_0 : FileDelete;
		DirDefItem : HA_DirDef_typ;
		FileListItem : HA_FileList_typ;
		FileListItem1 : HA_FileList_typ;
		i : INT;
		j : INT;
		FileListIdx : INT;
		Size : UDINT;
		DirIdent : UDINT;
		SizeCount : UDINT;
		FileCount : UDINT;
		DirData : fiDIR_READ_EX_DATA;
		Found : BOOL;
		Find : INT;
		TempPath : STRING[260];
		CurrentDirIdx : INT;
	END_STRUCT;
	HA_DIRSANITIZE_STATE_ENUM : 
		(
		DIRSANITIZE_RESET,
		DIRSANITIZE_IDLE,
		DIRSANITIZE_EVALUATE_DIR,
		DIRSANITIZE_DELETE_DIR_CMD,
		DIRSANITIZE_DELETE_DIR_WAIT,
		DIRSANITIZE_DELETE_DIR_PROCESS,
		DIRSANITIZE_EVALUATE_FILE,
		DIRSANITIZE_DELETE_FILE_CMD,
		DIRSANITIZE_DELETE_FILE_WAIT,
		DIRSANITIZE_DONE,
		DIRSANITIZE_ERROR
		);
	HA_Dir_USB_Connect_Internal_typ : 	STRUCT 
		UsbNodeListGet_0 : UsbNodeListGet;
		UsbNodeGet_0 : UsbNodeGet;
		DevLink_0 : DevLink;
		UsbMsDeviceReady_0 : UsbMsDeviceReady;
		DevUnlink_0 : DevUnlink;
		CTON_Delay : CTON;
		NodeList : UDINT;
		Node : usbNode_typ;
		ParString : STRING[1000];
		Handle : UDINT;
		State : HA_USB_CONNECT_STATE_ENUM;
	END_STRUCT;
	HA_USB_CONNECT_STATE_ENUM : 
		(
		USB_CONNECT_RESET,
		USB_CONNECT_IDLE,
		USB_CONNECT_GET_LIST_CMD,
		USB_CONNECT_GET_LIST_WAIT,
		USB_CONNECT_GET_NODE_CMD,
		USB_CONNECT_GET_NODE_WAIT,
		USB_CONNECT_DEVLINK_CMD,
		USB_CONNECT_DEVLINK_WAIT,
		USB_CONNECT_CHECK_CONNECTED,
		USB_CONNECT_CONNECTED,
		USB_CONNECT_DEVUNLINK_CMD,
		USB_CONNECT_DEVUNLINK_WAIT,
		USB_CONNECT_DELAY,
		USB_CONNECT_DONE,
		USB_CONNECT_ERROR
		);
	HA_Dir_Transfer_Internal_typ : 	STRUCT 
		State : HA_DIR_TRANSFER_STATE_ENUM;
		TransferListItem : HA_Dir_Transfer_List_typ;
		ListIdx : INT;
		DirCopy_0 : DirCopy;
		FileCopy_0 : FileCopy;
		DirDeleteEx_0 : DirDeleteEx;
		DirCreate_0 : DirCreate;
		FileDelete_0 : FileDelete;
	END_STRUCT;
	HA_Dir_Transfer_List_typ : 	STRUCT 
		Valid : BOOL;
		SrcOrDestUSB : BOOL;
		IsDir : BOOL;
		SrcDelete : BOOL;
		SrcCreateDir : BOOL;
		NoTransfer : BOOL;
		SrcDev : STRING[80];
		SrcPath : STRING[260];
		DestDev : STRING[80];
		DestPath : STRING[260];
	END_STRUCT;
	HA_DIR_TRANSFER_STATE_ENUM : 
		(
		TRANSFER_RESET,
		TRANSFER_IDLE,
		TRANSFER_CHECK_LIST,
		TRANSFER_DIR_COPY_CMD,
		TRANSFER_DIR_COPY_WAIT,
		TRANSFER_FILE_COPY_CMD,
		TRANSFER_FILE_COPY_WAIT,
		TRANSFER_DIR_DELETE_CMD,
		TRANSFER_DIR_DELETE_WAIT,
		TRANSFER_FILE_DELETE_CMD,
		TRANSFER_FILE_DELETE_WAIT,
		TRANSFER_DIR_CREATE_CMD,
		TRANSFER_DIR_CREATE_WAIT,
		TRANSFER_DONE,
		TRANSFER_ERROR
		);
	HA_DirReadAll_Internal_typ : 	STRUCT 
		State : HA_DIRREADALL_STATE_ENUM;
		DirOpen_0 : DirOpen;
		DirReadEx_0 : DirReadEx;
		DirClose_0 : DirClose;
		i : INT;
		FileListIdx : INT;
		DirIdent : UDINT;
		DirData : fiDIR_READ_EX_DATA;
		FileListItem : HA_FileList_typ;
		CurrentDirPath : STRING[260];
	END_STRUCT;
	HA_DIRREADALL_STATE_ENUM : 
		(
		DIRREADALL_RESET,
		DIRREADALL_IDLE,
		DIRREADALL_OPEN_CMD,
		DIRREADALL_OPEN_WAIT,
		DIRREADALL_READ_CMD,
		DIRREADALL_READ_WAIT,
		DIRREADALL_CLOSE_WAIT,
		DIRREADALL_EVALUATE,
		DIRREADALL_DONE,
		DIRREADALL_ERROR
		);
END_TYPE
