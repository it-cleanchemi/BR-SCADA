
(* Negative values are Errors. *)
FUNCTION HA_Find_Extract
	IF pBuffer = 0 OR pSearchL = 0 OR pSearchR = 0 OR pExtractADR = 0 OR pExtractSIZEOF = 0 THEN
		HA_Find_Extract 						:= -2;
	ELSE
		Internal.sB								:= brsstrlen(pBuffer);
		Internal.sSL							:= brsstrlen(pSearchL);
		Internal.sSR							:= brsstrlen(pSearchR);
		IF Internal.sB = 0 OR Internal.sB < (Internal.sSL + Internal.sSR + 1) THEN
			HA_Find_Extract 					:= -3;
		END_IF;
	END_IF;
	IF HA_Find_Extract = 0 THEN
		HA_Find_Extract							:= -1;
		Internal.P1 							:= HA_Find_R(pBuffer,pSearchL);
		IF Internal.P1 >= 0 THEN
			Internal.P2 						:= HA_Find_L(pBuffer+Internal.P1,pSearchR);
			IF Internal.P2 >= 0 THEN
				Internal.Pos 					:= Internal.P1 + pBuffer;
				Internal.Len 					:= DINT_TO_UDINT(Internal.P2);
				brsmemcpy(pExtractADR,ADR(Internal.Pos),4);
				brsmemcpy(pExtractSIZEOF,ADR(Internal.Len),4);
				HA_Find_Extract					:= Internal.P1+Internal.P2+Internal.sSR;
			END_IF;
		END_IF;
	END_IF;
END_FUNCTION
