
(* Deletes the first index matching the UID entered, Returns True if Deleted, False if not found *)
FUNCTION HA_ItemX_DeleteByUID
	HA_ItemX_DeleteByUID								:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID = UID THEN
			brsmemset(ADR(ItemX.List[Internal.i]),0,SIZEOF(ItemX.List[Internal.i]));
			ItemX.ReturnedIndex						:= Internal.i;
			HA_ItemX_DeleteByUID						:= TRUE;
			EXIT;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
