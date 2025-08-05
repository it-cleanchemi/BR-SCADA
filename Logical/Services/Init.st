

PROGRAM _INIT
	IF DiagCpuIsARsim() OR DiagCpuIsSimulated() THEN
		gServices.DeviceName := 'USER_DEVICE_SIM';
	ELSE
		gServices.DeviceName :=  'USER_DEVICE';
	END_IF;
	
	gServices.Alarms.Internal.MpAlarmXListUI_0.UISetup.AlarmListSize	:= 50;
	
END_PROGRAM