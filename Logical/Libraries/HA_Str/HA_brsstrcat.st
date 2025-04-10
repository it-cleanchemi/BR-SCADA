
(* Checks the memory area before concatenating to prevent overrun. Returns false and doesnt concat if overrun is detected *)
FUNCTION HA_brsstrcat
	HA_brsstrcat 						:= TRUE;
	IF pSrc = 0 OR pDest = 0 OR DestSize = 0 THEN
		HA_brsstrcat 					:= FALSE;
	ELSE
		HA_brsstrcat					:= TRUE;
		brsmemset(ADR(Internal),0,SIZEOF(Internal));
		Internal.SrcSize := brsstrlen(pSrc);
		Internal.DestSize := brsstrlen(pDest);
		IF (Internal.SrcSize+Internal.DestSize) <= DestSize-1 THEN
			brsstrcat(pDest,pSrc);
		ELSE
			HA_brsstrcat				:= FALSE;
		END_IF;
	END_IF;
END_FUNCTION
