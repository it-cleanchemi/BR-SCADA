
(* Adds the first index of an array *)
FUNCTION HA_Array_AddTop
	
	HA_Array_AddTop := 0;
	
	//Input Error Checking
	IF 	pBuffer = 0 THEN
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.0  := 1;	
	END_IF
	
	IF pElement = 0 THEN 
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.1  := 1;	
	END_IF
	
	IF SizeBuffer = 0 THEN
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.2  := 1;	
	END_IF
	
	IF SizeElement = 0 THEN
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.3  := 1;	
	END_IF
	
	IF SizeBuffer < SizeElement * 2 THEN 
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.4  := 1;	
	END_IF
	
	IF SizeBuffer MOD SizeElement <> 0 THEN	
		HA_Array_AddTop.15 := 1;
		HA_Array_AddTop.5  := 1;	
	END_IF
	
	IF HA_Array_AddTop = 0 THEN
		//Everything passed we can go to work
		brsmemmove(pBuffer + SizeElement, pBuffer, SizeBuffer - SizeElement);
		brsmemcpy(pBuffer, pElement, SizeElement);
	END_IF
	
END_FUNCTION
