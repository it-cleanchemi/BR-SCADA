
ACTION Vis_Main_LR: 
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
		gSkid_LR[IdxSkids_LR].BufferTank.LI200P := (gSkid_LR[IdxSkids_LR].BufferTank.LI200 / BT_VOLUME)*100;
		
		gSkid_LR[IdxSkids_LR].VisBool.CD101_TARGETHI := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP + 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD101_TARGETLO := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP - 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD102_TARGETHI := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP + 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD102_TARGETLO := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP - 40;
		
		// VISIBILITY TRIGGER SETTING
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.HEARTBEAT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.HEARTBEAT := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.HEARTBEAT := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].BufferTank.LSHH200 > LSHH200_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.LSHH200 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.LSHH200 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_LS > P102_LS_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_LS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_LS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_LS > P103_LS_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_LS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_LS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_LR[IdxSkids_LR].VisBool.PMAX_MANUAL := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.PMAX_MANUAL := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_SP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_SP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_SP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDA := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_DME := 0;	
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDA := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_DME := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAGREEN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEGREEN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_WARN > 0 AND gSkid_LR[IdxSkids_LR].VisBool.P201_DME = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ALARM > 0 AND gSkid_LR[IdxSkids_LR].VisBool.P201_DME = 0  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_ALARM := 0;
		END_IF;		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_ALARM := 0;
		END_IF;		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_ALARM := 0;
		END_IF;	
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P201_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P202_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P203_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI301_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI302_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI303_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI301_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI302_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI303_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE := 0;
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 0 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 1 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV102 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV102_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV102_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV103 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV103_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV103_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV104 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV104_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV104_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV201 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV201_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV201_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV202 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV202_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV202_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV203 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV203_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV203_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_PTYPE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_PTYPE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P101_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P101_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Heartbeat.SYSTEM_OFFLINE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.IOSTATUS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.IOSTATUS := 0;
		END_IF;
		
	END_FOR;

END_ACTION
