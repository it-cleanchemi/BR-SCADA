
(* Reorders the array to be from low to high in terms of UID, 0 elements left at the end of the array *)
FUNCTION HA_ItemX_Reorder_LowToHighUID
	HA_ItemX_Reorder_LowToHighUID					:= TRUE;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		// Find Next Lowest Index
		Internal.tempIndex							:= Internal.i;
		IF ItemX.List[Internal.tempIndex].UID = 0 THEN
			Internal.tempUID						:= 4294967295; // Set to UDINT max
		ELSE
			Internal.tempUID						:= ItemX.List[Internal.tempIndex].UID;
		END_IF;
		FOR Internal.j := Internal.i TO MAX_ITEM_X_IDX DO
			IF ItemX.List[Internal.j].UID < Internal.tempUID AND ItemX.List[Internal.j].UID > 0 THEN
				Internal.tempIndex					:= Internal.j;
				Internal.tempUID					:= ItemX.List[Internal.tempIndex].UID;
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
