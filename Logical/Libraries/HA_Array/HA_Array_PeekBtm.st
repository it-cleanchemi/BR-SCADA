
(*Peeks at the bottom of the array without moving it.. cheeky monkey 
	Returns (-) number for error, 0 for nothing in array and 1 when it finds something*)
FUNCTION HA_Array_PeekBtm

	HA_Array_PeekBtm := 0;
	brsmemset(ADR(emptyData), 0, SIZEOF(emptyData));
	
	//Validate input parameters
	IF pBuffer = 0 THEN
		HA_Array_PeekBtm.0  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;
	END_IF
	
	IF sizeBuffer = 0 THEN
		HA_Array_PeekBtm.1  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;		
	END_IF
	
	IF pElement = 0 THEN
		HA_Array_PeekBtm.2  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;
	END_IF
	
	IF SizeElement = 0 THEN
		HA_Array_PeekBtm.3  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;
	END_IF
	
	IF sizeBuffer MOD SizeElement <> 0 THEN
		HA_Array_PeekBtm.4  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;
	END_IF
	
	IF SizeElement > HA_ARRAY_MAXELEMENTSIZE THEN
		HA_Array_PeekBtm.5  := TRUE;
		HA_Array_PeekBtm.15 := TRUE;
	END_IF
	
	//Everything passed we can go a head and peek
	IF HA_Array_PeekBtm = 0 THEN
		FOR i:= (sizeBuffer / SizeElement)-1 TO 0 BY -1 DO
			IF brsmemcmp(pBuffer + SizeElement*DINT_TO_UDINT(i), ADR(emptyData), SizeElement) <> 0 THEN
				//We found the first index
				brsmemcpy(pElement, pBuffer + SizeElement*DINT_TO_UDINT(i), SizeElement);
				HA_Array_PeekBtm := 1;
				EXIT;
			END_IF
		END_FOR
	END_IF

END_FUNCTION
