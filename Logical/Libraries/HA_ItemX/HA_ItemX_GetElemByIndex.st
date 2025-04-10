
(* Gets Elem in List, returns true if successful *)
FUNCTION HA_ItemX_GetElemByIndex
	Internal.i 										:= 0; // This is to avoid a compiler warning that internal is not used.
	HA_ItemX_GetElemByIndex							:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	
	IF Index >= 0 AND Index <= MAX_ITEM_X_IDX THEN
		IF ItemX.List[Index].UID <> 0 THEN
			ItemX.Elem								:= ItemX.List[Index];
			ItemX.ReturnedIndex						:= Index;
			HA_ItemX_GetElemByIndex					:= TRUE;
		END_IF;
	END_IF;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex								:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex							:= TRUE;
	END_IF;

END_FUNCTION
