
(* Returns the index of the lowest UID found in the item array,*)
FUNCTION HA_ItemX_IndexLowestUID
	HA_ItemX_IndexLowestUID							:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	Internal.tempUID								:= 4294967295; // Set to UDINT max
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID < Internal.tempUID AND ItemX.List[Internal.i].UID > 0 THEN
			Internal.tempUID						:= ItemX.List[Internal.i].UID;
			ItemX.ReturnedIndex						:= Internal.i;
			HA_ItemX_IndexLowestUID					:= TRUE;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
