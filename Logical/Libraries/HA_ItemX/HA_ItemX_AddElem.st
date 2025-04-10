
(* Adds Elem to List, returns true if successful and changes index to where it was added *)
FUNCTION HA_ItemX_AddElem

	HA_ItemX_AddElem								:= FALSE;
	ItemX.ReturnedIndex								:= -1;
	FOR Internal.i := 0 TO MAX_ITEM_X_IDX DO
		IF ItemX.List[Internal.i].UID = 0 THEN
			HA_ItemX_AddElem						:= TRUE;
			ItemX.ReturnedIndex						:= Internal.i;
			HA_ItemX_IncrementUID(ItemX);
			ItemX.Elem.UID							:= ItemX.CurrentUID;
			ItemX.List[Internal.i]					:= ItemX.Elem;
			EXIT;
		END_IF;
	END_FOR;

	// This is here for keeping the ItemX structure up to date and should be at the bottom of every function call in the library
	ItemX.ValidIndex								:= FALSE;
	IF ItemX.ReturnedIndex >= 0 AND ItemX.ReturnedIndex <= MAX_ITEM_X_IDX THEN
		ItemX.ValidIndex							:= TRUE;
	END_IF;

END_FUNCTION
