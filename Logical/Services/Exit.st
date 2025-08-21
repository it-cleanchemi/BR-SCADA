

PROGRAM _EXIT
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXCore_0(MpLink := ADR(gSkid_LR[IdxSkids_LR].AlarmX_MpLink), Enable := FALSE);
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXListUI_0(MpLink := ADR(gSkid_LR[IdxSkids_LR].AlarmX_MpLink), Enable := FALSE);
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
		gServices.Alarms_LR[IdxSkids_LR].Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
	END_FOR;

	FOR IdxSkids_HR := 0 TO MAX_SKIDS_HR DO
		gServices.Alarms_HR[IdxSkids_HR].Internal.MpAlarmXCore_0(MpLink := ADR(gSkid_HR[IdxSkids_HR].AlarmX_MpLink), Enable := FALSE);
		gServices.Alarms_HR[IdxSkids_HR].Internal.MpAlarmXListUI_0(MpLink := ADR(gSkid_HR[IdxSkids_HR].AlarmX_MpLink), Enable := FALSE);
		gServices.Alarms_HR[IdxSkids_HR].Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
		gServices.Alarms_HR[IdxSkids_HR].Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
	END_FOR;
	
	
	gServices.Alarms_Global.MpAlarmXCore_0(Enable := FALSE);
	gServices.Alarms_Global.MpAlarmXListUI_0(Enable := FALSE);
	gServices.Alarms_Global.MpAlarmXHistory_0(Enable := FALSE);
	gServices.Alarms_Global.MpAlarmXHistoryUI_0(Enable := FALSE);
	
END_PROGRAM