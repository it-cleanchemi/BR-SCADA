
TYPE
	ItemX_typ : 	STRUCT 
		CurrentUID : UDINT; (*REQUIRED*)
		ValidIndex : BOOL; (*REQUIRED*)
		ReturnedIndex : INT; (*REQUIRED*)
		Elem : ItemX_Elem_typ; (*REQUIRED*)
		List : ARRAY[0..MAX_ITEM_X_IDX]OF ItemX_Elem_typ; (*REQUIRED*)
	END_STRUCT;
	ItemX_Elem_typ : 	STRUCT 
		UID : UDINT; (*REQUIRED*)
		State : ITEM_X_STATE_ENUM; (*REQUIRED*)
		LastLoc : ITEM_X_LOC_ENUM; (*REQUIRED*)
		Loc : ITEM_X_LOC_ENUM; (*REQUIRED*)
		Par : ItemX_Par_typ; (*REQUIRED*)
		Status : ItemX_Status_typ; (*REQUIRED*)
	END_STRUCT;
	ItemX_Status_typ : 	STRUCT 
		Position : REAL;
		Length : REAL;
		ManuallyRemoved : BOOL;
		Rejected : BOOL;
		Passed : BOOL;
		TimeIn : DATE_AND_TIME;
		TimeOut : DATE_AND_TIME;
		Error : BOOL;
	END_STRUCT;
	ItemX_Par_typ : 	STRUCT 
		ProductID : INT;
		Recipe : ItemX_Par_Recipe_typ;
	END_STRUCT;
	ItemX_Par_Recipe_typ : 	STRUCT 
		MaxLength : REAL;
	END_STRUCT;
	ITEM_X_STATE_ENUM : 
		(
		ITEM_X_STATE_UNDEFINED, (*REQUIRED*)
		ITEM_X_STATE_WAIT_START,
		ITEM_X_STATE_ACTIVE,
		ITEM_X_STATE_DONE,
		ITEM_X_STATE_UNKNOWN,
		ITEM_X_STATE_ERRORSTOP
		);
	ITEM_X_LOC_ENUM : 
		(
		ITEM_X_LOC_UNDEFINED, (*REQUIRED*)
		ITEM_X_LOC_UNKNOWN
		);
	HA_ItemX_Internal_typ : 	STRUCT 
		i : INT;
		j : INT;
		tempItemX : ItemX_Elem_typ;
		tempIndex : INT;
		tempUID : UDINT;
	END_STRUCT;
END_TYPE
