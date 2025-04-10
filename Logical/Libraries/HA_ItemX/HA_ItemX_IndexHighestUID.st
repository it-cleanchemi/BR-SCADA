
(* Returns the index of the highest UID found in the item array, -1 if All UID are 0 *)
FUNCTION HA_ItemX_IndexHighestUID
	HA_ItemX_IndexHighestUID							:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	Internal.tempUID								:= 0;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID > Internal.tempUID THEN
			Internal.tempUID						:= ItemX.List[Internal.i].UID;
			ItemX.ReturnedIndex						:= Internal.i;
			HA_ItemX_IndexHighestUID					:= TRUE;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
