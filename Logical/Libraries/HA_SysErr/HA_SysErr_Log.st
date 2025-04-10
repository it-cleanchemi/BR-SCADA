
(* Returns System Error If It Exists In Table and Logs it to the user logger*)
FUNCTION_BLOCK HA_SysErr_Log
	IF NOT Execute THEN
		Internal.State := 0;
	END_IF;
	CASE Internal.State OF 
		0:
			brsmemset(ADR(ErrorNumText),0,SIZEOF(ErrorNumText));
			Internal.HA_SysErr_Lookup_0.Execute := FALSE;
			Error := FALSE;
			Done := FALSE;
			IF Execute THEN
				Internal.State := 10;
			END_IF;
		10:
			brsmemset(ADR(ErrorNumText),0,SIZEOF(ErrorNumText));
			Internal.HA_SysErr_Lookup_0.ErrorNum := ErrorNum;
			Internal.HA_SysErr_Lookup_0.Execute := TRUE;
			Internal.State := 20;
		20:
			IF Internal.HA_SysErr_Lookup_0.Done THEN
				ErrorNumText := Internal.HA_SysErr_Lookup_0.ErrorNumText;
				Internal.State := 100;
			ELSIF Internal.HA_SysErr_Lookup_0.Error THEN
				ErrorNumText := Internal.HA_SysErr_Lookup_0.ErrorNumText;
				Internal.State := 99;
			END_IF;
		99:
			Error := TRUE;
		100:
			brsmemset(ADR(Internal.AddData),0,SIZEOF(Internal.AddData));
			brsstrcat(ADR(Internal.AddData),ADR(ErrorNumText));
			Internal.ArEventLogGetIdent_0.Name := '$$arlogusr';
			Internal.ArEventLogGetIdent_0.Execute := TRUE;
			Internal.State := 110;
		110:
			IF Internal.ArEventLogGetIdent_0.Done THEN
				Internal.ArEventLogGetIdent_0.Execute := FALSE;
				Internal.ArEventLogWrite_0.Ident := Internal.ArEventLogGetIdent_0.Ident;
				Internal.ArEventLogWrite_0.EventID := -536870912;
				Internal.ArEventLogWrite_0.ObjectID := 'HA_SysErr';
				Internal.ArEventLogWrite_0.AddDataFormat := 1;
				Internal.ArEventLogWrite_0.AddData := ADR(Internal.AddData);
				Internal.ArEventLogWrite_0.AddDataSize := brsstrlen(ADR(Internal.AddData))+1;
				Internal.ArEventLogWrite_0.Execute := TRUE;
				Internal.State := 120;
			ELSIF Internal.ArEventLogGetIdent_0.Error THEN
				Internal.State := 999;
			END_IF;
		120:
			IF Internal.ArEventLogWrite_0.Done THEN
				Internal.ArEventLogWrite_0.Execute := FALSE;
				Internal.State := 130;
			ELSIF NOT Internal.ArEventLogWrite_0.Error THEN
				Internal.State := 999;
			END_IF;
		130:
			Done := TRUE;
		999:
			Error := TRUE;
			ErrorNumText := 'Log Error';
	END_CASE;
	Internal.HA_SysErr_Lookup_0();
	Internal.ArEventLogGetIdent_0();
	Internal.ArEventLogWrite_0();
END_FUNCTION_BLOCK
