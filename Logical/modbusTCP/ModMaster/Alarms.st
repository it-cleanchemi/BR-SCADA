
ACTION Alarms_action: 
	
	//SP Alarm

	
	//Error Collection

	IF gSkid[IdxSkids].Dosing_Alarms.DOSE_ALARM.0 THEN
		gSkid[IdxSkids].ErrorInfo.Text		:= 'DoseAlarm0';
		gSkid[IdxSkids].ErrorInfo.State		:= 'Error';
		gSkid[IdxSkids].ErrorInfo.Severity	:= 1;
		gSkid[IdxSkids].Error := TRUE;
	END_IF;
	
	IF gSkid[IdxSkids].Dosing_Alarms.DOSE_ALARM.1 THEN
		gSkid[IdxSkids].ErrorInfo.Text		:= 'DoseAlarm1';
		gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
		gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
		gSkid[IdxSkids].Error := TRUE;
	END_IF;
	
	IF gSkid[IdxSkids].Dosing_Alarms.DOSE_ALARM.2 THEN
		gSkid[IdxSkids].ErrorInfo.Text		:= 'DoseAlarm2';
		gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
		gSkid[IdxSkids].ErrorInfo.Severity	:= 1;
		gSkid[IdxSkids].Error := TRUE;
	END_IF;


(*********************************************************************Dont Touch This Code*(*********************************************************************)
	IF gSkid[IdxSkids].Error THEN
		IF brsmemcmp(ADR(gSkid[IdxSkids].LastErrorInfo),ADR(gSkid[IdxSkids].ErrorInfo),SIZEOF(gSkid[IdxSkids].LastErrorInfo)) <> 0 THEN
			brsmemcpy(ADR(gSkid[IdxSkids].LastErrorInfo),ADR(gSkid[IdxSkids].ErrorInfo),SIZEOF(gSkid[IdxSkids].LastErrorInfo));
			
			CASE gSkid[IdxSkids].ErrorInfo.Severity OF
				1:
					gSkid[IdxSkids].tempAlarm.name				:= INT_TO_STRING(IdxSkids+1);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity1');
					gSkid[IdxSkids].tempAlarm.allowMultiple		:= FALSE;
					gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
					gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
					HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
				2:
					gSkid[IdxSkids].tempAlarm.name				:= INT_TO_STRING(IdxSkids+1);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity2');
					gSkid[IdxSkids].tempAlarm.allowMultiple		:= FALSE;
					gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
					gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
					HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
				3:
					gSkid[IdxSkids].tempAlarm.name				:= INT_TO_STRING(IdxSkids+1);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity3');
					gSkid[IdxSkids].tempAlarm.allowMultiple		:= FALSE;
					gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
					gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
					HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
				4:
					gSkid[IdxSkids].tempAlarm.name				:= INT_TO_STRING(IdxSkids+1);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity4');
					gSkid[IdxSkids].tempAlarm.allowMultiple		:= FALSE;
					gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
					gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
					HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
				5:
		  
					gSkid[IdxSkids].tempAlarm.name				:= INT_TO_STRING(IdxSkids+1);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
					gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity5');
					gSkid[IdxSkids].tempAlarm.allowMultiple		:= FALSE;
					gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
					gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
					HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
			END_CASE;
		
			
		END_IF
	ELSE
		brsmemset(ADR(gSkid[IdxSkids].LastErrorInfo),0,SIZEOF(gSkid[IdxSkids].LastErrorInfo));
	END_IF
	
	
	gServices.Alarms.Out.BufferInfo.Address	:= ADR(gServices.Alarms.In.AlarmList);
	gServices.Alarms.Out.BufferInfo.Size		:= SIZEOF(gServices.Alarms.In.AlarmList);

	gServices.Alarms.Internal.HA_AlarmXCore_0(MpLink := gAlarmXCore, enable := TRUE, pBuffer := ADR(gServices.Alarms.In.AlarmList), pOutputData := ADR(gAlarmAddData));
	gServices.Alarms.Internal.MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms.Internal.MpAlarmXListUI_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.Active.UIConnect));
	gServices.Alarms.Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms.Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.History.UIConnect));
	
END_ACTION
