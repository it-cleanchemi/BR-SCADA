
(* Modifies Elem in List without changing UID, returns true if successful *)
FUNCTION HA_ItemX_ModElemByIndex

	HA_ItemX_ModElemByIndex							:= FALSE;
	ItemX.ReturnedIndex								:= -1;

	IF Index >= 0 AND Index <= MAX_ITEM_X_IDX THEN
		IF ItemX.List[Index].UID = 0 THEN
			HA_ItemX_AddElem(ItemX);
		ELSE
			Internal.tempUID						:= ItemX.List[Index].UID;
			ItemX.List[Index]						:= ItemX.Elem;
			ItemX.List[Internal.i].UID 				:= Internal.tempUID;
		END_IF;
		ItemX.ReturnedIndex							:= Index;
		HA_ItemX_ModElemByIndex						:= TRUE;
	END_IF;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex								:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex							:= TRUE;
	END_IF;

END_FUNCTION
