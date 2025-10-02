
ACTION Recipe_Action: 
	
	IF gServices.Recipe.CreateNoteFile THEN
		gServices.Recipe.MpRecipeXml.Save := TRUE;
		IF gServices.Recipe.MpRecipeXml.CommandDone AND NOT gServices.Recipe.MpRecipeXml.Error THEN
			RecipeLoaded := TRUE;
			gServices.Recipe.MpRecipeXml.Save := FALSE;
			gServices.Recipe.CreateNoteFile := FALSE;
			
			FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
				gSkid_LR[IdxSkids_LR].Notes.LOCATION:= gRecipe_LR[IdxSkids_LR].Notes;
				gSkid_LR[IdxSkids_LR].RosterContact := gRecipe_LR[IdxSkids_LR].Contacts;
			END_FOR;
			
		END_IF
	END_IF
	
	
	IF NOT RecipeLoaded AND NOT gServices.Recipe.CreateNoteFile THEN
		gServices.Recipe.MpRecipeXml.Load := TRUE;
		IF gServices.Recipe.MpRecipeXml.CommandDone AND NOT gServices.Recipe.MpRecipeXml.Error THEN
			RecipeLoaded := TRUE;
			gServices.Recipe.MpRecipeXml.Load := FALSE;
			RECIPE_LR_TEMP := gRecipe_LR;
			
			FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
				gSkid_LR[IdxSkids_LR].Notes.LOCATION:= gRecipe_LR[IdxSkids_LR].Notes;
				gSkid_LR[IdxSkids_LR].RosterContact := gRecipe_LR[IdxSkids_LR].Contacts;
			END_FOR;
			
		ELSIF gServices.Recipe.MpRecipeXml.Error THEN
			gServices.Recipe.MpRecipeXml.Load := FALSE;
			gServices.Recipe.MpRecipeXml.ErrorReset := TRUE;
			gServices.Recipe.CreateNoteFile := TRUE;
		END_IF;
	END_IF;
	
	IF RecipeLoaded THEN
		FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
			gRecipe_LR[IdxSkids_LR].Notes := gSkid_LR[IdxSkids_LR].Notes.LOCATION;
			gRecipe_LR[IdxSkids_LR].Contacts := gSkid_LR[IdxSkids_LR].RosterContact;
		END_FOR;
	END_IF;
	
	IF brsmemcmp(ADR(gRecipe_LR),ADR(RECIPE_LR_TEMP),SIZEOF(RECIPE_LR_TEMP)) <> 0 AND RecipeLoaded THEN
		gServices.Recipe.MpRecipeXml.Save := TRUE;
		IF gServices.Recipe.MpRecipeXml.CommandDone AND NOT gServices.Recipe.MpRecipeXml.Error THEN
			gServices.Recipe.MpRecipeXml.Save := FALSE;
			RECIPE_LR_TEMP := gRecipe_LR;
		END_IF;
	END_IF;
	
	gServices.Recipe.MpRecipeRegPar(MpLink := ADR(gRecipeXml), Enable := TRUE, ErrorReset := gErrorReset, PVName := ADR('gRecipe_LR'));
	
	gServices.Recipe.MpRecipeXml(MpLink := ADR(gRecipeXml), Enable := TRUE, ErrorReset := gErrorReset, DeviceName := ADR('USER_DEVICE'), FileName := ADR('RECIPE.xml'));
	

END_ACTION
