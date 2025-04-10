
(* TODO: Actually make this work *)
FUNCTION HA_Array_Pack

	HA_Array_Pack := 0;
	brsmemset(ADR(emptyData), 0, SIZEOF(emptyData));
	
	//Validate input parameters
	IF pBuffer = 0 THEN
		HA_Array_Pack.0  := TRUE;
		HA_Array_Pack.15 := TRUE;
	END_IF
	
	IF sizeBuffer = 0 THEN
		HA_Array_Pack.1  := TRUE;
		HA_Array_Pack.15 := TRUE;		
	END_IF
	
	IF HA_Array_Pack = 0 THEN
		FOR i:= (sizeBuffer / SizeElement) TO 1 BY -1 DO
			IF brsmemcmp(pBuffer + SizeElement*i, ADR(emptyData), SizeElement) = 0 THEN
				IF dataFound <> 0 THEN
					brsmemmove(pBuffer + SizeElement*i, pBuffer + SizeElement*(i+1), dataFound*SizeElement);
				END_IF
			ELSE
				dataFound := dataFound + 1;
			END_IF
		END_FOR
	END_IF


END_FUNCTION
