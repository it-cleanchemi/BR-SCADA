
PROGRAM _INIT
	
	gVis;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		gSkid[IdxSkids].BufferTank.LI200P := (gSkid[IdxSkids].BufferTank.LI200 / BT_VOLUME)*100;
		
	END_FOR;

	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
