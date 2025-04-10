
(* Modifies Elem in List without changing UID, returns true if successful *)
FUNCTION HA_ItemX_ModElemByUID

	HA_ItemX_ModElemByUID							:= FALSE;
	ItemX.ReturnedIndex								:= -1;

	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID = UID THEN
			ItemX.Elem.UID							:= UID;
			ItemX.List[Internal.i]					:= ItemX.Elem;
			ItemX.List[Internal.i].UID 				:= UID;
			ItemX.ReturnedIndex						:= Internal.i;
			HA_ItemX_ModElemByUID					:= TRUE;
			EXIT;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex								:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex							:= TRUE;
	END_IF;

END_FUNCTION
