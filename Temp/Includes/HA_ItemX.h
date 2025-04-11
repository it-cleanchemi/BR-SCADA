/* Automation Studio generated header file */
/* Do not edit ! */
/* HA_ItemX  */

#ifndef _HA_ITEMX_
#define _HA_ITEMX_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_ITEM_X_IDX 15
 #define MAX_NAME_STRING_LENGTH 30
#else
 _GLOBAL_CONST signed short MAX_ITEM_X_IDX;
 _GLOBAL_CONST signed short MAX_NAME_STRING_LENGTH;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum ITEM_X_STATE_ENUM
{	ITEM_X_STATE_UNDEFINED,
	ITEM_X_STATE_WAIT_START,
	ITEM_X_STATE_ACTIVE,
	ITEM_X_STATE_DONE,
	ITEM_X_STATE_UNKNOWN,
	ITEM_X_STATE_ERRORSTOP
} ITEM_X_STATE_ENUM;

typedef enum ITEM_X_LOC_ENUM
{	ITEM_X_LOC_UNDEFINED,
	ITEM_X_LOC_UNKNOWN
} ITEM_X_LOC_ENUM;

typedef struct ItemX_Par_Recipe_typ
{	float MaxLength;
} ItemX_Par_Recipe_typ;

typedef struct ItemX_Par_typ
{	signed short ProductID;
	struct ItemX_Par_Recipe_typ Recipe;
} ItemX_Par_typ;

typedef struct ItemX_Status_typ
{	float Position;
	float Length;
	plcbit ManuallyRemoved;
	plcbit Rejected;
	plcbit Passed;
	plcdt TimeIn;
	plcdt TimeOut;
	plcbit Error;
} ItemX_Status_typ;

typedef struct ItemX_Elem_typ
{	unsigned long UID;
	enum ITEM_X_STATE_ENUM State;
	enum ITEM_X_LOC_ENUM LastLoc;
	enum ITEM_X_LOC_ENUM Loc;
	struct ItemX_Par_typ Par;
	struct ItemX_Status_typ Status;
} ItemX_Elem_typ;

typedef struct ItemX_typ
{	unsigned long CurrentUID;
	plcbit ValidIndex;
	signed short ReturnedIndex;
	struct ItemX_Elem_typ Elem;
	struct ItemX_Elem_typ List[16];
} ItemX_typ;

typedef struct HA_ItemX_Internal_typ
{	signed short i;
	signed short j;
	struct ItemX_Elem_typ tempItemX;
	signed short tempIndex;
	unsigned long tempUID;
} HA_ItemX_Internal_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC plcbit HA_ItemX_DeleteByIndex(signed short Index, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_DeleteByUID(unsigned long UID, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_UID_TO_Index(unsigned long UID, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_Sanitize(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_Reorder_LowToHighUID(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_Reorder_HighToLowUID(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_IndexLowestUID(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_IndexHighestUID(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_FirstOpenIndex(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_GetElemByIndex(signed short Index, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_GetElemByUID(unsigned long UID, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_ModElemByIndex(signed short Index, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_ModElemByUID(unsigned long UID, struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_AddElem(struct ItemX_typ* ItemX);
_BUR_PUBLIC plcbit HA_ItemX_IncrementUID(struct ItemX_typ* ItemX);


#ifdef __cplusplus
};
#endif
#endif /* _HA_ITEMX_ */

