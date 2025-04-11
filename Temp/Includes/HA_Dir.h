/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_Dir  */

#ifndef _HA_DIR_
#define _HA_DIR_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "astime.h"
		#include "standard.h"
		#include "AsBrStr.h"
		#include "HA.h"
		#include "brsystem.h"
		#include "FileIO.h"
		#include "AsUSB.h"
#endif
#ifdef _SG4
		#include "astime.h"
		#include "standard.h"
		#include "AsBrStr.h"
		#include "HA.h"
		#include "brsystem.h"
		#include "FileIO.h"
		#include "AsUSB.h"
#endif
#ifdef _SGC
		#include "astime.h"
		#include "standard.h"
		#include "AsBrStr.h"
		#include "HA.h"
		#include "brsystem.h"
		#include "FileIO.h"
		#include "AsUSB.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_DIR_DEF_IDX 3
 #define MAX_DIR_MAN_DELETE_IDX 99
 #define MAX_DIR_MAN_FILE_LIST_IDX 99
 #define MAX_TRANSFER_LIST_IDX 9
#else
 _GLOBAL_CONST signed short MAX_DIR_DEF_IDX;
 _GLOBAL_CONST signed short MAX_DIR_MAN_DELETE_IDX;
 _GLOBAL_CONST signed short MAX_DIR_MAN_FILE_LIST_IDX;
 _GLOBAL_CONST signed short MAX_TRANSFER_LIST_IDX;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum HA_DIRMAKE_STATE_ENUM
{	DIRMAKE_RESET,
	DIRMAKE_IDLE,
	DIRMAKE_CREATE_CMD,
	DIRMAKE_CREATE_WAIT,
	DIRMAKE_DONE,
	DIRMAKE_ERROR
} HA_DIRMAKE_STATE_ENUM;

typedef enum HA_DIRSANITIZE_STATE_ENUM
{	DIRSANITIZE_RESET,
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
} HA_DIRSANITIZE_STATE_ENUM;

typedef enum HA_USB_CONNECT_STATE_ENUM
{	USB_CONNECT_RESET,
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
} HA_USB_CONNECT_STATE_ENUM;

typedef enum HA_DIR_TRANSFER_STATE_ENUM
{	TRANSFER_RESET,
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
} HA_DIR_TRANSFER_STATE_ENUM;

typedef enum HA_DIRREADALL_STATE_ENUM
{	DIRREADALL_RESET,
	DIRREADALL_IDLE,
	DIRREADALL_OPEN_CMD,
	DIRREADALL_OPEN_WAIT,
	DIRREADALL_READ_CMD,
	DIRREADALL_READ_WAIT,
	DIRREADALL_CLOSE_WAIT,
	DIRREADALL_EVALUATE,
	DIRREADALL_DONE,
	DIRREADALL_ERROR
} HA_DIRREADALL_STATE_ENUM;

typedef struct HA_FileList_typ
{	plcstring Path[261];
	unsigned long DateUDINT;
	unsigned long Size;
	plcbit IsDir;
	signed short DirIdx;
	unsigned char Internal;
} HA_FileList_typ;

typedef struct HA_DirDef_Sanitize_typ
{	plcbit AllowUndefinedDir;
	plcbit SanitizeFilesByExt;
	plcbit SanitizeFilesByRoot;
	plcstring FileExtension[261];
	plcstring FileRoot[261];
	unsigned long MaxSize;
	unsigned long MaxFiles;
} HA_DirDef_Sanitize_typ;

typedef struct HA_DirDef_typ
{	plcbit Valid;
	plcstring DirPath[261];
	struct HA_DirDef_Sanitize_typ Sanitize;
} HA_DirDef_typ;

typedef struct HA_DirMake_Internal_typ
{	enum HA_DIRMAKE_STATE_ENUM State;
	struct HA_DirDef_typ DirDefItem;
	struct DirCreate DirCreate_0;
	signed short DirIdx;
} HA_DirMake_Internal_typ;

typedef struct HA_DirSanitize_Internal_typ
{	enum HA_DIRSANITIZE_STATE_ENUM State;
	struct DirDeleteEx DirDeleteEx_0;
	struct FileDelete FileDelete_0;
	struct HA_DirDef_typ DirDefItem;
	struct HA_FileList_typ FileListItem;
	struct HA_FileList_typ FileListItem1;
	signed short i;
	signed short j;
	signed short FileListIdx;
	unsigned long Size;
	unsigned long DirIdent;
	unsigned long SizeCount;
	unsigned long FileCount;
	struct fiDIR_READ_EX_DATA DirData;
	plcbit Found;
	signed short Find;
	plcstring TempPath[261];
	signed short CurrentDirIdx;
} HA_DirSanitize_Internal_typ;

typedef struct HA_Dir_USB_Connect_Internal_typ
{	struct UsbNodeListGet UsbNodeListGet_0;
	struct UsbNodeGet UsbNodeGet_0;
	struct DevLink DevLink_0;
	struct UsbMsDeviceReady UsbMsDeviceReady_0;
	struct DevUnlink DevUnlink_0;
	struct CTON CTON_Delay;
	unsigned long NodeList;
	struct usbNode_typ Node;
	plcstring ParString[1001];
	unsigned long Handle;
	enum HA_USB_CONNECT_STATE_ENUM State;
} HA_Dir_USB_Connect_Internal_typ;

typedef struct HA_Dir_Transfer_List_typ
{	plcbit Valid;
	plcbit SrcOrDestUSB;
	plcbit IsDir;
	plcbit SrcDelete;
	plcbit SrcCreateDir;
	plcbit NoTransfer;
	plcstring SrcDev[81];
	plcstring SrcPath[261];
	plcstring DestDev[81];
	plcstring DestPath[261];
} HA_Dir_Transfer_List_typ;

typedef struct HA_Dir_Transfer_Internal_typ
{	enum HA_DIR_TRANSFER_STATE_ENUM State;
	struct HA_Dir_Transfer_List_typ TransferListItem;
	signed short ListIdx;
	struct DirCopy DirCopy_0;
	struct FileCopy FileCopy_0;
	struct DirDeleteEx DirDeleteEx_0;
	struct DirCreate DirCreate_0;
	struct FileDelete FileDelete_0;
} HA_Dir_Transfer_Internal_typ;

typedef struct HA_DirReadAll_Internal_typ
{	enum HA_DIRREADALL_STATE_ENUM State;
	struct DirOpen DirOpen_0;
	struct DirReadEx DirReadEx_0;
	struct DirClose DirClose_0;
	signed short i;
	signed short FileListIdx;
	unsigned long DirIdent;
	struct fiDIR_READ_EX_DATA DirData;
	struct HA_FileList_typ FileListItem;
	plcstring CurrentDirPath[261];
} HA_DirReadAll_Internal_typ;

typedef struct HA_DirMake
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pDirDef;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct HA_DirMake_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HA_DirMake_typ;

typedef struct HA_DirReadAll
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pFileList;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct HA_DirReadAll_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HA_DirReadAll_typ;

typedef struct HA_DirSanitize
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pDirDef;
	unsigned long pFileList;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct HA_DirSanitize_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HA_DirSanitize_typ;

typedef struct HA_Dir_USB_Connect
{
	/* VAR_INPUT (analog) */
	float delay;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct HA_Dir_USB_Connect_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit reset;
	plcbit refresh;
	/* VAR_OUTPUT (digital) */
	plcbit connected;
} HA_Dir_USB_Connect_typ;

typedef struct HA_Dir_Transfer
{
	/* VAR_INPUT (analog) */
	unsigned long pTransferList;
	/* VAR_OUTPUT (analog) */
	signed short index;
	unsigned short status;
	/* VAR (analog) */
	struct HA_Dir_Transfer_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit USB_Connected;
} HA_Dir_Transfer_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HA_DirMake(struct HA_DirMake* inst);
_BUR_PUBLIC void HA_DirReadAll(struct HA_DirReadAll* inst);
_BUR_PUBLIC void HA_DirSanitize(struct HA_DirSanitize* inst);
_BUR_PUBLIC void HA_Dir_USB_Connect(struct HA_Dir_USB_Connect* inst);
_BUR_PUBLIC void HA_Dir_Transfer(struct HA_Dir_Transfer* inst);


#ifdef __cplusplus
};
#endif
#endif /* _HA_DIR_ */

