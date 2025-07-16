

PROGRAM _EXIT
	
	gServices.Alarms.Internal.MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := FALSE);
	gServices.Alarms.Internal.MpAlarmXListUI_0(MpLink := ADR(gAlarmXCore), Enable := FALSE);
	gServices.Alarms.Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
	gServices.Alarms.Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := FALSE);
	
END_PROGRAM