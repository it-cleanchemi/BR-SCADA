
PROGRAM _INIT
	gIO;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR IdxSkid := 0 TO MAX_SKIDS DO
		
	  	gSkid_General[IdxSkid].Start := gCmd[IdxSkid].Start;

	END_FOR;

	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

