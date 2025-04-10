
(* Returns System Error If It Exists In Table *)
FUNCTION_BLOCK HA_SysErr_Lookup
 
	IF NOT Execute THEN
		Internal.State := 0;
	END_IF;
	CASE Internal.State OF 
		0:
			brsmemset(ADR(ErrorNumText),0,SIZEOF(ErrorNumText));
			Internal.ArTextSysGetText_0.Execute := FALSE;
			Error := FALSE;
			Done := FALSE;
			IF Execute THEN
				Internal.State := 10;
			END_IF;
		10:
			brsmemset(ADR(ErrorNumText),0,SIZEOF(ErrorNumText));
			brsmemset(ADR(Internal.TextID),0,SIZEOF(Internal.TextID));
			brsmemset(ADR(Internal.ErrorNumString),0,SIZEOF(Internal.ErrorNumString));
			brsitoa(ErrorNum,ADR(Internal.ErrorNumString));
			brsstrcat(ADR(Internal.TextID),ADR('HA_SysErr.'));
			brsstrcat(ADR(Internal.TextID),ADR(Internal.ErrorNumString));
			Internal.ArTextSysGetText_0.Execute := TRUE;
			Internal.State := 20;
		20:
			IF Internal.ArTextSysGetText_0.Done THEN
				Done := TRUE;
				Internal.State := 30;
			ELSIF Internal.ArTextSysGetText_0.Error THEN
				Error := TRUE;
				Internal.State := 30;
			END_IF;
		30:
			IF Error THEN
				ErrorNumText := 'Not Found';
			END_IF;
	END_CASE;
	Internal.ArTextSysGetText_0(Namespace := ADR('HA_SysErr'), TextID := ADR(Internal.TextID), LanguageCode := 'en', TextBufferSize := SIZEOF(ErrorNumText)-1, TextBuffer := ADR(ErrorNumText), SearchMode := arTEXTSYS_SEARCH_LANGUAGE_ONLY);

END_FUNCTION_BLOCK
