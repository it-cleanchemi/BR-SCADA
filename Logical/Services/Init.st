

PROGRAM _INIT
	IF DiagCpuIsARsim() OR DiagCpuIsSimulated() THEN
		gServices.DeviceName := 'USER_DEVICE_SIM';
	ELSE
		gServices.DeviceName :=  'USER_DEVICE';
	END_IF;
	 
END_PROGRAM