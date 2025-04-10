
(* Deletes all ItemXs that have UID of 0 *)
FUNCTION HA_ItemX_Sanitize
	HA_ItemX_Sanitize								:= TRUE;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID = 0 THEN
			brsmemset(ADR(ItemX.List[Internal.i]),0,SIZEOF(ItemX.List[Internal.i]));
		END_IF;
	END_FOR;

	HA_ItemX_FirstOpenIndex(ItemX);
	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
