
(* returns the ID and Version of the configuration as strings and also enters a record in the log book *)
FUNCTION_BLOCK IdentifyConfig
	Done := FALSE;
	CASE internal.state OF
		0:
			IF internal.ArProjectGetInfo_0.Done THEN
				ConfigID := internal.ArProjectGetInfo_0.ConfigurationID;
				ConfigVersion := internal.ArProjectGetInfo_0.ConfigurationVersion;
				internal.AddData := '';
				brsstrcat(ADR(internal.AddData),ADR('Configuration ID="'));
				brsstrcat(ADR(internal.AddData),ADR(ConfigID));
				brsstrcat(ADR(internal.AddData),ADR('" Configuration version="'));
				brsstrcat(ADR(internal.AddData),ADR(ConfigVersion));
				brsstrcat(ADR(internal.AddData),ADR('"'));
				internal.ArProjectGetInfo_0.Execute := FALSE;
				internal.state := 10;
			ELSIF NOT internal.ArProjectGetInfo_0.Execute THEN
				internal.ArProjectGetInfo_0.Execute := TRUE;
			ELSE
				internal.ArProjectGetInfo_0.Execute := FALSE;
			END_IF;
		10:
			IF internal.ArEventLogGetIdent_0.Done THEN
				internal.ArEventLogGetIdent_0.Execute := FALSE;
				internal.ArEventLogWrite_0.Ident := internal.ArEventLogGetIdent_0.Ident;
				internal.ArEventLogWrite_0.EventID := 1610612736;
				internal.ArEventLogWrite_0.ObjectID := 'HA_Version';
				internal.ArEventLogWrite_0.AddDataFormat := 1;
				internal.ArEventLogWrite_0.AddData := ADR(internal.AddData);
				internal.ArEventLogWrite_0.AddDataSize := brsstrlen(ADR(internal.AddData))+1;
				internal.ArEventLogWrite_0.Execute := TRUE;
				internal.state := 20;
			ELSIF NOT internal.ArEventLogGetIdent_0.Execute THEN
				internal.ArEventLogGetIdent_0.Name := '$$arlogusr';
				internal.ArEventLogGetIdent_0.Execute := TRUE;
			ELSE
				internal.ArEventLogGetIdent_0.Execute := FALSE;
			END_IF;
		20:
			IF internal.ArEventLogWrite_0.Done THEN
				internal.ArEventLogWrite_0.Execute := FALSE;
				internal.state := 30;
			ELSIF NOT internal.ArEventLogWrite_0.Execute THEN
				internal.ArEventLogWrite_0.Execute := TRUE;
			ELSE
				internal.ArEventLogWrite_0.Execute := FALSE;
			END_IF;
		30:
			Done := TRUE;
	END_CASE;

	internal.ArProjectGetInfo_0();
	internal.ArEventLogGetIdent_0();
	internal.ArEventLogWrite_0();

END_FUNCTION_BLOCK
