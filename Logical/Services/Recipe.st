
ACTION Recipe_Action: 
	
	
	IF NOT NotesLoaded THEN
		gServices.Recipe.MpRecipeXml.Load := TRUE;
		IF gServices.Recipe.MpRecipeXml.CommandDone AND NOT gServices.Recipe.MpRecipeXml.Error THEN
			NotesLoaded := TRUE;
			gServices.Recipe.MpRecipeXml.Load := FALSE;
			NOTES_LR_TEMP := NOTES_LR;
			
			FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
				gSkid_LR[IdxSkids_LR].Notes.LOCATION := NOTES_LR[IdxSkids_LR];
			END_FOR;
	
		END_IF;
	END_IF;
	
	IF NotesLoaded THEN
		FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
			NOTES_LR[IdxSkids_LR] := gSkid_LR[IdxSkids_LR].Notes.LOCATION;
		END_FOR;
	END_IF;
	
	IF brsmemcmp(ADR(NOTES_LR),ADR(NOTES_LR_TEMP),SIZEOF(NOTES_LR_TEMP)) <> 0 AND NotesLoaded THEN
		gServices.Recipe.MpRecipeXml.Save := TRUE;
		IF gServices.Recipe.MpRecipeXml.CommandDone AND NOT gServices.Recipe.MpRecipeXml.Error THEN
			gServices.Recipe.MpRecipeXml.Save := FALSE;
			NOTES_LR_TEMP := NOTES_LR;
		END_IF;
	END_IF;
	
	gServices.Recipe.MpRecipeRegPar(MpLink := ADR(gRecipeXml), Enable := TRUE, ErrorReset := gErrorReset, PVName := ADR('NOTES_LR'));
	
	gServices.Recipe.MpRecipeXml(MpLink := ADR(gRecipeXml), Enable := TRUE, ErrorReset := gErrorReset, DeviceName := ADR('USER_DEVICE'), FileName := ADR('NOTES.xml'));
	

END_ACTION
