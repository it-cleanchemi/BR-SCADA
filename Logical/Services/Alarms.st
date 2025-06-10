
ACTION Services_Alarms_action: 
	
		// Case for handling the alarm history
	CASE gServices.Alarms.Internal.StateExportHistory OF
		0:
			IF gServices.Alarms.In.ExportHistory THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY EXPORTED',FALSE);
				gServices.Alarms.In.ExportHistory 									:= FALSE;
				gServices.Alarms.Internal.MpAlarmXHistory_0.Export 				:= TRUE;
				gServices.Alarms.Internal.StateExportHistory 						:= 10;
			ELSIF gServices.Alarms.In.ClearHistory THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY CLEARED',FALSE);
				gServices.Alarms.In.ClearHistory 									:= FALSE;
				MpAlarmXClearHistory(gAlarmXHistory);
			END_IF;
		10:
			IF gServices.Alarms.Internal.MpAlarmXHistory_0.CommandDone OR gServices.Alarms.Internal.MpAlarmXHistory_0.Error THEN
				gServices.Alarms.Internal.MpAlarmXHistory_0.Export 				:= FALSE;
				gServices.Alarms.Internal.StateExportHistory 						:= 0;
			END_IF;
	END_CASE;

	//	IF gMain.ErrorReset THEN
	//		gServices.Alarms.In.ResetAlarms 											:= TRUE;
	//	END_IF;
	
	// Case for handling the alarm resetting
	CASE gServices.Alarms.Internal.StateResetAlarms OF
		0:
			IF gServices.Alarms.In.ResetAlarms OR gVis.Global.ErrorReset THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'ACKNOWLEDGE ALL',FALSE);
				gServices.Alarms.In.ResetAlarms 									:= FALSE;
				gVis.Alarms.Active.UIConnect.AcknowledgeAll 							:= TRUE;
				gServices.Alarms.Internal.CTON_ResetDelay(IN := FALSE);
				gServices.Alarms.Internal.StateResetAlarms 						:= 10;
			END_IF;
		10:
			// give UI time to process the reset
			IF gServices.Alarms.Internal.CTON_ResetDelay.Q THEN
				gServices.Alarms.Internal.CTON_ResetDelay(IN := FALSE);
				gServices.Alarms.Internal.StateResetAlarms 						:= 0;
				gVis.Global.ErrorReset := FALSE;
			ELSE
				gServices.Alarms.Internal.CTON_ResetDelay(IN := TRUE, PT := T#250ms);
			END_IF;
	END_CASE;
	
	
	FOR IdxSkids_HR := 0 TO MAX_SKIDS DO
		
		//Reset only Selected Skid Alarms
		IF gVis.Main.In.AckAllAlarms_Skid[IdxSkids_HR] THEN
			
			FOR IdxAlarmsActive := 0 TO 49 DO
				IF gVis.Alarms_HR.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = gUnit[IdxSkids_HR] THEN
					MpAlarmXAcknowledgeID(gAlarmXCore,gVis.Alarms_HR.Active.UIConnect.AlarmList.InstanceID[IdxAlarmsActive]);
				ELSIF gVis.Alarms_HR.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = 0 THEN
					EXIT;
				END_IF;
			END_FOR;
			
			gVis.Main.In.AckAllAlarms_Skid[IdxSkids_HR] := FALSE;
			
			gServices.Alarms.Internal.Alarm_Set_Delay[IdxSkids_HR].IN := TRUE;
			
		END_IF;
		
		IF gServices.Alarms.Internal.Alarm_Set_Delay[IdxSkids_HR].Q THEN
			brsmemset(ADR(gServices.Alarms.Internal.Alarms_State[IdxSkids_HR]),0,SIZEOF(gServices.Alarms.Internal.Alarms_State[IdxSkids_HR]));
			gServices.Alarms.Internal.Alarm_Set_Delay[IdxSkids_HR].IN := FALSE;
		END_IF;
		
		gServices.Alarms.Internal.Alarm_Set_Delay[IdxSkids_HR](PT := T#15s);
		
	END_FOR;
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS DO
		
		//Reset only Selected Skid Alarms
		IF gVis.Main.In.AckAllAlarms_Skid[IdxSkids_LR] THEN
			
			FOR IdxAlarmsActive := 0 TO 49 DO
				IF gVis.Alarms_LR.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = gUnit[IdxSkids_LR] THEN
					MpAlarmXAcknowledgeID(gAlarmXCore,gVis.Alarms_LR.Active.UIConnect.AlarmList.InstanceID[IdxAlarmsActive]);
				ELSIF gVis.Alarms_LR.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = 0 THEN
					EXIT;
				END_IF;
			END_FOR;
			
			gVis.Main.In.AckAllAlarms_Skid[IdxSkids_LR] := FALSE;
			
			gServices_LR.Alarms.Internal.Alarm_Set_Delay[IdxSkids_LR].IN := TRUE;
			
		END_IF;
		
		IF gServices_LR.Alarms.Internal.Alarm_Set_Delay[IdxSkids_LR].Q THEN
			brsmemset(ADR(gServices_LR.Alarms.Internal.Alarms_State[IdxSkids_LR]),0,SIZEOF(gServices_LR.Alarms.Internal.Alarms_State[IdxSkids_LR]));
			gServices_LR.Alarms.Internal.Alarm_Set_Delay[IdxSkids_LR].IN := FALSE;
		END_IF;
		
		gServices_LR.Alarms.Internal.Alarm_Set_Delay[IdxSkids_LR](PT := T#15s);
		
	END_FOR;
	
	
	gServices.Alarms.Out.BufferInfo.Address	:= ADR(gServices.Alarms.In.AlarmList);
	gServices.Alarms.Out.BufferInfo.Size		:= SIZEOF(gServices.Alarms.In.AlarmList);

	
	gServices.Alarms.Internal.HA_AlarmXCore_0(MpLink := gAlarmXCore, enable := TRUE, pBuffer := ADR(gServices.Alarms.In.AlarmList), pOutputData := ADR(gAlarmAddData));
	gServices.Alarms.Internal.MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms.Internal.MpAlarmXListUI_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.Active.UIConnect));
	gServices.Alarms.Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset,DeviceName := ADR(gServices.DeviceName));
	gServices.Alarms.Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.History.UIConnect));
	

END_ACTION
