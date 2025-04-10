
(* Finds the first open index of the item array *)
FUNCTION HA_ItemX_FirstOpenIndex
	HA_ItemX_FirstOpenIndex							:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID = 0 THEN
			HA_ItemX_FirstOpenIndex					:= TRUE;
			ItemX.ReturnedIndex						:= Internal.i;
			EXIT;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
