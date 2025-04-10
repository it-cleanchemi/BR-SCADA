
(* Dequeues the last index in an array to the output *)
FUNCTION HA_Array_Dequeue

	HA_Array_Dequeue := 0;
	brsmemset(ADR(emptyData), 0, SIZEOF(emptyData));
	
	//Validate input parameters
	IF pBuffer = 0 THEN
		HA_Array_Dequeue.0  := TRUE;
		HA_Array_Dequeue.15 := TRUE;
	END_IF
	
	IF sizeBuffer = 0 THEN
		HA_Array_Dequeue.1  := TRUE;
		HA_Array_Dequeue.15 := TRUE;		
	END_IF
	
	IF pElement = 0 THEN
		HA_Array_Dequeue.2  := TRUE;
		HA_Array_Dequeue.15 := TRUE;
	END_IF
	
	IF SizeElement = 0 THEN
		HA_Array_Dequeue.3  := TRUE;
		HA_Array_Dequeue.15 := TRUE;
	END_IF
	
	IF sizeBuffer MOD SizeElement <> 0 THEN
		HA_Array_Dequeue.4  := TRUE;
		HA_Array_Dequeue.15 := TRUE;
	END_IF
	
	IF SizeElement > HA_ARRAY_MAXELEMENTSIZE THEN
		HA_Array_Dequeue.5  := TRUE;
		HA_Array_Dequeue.15 := TRUE;
	END_IF
	
	//Everything passed we can go a head and peek
	IF HA_Array_Dequeue = 0 THEN
		FOR i:= (sizeBuffer / SizeElement) - 1 TO 0 BY -1 DO
			IF brsmemcmp(pBuffer + SizeElement*DINT_TO_UDINT(i), ADR(emptyData), SizeElement) <> 0 THEN
				//We found the first index
				brsmemcpy(pElement, pBuffer + SizeElement*DINT_TO_UDINT(i), SizeElement);
				brsmemset(pBuffer + SizeElement*DINT_TO_UDINT(i), 0, SizeElement);
				HA_Array_Dequeue := 1;
				EXIT;
			END_IF
		END_FOR
	END_IF

END_FUNCTION
