
(* Peeks at the top index of an array without removing it *)
FUNCTION HA_Array_PeekTop

	HA_Array_PeekTop := 0;
	brsmemset(ADR(emptyData), 0, SIZEOF(emptyData));
	
	//Validate input parameters
	IF pBuffer = 0 THEN
		HA_Array_PeekTop.0  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	IF sizeBuffer = 0 THEN
		HA_Array_PeekTop.1  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	IF pElement = 0 THEN
		HA_Array_PeekTop.2  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	IF SizeElement = 0 THEN
		HA_Array_PeekTop.3  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	IF sizeBuffer MOD SizeElement <> 0 THEN
		HA_Array_PeekTop.4  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	IF SizeElement > HA_ARRAY_MAXELEMENTSIZE THEN
		HA_Array_PeekTop.5  := TRUE;
		HA_Array_PeekTop.15 := TRUE;
	END_IF
	
	//Everything passed we can go a head and peek
	IF HA_Array_PeekTop = 0 THEN
		FOR i:=0 TO (sizeBuffer / SizeElement)-1 DO
			IF brsmemcmp(pBuffer + SizeElement*i, ADR(emptyData), SizeElement) <> 0 THEN
				//We found the first index
				brsmemcpy(pElement, pBuffer + SizeElement*i, SizeElement);
				HA_Array_PeekTop := 1;
				EXIT;
			END_IF
		END_FOR
	END_IF
	
END_FUNCTION
