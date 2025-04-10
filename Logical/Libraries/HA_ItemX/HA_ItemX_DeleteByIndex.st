
(* Deletes the index entered, Returns True if Deleted, False if not in range *)
FUNCTION HA_ItemX_DeleteByIndex
	Internal.i 											:= 0; // This is to avoid a compiler warning that internal is not used.
	HA_ItemX_DeleteByIndex								:= FALSE;
	ItemX.ReturnedIndex									:= -1;
	IF Index >= 0 AND Index <= MAX_ITEM_X_IDX THEN
		brsmemset(ADR(ItemX.List[Index]),0,SIZEOF(ItemX.List[Index]));
		ItemX.ReturnedIndex								:= Index;
		HA_ItemX_DeleteByIndex							:= TRUE;
	END_IF;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
