
PROGRAM _INIT
	
	gVis;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		gSkid[IdxSkids].BufferTank.LI200P := (gSkid[IdxSkids].BufferTank.LI200 / BT_VOLUME)*100;
		
		
		
		
		
		
		
		IF gSkid[IdxSkids].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid[IdxSkids].VisBool.PMAX_MANUAL := 1;
		ELSE
			gSkid[IdxSkids].VisBool.PMAX_MANUAL := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_HOA = 0 OR gSkid[IdxSkids].Dosing_Pump_201.P201_HOA = 8  THEN
			gSkid[IdxSkids].VisBool.P201_PPM := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P201_PPM := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_HOA = 0 OR gSkid[IdxSkids].Dosing_Pump_202.P202_HOA = 8  THEN
			gSkid[IdxSkids].VisBool.P202_PPM := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P202_PPM := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_HOA = 0 OR gSkid[IdxSkids].Dosing_Pump_203.P203_HOA = 8  THEN
			gSkid[IdxSkids].VisBool.P203_PPM := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P203_PPM := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid[IdxSkids].VisBool.P201_SP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_SP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid[IdxSkids].VisBool.P202_SP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P202_SP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid[IdxSkids].VisBool.P203_SP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P203_SP := 0;
		END_IF;
		
		
		
		
		
		
		
	END_FOR;

	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
