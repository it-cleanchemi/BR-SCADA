
(* TODO: Add your comment here *)
FUNCTION IDEC_String
	
	FOR i := 0 TO SizeSrc BY 4 DO
		brsmemcpy(pDest+(j+1),pSrc+i,1);
		brsmemcpy(pDest+j,pSrc+(i+1),1);
		j := j+2;
	END_FOR;
	
	
END_FUNCTION
