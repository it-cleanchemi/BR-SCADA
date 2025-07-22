
ACTION Chart_Buffer: 
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
		bufferIndex := 0;
		sampleTrigger := FALSE;
		
		samplingTimer(IN := NOT sampleTrigger, PT := T#1S);
		
		IF samplingTimer.Q THEN
			sampleTrigger := TRUE;
			samplingTimer(IN := FALSE);
		END_IF;
		
		IF sampleTrigger THEN
			sampleTrigger := FALSE;
			
			// Grab CD to store 
			gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_BUFFER[bufferIndex] := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101
		
		
        	// Increment buffer index with wraparound
			bufferIndex := bufferIndex + 1;
			IF bufferIndex >= 600 THEN
				bufferIndex := 0;
			END_IF;
			
			
		END_IF;
		
	END_FOR;
	
	

	
	
END_ACTION
