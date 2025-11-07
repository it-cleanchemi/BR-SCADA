

PROGRAM _INIT

	//FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
	//	gSkid_LR[IdxSkids_LR].Notes.LOCATION := NOTES_LR[IdxSkids_LR]; 
	//END_FOR;	
	
	IF DiagCpuIsARsim() OR DiagCpuIsSimulated() THEN
		gServices.DeviceName := 'USER_DEVICE_SIM';
	ELSE
		gServices.DeviceName :=  'USER_DEVICE';
	END_IF;
	
	//gServices.Alarms.Internal.MpAlarmXListUI_0.UISetup.AlarmListSize	:= 50;
	
	gSkid_LR[0].AlarmX_MpLink := gAlarmXCore_LR_0;
	gSkid_LR[1].AlarmX_MpLink := gAlarmXCore_LR_1;
	gSkid_LR[2].AlarmX_MpLink := gAlarmXCore_LR_2;
	gSkid_LR[3].AlarmX_MpLink := gAlarmXCore_LR_3;
	gSkid_LR[4].AlarmX_MpLink := gAlarmXCore_LR_4;
	gSkid_LR[5].AlarmX_MpLink := gAlarmXCore_LR_5;
	gSkid_LR[6].AlarmX_MpLink := gAlarmXCore_LR_6;
	gSkid_LR[7].AlarmX_MpLink := gAlarmXCore_LR_7;
	gSkid_LR[8].AlarmX_MpLink := gAlarmXCore_LR_8;
	gSkid_LR[9].AlarmX_MpLink := gAlarmXCore_LR_9;
	gSkid_LR[10].AlarmX_MpLink := gAlarmXCore_LR_10;
	gSkid_LR[11].AlarmX_MpLink := gAlarmXCore_LR_11;
	gSkid_LR[12].AlarmX_MpLink := gAlarmXCore_LR_12;
	gSkid_LR[13].AlarmX_MpLink := gAlarmXCore_LR_13;
	gSkid_LR[14].AlarmX_MpLink := gAlarmXCore_LR_14;
	gSkid_LR[15].AlarmX_MpLink := gAlarmXCore_LR_15;
	gSkid_LR[16].AlarmX_MpLink := gAlarmXCore_LR_16;
	gSkid_LR[17].AlarmX_MpLink := gAlarmXCore_LR_17;
	gSkid_LR[18].AlarmX_MpLink := gAlarmXCore_LR_18;
	gSkid_LR[19].AlarmX_MpLink := gAlarmXCore_LR_19;
	gSkid_LR[20].AlarmX_MpLink := gAlarmXCore_LR_20;
	gSkid_LR[21].AlarmX_MpLink := gAlarmXCore_LR_21;
//	gSkid_LR[22].AlarmX_MpLink := gAlarmXCore_LR_22;
//	gSkid_LR[23].AlarmX_MpLink := gAlarmXCore_LR_23;
//	gSkid_LR[24].AlarmX_MpLink := gAlarmXCore_LR_24;
//	gSkid_LR[25].AlarmX_MpLink := gAlarmXCore_LR_25;
	
	gSkid_LR[0].AlarmXHistory_MpLink := gAlarmXHistory_LR_0;
	gSkid_LR[1].AlarmXHistory_MpLink := gAlarmXHistory_LR_1;
	gSkid_LR[2].AlarmXHistory_MpLink := gAlarmXHistory_LR_2;
	gSkid_LR[3].AlarmXHistory_MpLink := gAlarmXHistory_LR_3;
	gSkid_LR[4].AlarmXHistory_MpLink := gAlarmXHistory_LR_4;
	gSkid_LR[5].AlarmXHistory_MpLink := gAlarmXHistory_LR_5;
	gSkid_LR[6].AlarmXHistory_MpLink := gAlarmXHistory_LR_6;
	gSkid_LR[7].AlarmXHistory_MpLink := gAlarmXHistory_LR_7;
	gSkid_LR[8].AlarmXHistory_MpLink := gAlarmXHistory_LR_8;
	gSkid_LR[9].AlarmXHistory_MpLink := gAlarmXHistory_LR_9;
	gSkid_LR[10].AlarmXHistory_MpLink := gAlarmXHistory_LR_10;
	gSkid_LR[11].AlarmXHistory_MpLink := gAlarmXHistory_LR_11;
	gSkid_LR[12].AlarmXHistory_MpLink := gAlarmXHistory_LR_12;
	gSkid_LR[13].AlarmXHistory_MpLink := gAlarmXHistory_LR_13;
	gSkid_LR[14].AlarmXHistory_MpLink := gAlarmXHistory_LR_14;
	gSkid_LR[15].AlarmXHistory_MpLink := gAlarmXHistory_LR_15;
	gSkid_LR[16].AlarmXHistory_MpLink := gAlarmXHistory_LR_16;
	gSkid_LR[17].AlarmXHistory_MpLink := gAlarmXHistory_LR_17;
	gSkid_LR[18].AlarmXHistory_MpLink := gAlarmXHistory_LR_18;
	gSkid_LR[19].AlarmXHistory_MpLink := gAlarmXHistory_LR_19;
	gSkid_LR[20].AlarmXHistory_MpLink := gAlarmXHistory_LR_20;
	gSkid_LR[21].AlarmXHistory_MpLink := gAlarmXHistory_LR_21;
	//	gSkid_LR[22].AlarmXHistory_MpLink := gAlarmXHistory_LR_22;
	//	gSkid_LR[23].AlarmXHistory_MpLink := gAlarmXHistory_LR_23;
	//	gSkid_LR[24].AlarmXHistory_MpLink := gAlarmXHistory_LR_24;
	//	gSkid_LR[25].AlarmXHistory_MpLink := gAlarmXHistory_LR_25;
	
	gSkid_HR[0].AlarmX_MpLink := gAlarmXCore_HR_0;
	
END_PROGRAM