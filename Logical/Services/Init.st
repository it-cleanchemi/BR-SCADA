

PROGRAM _INIT
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
	
	gSkid_HR[0].AlarmX_MpLink := gAlarmXCore_HR_0;
	
END_PROGRAM