
(* Reorders the array to be from high to low in terms of UID *)
FUNCTION HA_ItemX_Reorder_HighToLowUID
	HA_ItemX_Reorder_HighToLowUID					:= TRUE;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		// Find Next Highest Index
		Internal.tempIndex							:= Internal.i;
		FOR Internal.j := Internal.i TO MAX_ITEM_X_IDX DO
			IF ItemX.List[Internal.j].UID > ItemX.List[Internal.tempIndex].UID THEN
				Internal.tempIndex					:= Internal.j;
			END_IF;
		END_FOR;
		// Swap ItemXs
		Internal.tempItemX							:= ItemX.List[Internal.i];
		ItemX.List[Internal.i]						:= ItemX.List[Internal.tempIndex];
		ItemX.List[Internal.tempIndex]				:= Internal.tempItemX;
		IF ItemX.List[Internal.i].UID = 0 THEN
			ItemX.ReturnedIndex 						:= Internal.i;
			EXIT;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex									:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex								:= TRUE;
	END_IF;

END_FUNCTION
