
{REDUND_ERROR} FUNCTION HA_ItemX_DeleteByIndex : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Index : INT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_DeleteByUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		UID : UDINT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_UID_TO_Index : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		UID : UDINT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_Sanitize : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_Reorder_LowToHighUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_Reorder_HighToLowUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_IndexLowestUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_IndexHighestUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_FirstOpenIndex : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_GetElemByIndex : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Index : INT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_GetElemByUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		UID : UDINT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_ModElemByIndex : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Index : INT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_ModElemByUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		UID : UDINT;
	END_VAR
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_AddElem : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_ItemX_IncrementUID : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		ItemX : ItemX_typ;
	END_VAR
	VAR
		Internal : HA_ItemX_Internal_typ;
	END_VAR
END_FUNCTION
