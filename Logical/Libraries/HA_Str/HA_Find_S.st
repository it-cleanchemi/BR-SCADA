
(* Returns Right index of substring, substring only returns result if found at START of buffer. Negative values are Errors. *)
FUNCTION HA_Find_S
	IF pBuffer = 0 OR pSearch = 0 THEN
		HA_Find_S	 						:= -2;
	ELSE
		Internal.sB							:= brsstrlen(pBuffer);
		Internal.sS							:= brsstrlen(pSearch);
		IF Internal.sB = 0 OR Internal.sB < Internal.sS THEN
		HA_Find_S	 						:= -3;
		END_IF;
	END_IF;
	IF HA_Find_S = 0 THEN
		HA_Find_S							:= -1;
		IF Internal.sS = 0 THEN
			HA_Find_S 						:= 0;
			RETURN;
		ELSE
			FOR Internal.i := 0 TO Internal.sB-Internal.sS DO
				IF brsmemcmp(pBuffer+Internal.i,pSearch,Internal.sS) = 0 THEN
					HA_Find_S 				:= Internal.i+Internal.sS;
					RETURN;
				ELSE
					RETURN;
				END_IF;
			END_FOR;
		END_IF;
	END_IF;
END_FUNCTION
