
PROGRAM _INIT

END_PROGRAM

PROGRAM _CYCLIC
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		gSkid[IdxSkids].BufferTank.LI200P := (gSkid[IdxSkids].BufferTank.LI200 / BT_VOLUME)*100;
		
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
		
		//Reset only Selected Skid Alarms
		IF gVis.Main.In.AckAllAlarms_Skid[IdxSkids] THEN
			
			
		
			FOR IdxAlarmsActive := 0 TO 49 DO
				IF gVis.Alarms.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = gUnit[IdxSkids] THEN
					MpAlarmXAcknowledgeID(gAlarmXCore,gVis.Alarms.Active.UIConnect.AlarmList.InstanceID[IdxAlarmsActive]);
				ELSIF gVis.Alarms.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = 0 THEN
					EXIT;
				END_IF;
			END_FOR;
		
			brsmemset(ADR(gServices.Alarms.Internal.Alarms_State[IdxSkids]),0,SIZEOF(gServices.Alarms.Internal.Alarms_State[IdxSkids]));
			
			gVis.Main.In.AckAllAlarms_Skid[IdxSkids] := FALSE;
		END_IF;
		
		
	END_FOR;

	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
