
PROGRAM _INIT

END_PROGRAM

PROGRAM _CYCLIC
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		gSkid[IdxSkids].BufferTank.LI200P := (gSkid[IdxSkids].BufferTank.LI200 / BT_VOLUME)*100;
		
		// VISIBILITY TRIGGER SETTING. NEEDS TO BE MOVED TO VIS PROGRAM AT SOME POINT
		
		IF gSkid[IdxSkids].BufferTank.LSHH200 > LSHH200_TRIGGER THEN
			gSkid[IdxSkids].VisBool.LSHH200 := 1;
		ELSE
			gSkid[IdxSkids].VisBool.LSHH200 := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_102.P102_LS > P102_LS_TRIGGER THEN
			gSkid[IdxSkids].VisBool.P102_LS := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P102_LS := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_103.P103_LS > P103_LS_TRIGGER THEN
			gSkid[IdxSkids].VisBool.P103_LS := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P103_LS := 0;
		END_IF;
		
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
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_PTYPE = 0 THEN
			gSkid[IdxSkids].VisBool.P201_DDA := 1;
			gSkid[IdxSkids].VisBool.P201_DME := 0;	
		ELSE
			gSkid[IdxSkids].VisBool.P201_DDA := 0;
			gSkid[IdxSkids].VisBool.P201_DME := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_PTYPE = 0 AND gSkid[IdxSkids].Dosing_Pump_201.P201_XS = 1 THEN
			gSkid[IdxSkids].VisBool.P201_DDAGREEN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_DDAGREEN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_PTYPE = 1 AND gSkid[IdxSkids].Dosing_Pump_201.P201_XS = 1 THEN
			gSkid[IdxSkids].VisBool.P201_DMEGREEN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_DMEGREEN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_ENABLE = 1 THEN
			gSkid[IdxSkids].VisBool.P201_ENABLE_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P201_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_ENABLE = 1 THEN
			gSkid[IdxSkids].VisBool.P202_ENABLE_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P202_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_ENABLE = 1 THEN
			gSkid[IdxSkids].VisBool.P203_ENABLE_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P203_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_102.P102_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P102_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P102_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_102.P102_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P102_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P102_ALARM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_103.P103_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P103_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P103_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_103.P103_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P103_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P103_ALARM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_104.P104_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P104_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P104_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Pmax_Pump_104.P104_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P104_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P104_ALARM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P201_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P201_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_ALARM := 0;
		END_IF;		
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P202_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P202_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P202_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P202_ALARM := 0;
		END_IF;		
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_WARN > 0 THEN
			gSkid[IdxSkids].VisBool.P203_WARN := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P203_WARN := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_ALARM > 0 THEN
			gSkid[IdxSkids].VisBool.P203_ALARM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P203_ALARM := 0;
		END_IF;	
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_ADJ = 1 AND gSkid[IdxSkids].VisBool.P201_PPM = 1 THEN
			gSkid[IdxSkids].VisBool.P201_APPM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P201_APPM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_202.P202_ADJ = 1 AND gSkid[IdxSkids].VisBool.P202_PPM = 1 THEN
			gSkid[IdxSkids].VisBool.P202_APPM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P202_APPM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_203.P203_ADJ = 1 AND gSkid[IdxSkids].VisBool.P203_PPM = 1 THEN
			gSkid[IdxSkids].VisBool.P203_APPM := 1;
		ELSE
			gSkid[IdxSkids].VisBool.P203_APPM := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI301_MODE = 0 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI301_MODE_OPP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI301_MODE_OPP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI302_MODE = 0 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI302_MODE_OPP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI302_MODE_OPP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI303_MODE = 0 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI303_MODE_OPP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI303_MODE_OPP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI301_MODE = 1 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI301_MODE := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI301_MODE := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI302_MODE = 1 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI302_MODE := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI302_MODE := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.FI303_MODE = 1 AND gSkid[IdxSkids].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid[IdxSkids].VisBool.FI303_MODE := 1;
		ELSE
			gSkid[IdxSkids].VisBool.FI303_MODE := 0;
		END_IF;

		IF gSkid[IdxSkids].Sensor_Variables.XV101 = 0 AND gSkid[IdxSkids].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid[IdxSkids].VisBool.XV101_OPP := 1;
		ELSE
			gSkid[IdxSkids].VisBool.XV101_OPP := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV101 = 1 AND gSkid[IdxSkids].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid[IdxSkids].VisBool.XV101 := 1;
		ELSE
			gSkid[IdxSkids].VisBool.XV101 := 0;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV102 = 1 THEN
			gSkid[IdxSkids].VisBool.XV102_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV102_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV103 = 1 THEN
			gSkid[IdxSkids].VisBool.XV103_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV103_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV104 = 1 THEN
			gSkid[IdxSkids].VisBool.XV104_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV104_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV201 = 1 THEN
			gSkid[IdxSkids].VisBool.XV201_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV201_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV202 = 1 THEN
			gSkid[IdxSkids].VisBool.XV202_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV202_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Sensor_Variables.XV203 = 1 THEN
			gSkid[IdxSkids].VisBool.XV203_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.XV203_OPP := 1;
		END_IF;
		
		IF gSkid[IdxSkids].Dosing_Pump_201.P201_PTYPE = 1 THEN
			gSkid[IdxSkids].VisBool.P201_PTYPE_OPP := 0;
		ELSE
			gSkid[IdxSkids].VisBool.P201_PTYPE_OPP := 1;
		END_IF;
		
	END_FOR;

	API_Calls_Action;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
