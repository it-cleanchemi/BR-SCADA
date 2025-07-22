
ACTION Vis_Main_HR: 
	
	FOR IdxSkids_HR := 0 TO MAX_SKIDS_HR DO
		
		gSkid_HR[IdxSkids_HR].BufferTank.LI200P := (gSkid_HR[IdxSkids_HR].BufferTank.LI200 / BT_VOLUME)*100;
		
		// VISIBILITY TRIGGER SETTING
		
		IF gSkid_HR[IdxSkids_HR].BufferTank.LSHH200 > LSHH200_TRIGGER THEN
			gSkid_HR[IdxSkids_HR].VisBool.LSHH200 := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.LSHH200 := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_102.P102_LS > P102_LS_TRIGGER THEN
			gSkid_HR[IdxSkids_HR].VisBool.P102_LS := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P102_LS := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_103.P103_LS > P103_LS_TRIGGER THEN
			gSkid_HR[IdxSkids_HR].VisBool.P103_LS := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P103_LS := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_HR[IdxSkids_HR].VisBool.PMAX_MANUAL := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.PMAX_MANUAL := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_HOA = 0 OR gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_HOA = 8  THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_PPM := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_PPM := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_HOA = 0 OR gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_HOA = 8  THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_PPM := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_PPM := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_HOA = 0 OR gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_HOA = 8  THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_PPM := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_PPM := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_HOA = 0 OR gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_HOA = 8  THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_PPM := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_PPM := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_SP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_SP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_SP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_SP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_SP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_SP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_SP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_SP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_ENABLE_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_ENABLE_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_ENABLE_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_ENABLE_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_102.P102_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P102_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P102_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_102.P102_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P102_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P102_ALARM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_103.P103_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P103_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P103_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_103.P103_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P103_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P103_ALARM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_104.P104_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P104_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P104_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_Pump_104.P104_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P104_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P104_ALARM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_ALARM := 0;
		END_IF;		
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_ALARM := 0;
		END_IF;		
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_WARN > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_WARN := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_WARN := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_ALARM := 0;
		END_IF;	
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_ALARM > 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_ALARM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_ALARM := 0;
		END_IF;	
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_ADJ = 1 AND gSkid_HR[IdxSkids_HR].VisBool.P201_PPM = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_APPM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_APPM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_ADJ = 1 AND gSkid_HR[IdxSkids_HR].VisBool.P202_PPM = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_APPM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_APPM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_ADJ = 1 AND gSkid_HR[IdxSkids_HR].VisBool.P203_PPM = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_APPM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_APPM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_ADJ = 1 AND gSkid_HR[IdxSkids_HR].VisBool.P204_PPM = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_APPM := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_APPM := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI301_MODE = 0 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI301_MODE_OPP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI301_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI302_MODE = 0 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI302_MODE_OPP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI302_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI303_MODE = 0 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI303_MODE_OPP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI303_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI304_MODE = 0 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI304_MODE_OPP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI304_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI301_MODE = 1 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI301_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI301_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI302_MODE = 1 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI302_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI302_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI303_MODE = 1 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI303_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI303_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.FI304_MODE = 1 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.FI304_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.FI304_MODE := 0;
		END_IF;

		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV101 = 0 AND gSkid_HR[IdxSkids_HR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV101_OPP := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV101_OPP := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV101 = 1 AND gSkid_HR[IdxSkids_HR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV101 := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV101 := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV102 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV102_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV102_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV103 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV103_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV103_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV104 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV104_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV104_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV201 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV201_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV201_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV202 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV202_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV202_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV203 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV203_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV203_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Sensor_Variables.XV204 = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.XV204_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.XV204_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_PTYPE = 1 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_PTYPE_OPP := 0;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_PTYPE_OPP := 1;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_HR[IdxSkids_HR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P101_MODE := 1;
			gSkid_HR[IdxSkids_HR].VisBool.P102_MODE := 1;
			gSkid_HR[IdxSkids_HR].VisBool.P103_MODE := 1;
			gSkid_HR[IdxSkids_HR].VisBool.P104_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P101_MODE := 0;
			gSkid_HR[IdxSkids_HR].VisBool.P102_MODE := 0;
			gSkid_HR[IdxSkids_HR].VisBool.P103_MODE := 0;
			gSkid_HR[IdxSkids_HR].VisBool.P104_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_HR[IdxSkids_HR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P201_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P201_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_HR[IdxSkids_HR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P202_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P202_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_HR[IdxSkids_HR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P203_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P203_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_HR[IdxSkids_HR].Dosing_Pump_204.P204_HOA = 8 THEN
			gSkid_HR[IdxSkids_HR].VisBool.P204_MODE := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.P204_MODE := 0;
		END_IF;
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.UNIT_ID_DOSE = 0 THEN
			gSkid_HR[IdxSkids_HR].VisBool.IOSTATUS := 1;
		ELSE
			gSkid_HR[IdxSkids_HR].VisBool.IOSTATUS := 0;
		END_IF;
		
	END_FOR;

END_ACTION
