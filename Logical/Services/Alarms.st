
ACTION Services_Alarms_action: 
//	
//		// Case for handling the alarm history
//	CASE gServices.Alarms_LR[IdxSkids_LR].Internal.StateExportHistory OF
//		0:
//			IF gServices.Alarms_LR[IdxSkids_LR].In.ExportHistory THEN
//				HA_AlarmX_Helper(gSkid_LR[IdxSkids_LR].AlarmX_MpLink,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY EXPORTED',FALSE);
//				gServices.Alarms_LR[IdxSkids_LR].In.ExportHistory 									:= FALSE;
//				gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0.Export 				:= TRUE;
//				gServices.Alarms_LR[IdxSkids_LR].Internal.StateExportHistory 						:= 10;
//			ELSIF gServices.Alarms_LR[IdxSkids_LR].In.ClearHistory THEN
//				HA_AlarmX_Helper(gSkid_LR[IdxSkids_LR].AlarmX_MpLink,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY CLEARED',FALSE);
//				gServices.Alarms_LR[IdxSkids_LR].In.ClearHistory 									:= FALSE;
//				MpAlarmXClearHistory(gAlarmXHistory);
//			END_IF;
//		10:
//			IF gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0.CommandDone OR gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0.Error THEN
//				gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0.Export 				:= FALSE;
//				gServices.Alarms_LR[IdxSkids_LR].Internal.StateExportHistory 						:= 0;
//			END_IF;
//	END_CASE;
//
//	//	IF gMain.ErrorReset THEN
//	//		gServices.Alarms_LR[IdxSkids_LR].In.ResetAlarms 											:= TRUE;
//	//	END_IF;
//	
//	// Case for handling the alarm resetting
//	CASE gServices.Alarms_LR[IdxSkids_LR].Internal.StateResetAlarms OF
//		0:
//			IF gServices.Alarms_LR[IdxSkids_LR].In.ResetAlarms OR gVis.Global.ErrorReset THEN
//				HA_AlarmX_Helper(gSkid_LR[IdxSkids_LR].AlarmX_MpLink,'',HA_ALARMX_ACTION_LOG_ONLY,'ACKNOWLEDGE ALL',FALSE);
//				gServices.Alarms_LR[IdxSkids_LR].In.ResetAlarms 									:= FALSE;
//				gVis.Alarms.Active.UIConnect.AcknowledgeAll 							:= TRUE;
//				gServices.Alarms_LR[IdxSkids_LR].Internal.CTON_ResetDelay(IN := FALSE);
//				gServices.Alarms_LR[IdxSkids_LR].Internal.StateResetAlarms 						:= 10;
//			END_IF;
//		10:
//			// give UI time to process the reset
//			IF gServices.Alarms_LR[IdxSkids_LR].Internal.CTON_ResetDelay.Q THEN
//				gServices.Alarms_LR[IdxSkids_LR].Internal.CTON_ResetDelay(IN := FALSE);
//				gServices.Alarms_LR[IdxSkids_LR].Internal.StateResetAlarms 						:= 0;
//				gVis.Global.ErrorReset := FALSE;
//			ELSE
//				gServices.Alarms_LR[IdxSkids_LR].Internal.CTON_ResetDelay(IN := TRUE, PT := T#250ms);
//			END_IF;
//	END_CASE;
//	
//	
//	FOR IdxSkids_HR := 0 TO MAX_SKIDS_HR DO
//		
//		//Reset only Selected Skid Alarms
//		IF gVis.Main.In.AckAllAlarms_Skid_HR[IdxSkids_HR] THEN
//			
//			FOR IdxAlarmsActive := 0 TO 49 DO
//				IF gVis.Alarms.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = gUnit_HR[IdxSkids_HR] THEN
//					MpAlarmXAcknowledgeID(gSkid_LR[IdxSkids_LR].AlarmX_MpLink,gVis.Alarms.Active.UIConnect.AlarmList.InstanceID[IdxAlarmsActive]);
//				ELSIF gVis.Alarms.Active.UIConnect.AlarmList.Code[IdxAlarmsActive] = 0 THEN
//					EXIT;
//				END_IF;
//			END_FOR;
//			
//			gVis.Main.In.AckAllAlarms_Skid_HR[IdxSkids_HR] := FALSE;
//			
//			gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay_HR[IdxSkids_HR].IN := TRUE;
//			
//		END_IF;
//		
//		IF gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay_HR[IdxSkids_HR].Q THEN
//			brsmemset(ADR(gServices.Alarms_LR[IdxSkids_LR].Internal.Alarms_State_HR[IdxSkids_HR]),0,SIZEOF(gServices.Alarms_LR[IdxSkids_LR].Internal.Alarms_State_HR[IdxSkids_HR]));
//			gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay_HR[IdxSkids_HR].IN := FALSE;
//		END_IF;
//		
//		gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay_HR[IdxSkids_HR](PT := T#15s);
//		
//	END_FOR;
//	
//

	
	IF gVis.Alarms_Global.Active.AckAll THEN

		gVis.Alarms_Global.Active.UIConnect.AcknowledgeAll := TRUE;			
		gVis.Alarms_Global.Active.AckAll := FALSE;
		
	END_IF;
	
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
		//		//Reset only Selected Skid Alarms
		IF gVis.Main.In.AckAllAlarms_Skid_LR[IdxSkids_LR] THEN

			gVis.Alarms_LR[IdxSkids_LR].Active.UIConnect.AcknowledgeAll := TRUE;			
			gVis.Main.In.AckAllAlarms_Skid_LR[IdxSkids_LR] := FALSE;
			
			gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay.IN := TRUE;
		END_IF;
		
		IF gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay.Q THEN
			brsmemset(ADR(gServices.Alarms_LR[IdxSkids_LR].Internal.Alarms_State),0,SIZEOF(gServices.Alarms_LR[IdxSkids_LR].Internal.Alarms_State));
			gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay.IN := FALSE;
		END_IF;
		
		gServices.Alarms_LR[IdxSkids_LR].Internal.Alarm_Set_Delay(PT := T#15s);
		
		gServices.Alarms_LR[IdxSkids_LR].Out.BufferInfo.Address	:= ADR(gServices.Alarms_LR[IdxSkids_LR].In.AlarmList);
		gServices.Alarms_LR[IdxSkids_LR].Out.BufferInfo.Size		:= SIZEOF(gServices.Alarms_LR[IdxSkids_LR].In.AlarmList);

	
		gServices.Alarms_LR[IdxSkids_LR].Internal.HA_AlarmXCore_0(MpLink := gSkid_LR[IdxSkids_LR].AlarmX_MpLink, enable := TRUE, pBuffer := ADR(gServices.Alarms_LR[IdxSkids_LR].In.AlarmList), pOutputData := ADR(gAlarmAddData));
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXCore_0(MpLink := ADR(gSkid_LR[IdxSkids_LR].AlarmX_MpLink), Enable := TRUE, ErrorReset := gErrorReset);
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXListUI_0(MpLink := ADR(gSkid_LR[IdxSkids_LR].AlarmX_MpLink), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms_LR[IdxSkids_LR].Active.UIConnect));
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset,DeviceName := ADR(gServices.DeviceName));
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms_LR[IdxSkids_LR].History.UIConnect));
		
		gVis.Alarms_LR[IdxSkids_LR].Active.UIConnect.AcknowledgeAll := FALSE;
	END_FOR	
	
	gServices.Alarms_Global.HA_AlarmXCore_0(MpLink := gAlarmXCore_Global, enable := TRUE, pBuffer := ADR(gServices.Alarms_Global.AlarmList), pOutputData := ADR(gAlarmAddData_Global));
	gServices.Alarms_Global.MpAlarmXCore_0(MpLink := ADR(gAlarmXCore_Global), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms_Global.MpAlarmXListUI_0(MpLink := ADR(gAlarmXCore_Global), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms_Global.Active.UIConnect));
	gServices.Alarms_Global.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset,DeviceName := ADR(gServices.DeviceName));
	gServices.Alarms_Global.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms_Global.History.UIConnect));
		
	gVis.Alarms_Global.Active.UIConnect.AcknowledgeAll := FALSE;
	

END_ACTION
