
(* Alarm Core to handle setting multiple alarms in one cycle with different texts *)
FUNCTION_BLOCK HA_AlarmXCore

	IF enable = FALSE THEN
		internal.state := HA_ALARMX_CORE_RESET;
	END_IF

	CASE internal.state OF
			
		HA_ALARMX_CORE_RESET:
		
			brsmemset(ADR(internal.currentAlarm), 0, SIZEOF(internal.currentAlarm));
			internal.state := HA_ALARMX_CORE_IDLE;	
		
		HA_ALARMX_CORE_IDLE:
		
			IF HA_Array_PeekBtm(pBuffer, SIZEOF(internal.currentAlarm) * HA_ALARMX_BUFFER_IDX, ADR(internal.currentAlarm), SIZEOF(internal.currentAlarm)) > 0 THEN
				HA_Array_Dequeue(pBuffer, SIZEOF(internal.currentAlarm) * HA_ALARMX_BUFFER_IDX, ADR(internal.currentAlarm), SIZEOF(internal.currentAlarm));
				internal.state := HA_ALARMX_CORE_SET_C;
			END_IF		
		
		HA_ALARMX_CORE_SET_C:
					
			FOR internal.i := 0 TO HA_ALARMX_MAX_ADD_DATA_IDX DO
				pOutputData.AddData[internal.i]	:= internal.currentAlarm.addText[internal.i];
			END_FOR
			HA_AlarmX_Helper(MpLink, internal.currentAlarm.name, HA_ALARMX_ACTION_SET, '', internal.currentAlarm.allowMultiple);
			
			internal.state := HA_ALARMX_CORE_SET_W;

		HA_ALARMX_CORE_SET_W:
		
			internal.tDelay.IN	:= TRUE;
			internal.tDelay.PT	:= delayTime;
		
			IF internal.tDelay.Q THEN
				internal.tDelay.IN	:= FALSE;
				internal.state 		:= HA_ALARMX_CORE_IDLE;
			END_IF
			
	END_CASE
	
	internal.tDelay();

END_FUNCTION_BLOCK
