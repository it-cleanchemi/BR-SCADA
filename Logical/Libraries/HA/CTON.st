
(* Mimic a TON block with a counter instead of a timestamp basis *)
FUNCTION_BLOCK CTON

	IF delta < 1 THEN
		RTInfo_0(enable := TRUE);
		delta := UDINT_TO_LREAL(RTInfo_0.cycle_time);
	END_IF;
	IF IN THEN
		IF (TIME_TO_LREAL(PT)*1000.0) <= (counter*delta) THEN
			Q := TRUE;
		ELSE
			IF NOT PAUSE THEN
				counter := counter + 1.0;				
			END_IF;
		END_IF;
		ET := LREAL_TO_TIME((counter*delta)/1000.0);
	ELSE
		counter := 0.0;
		Q := FALSE;
		ET := 0;
	END_IF;

END_FUNCTION_BLOCK
