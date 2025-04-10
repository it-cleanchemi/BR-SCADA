
(* IncrementsUID, Ensures that the UID will be the Highest in the list if it isnt *)
FUNCTION HA_ItemX_IncrementUID
	HA_ItemX_IncrementUID							:= TRUE;
	ItemX.CurrentUID								:= ItemX.CurrentUID + 1;
	
	Internal.tempUID								:= 0;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID > Internal.tempUID THEN
			Internal.tempUID						:= ItemX.List[Internal.i].UID;
		END_IF;
	END_FOR;
	IF Internal.tempUID >= ItemX.CurrentUID THEN
		ItemX.CurrentUID							:= Internal.tempUID + 1;
	END_IF;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex								:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex							:= TRUE;
	END_IF;

END_FUNCTION
