ACTION Alarms_Active: 
	
	gVis.Alarms.Active.UIConnect.Language									:= gPar.System.LanguageCode;
	gVis.Alarms.Active.UIConnect.AlarmList.SelectedIndex					:= gVis.Alarms.Active.SelectedIndex;
	IF gVis.Alarms.Active.Reset THEN
		gVis.Alarms.Active.Reset											:= FALSE;
		gVis.Global.ErrorReset													:= TRUE;
	END_IF;
	gVis.Alarms.Active.UIConnect.AlarmList.PageUp							:= gVis.Alarms.Active.PageUp;
	gVis.Alarms.Active.PageUp												:= FALSE;
	gVis.Alarms.Active.UIConnect.AlarmList.PageDown							:= gVis.Alarms.Active.PageDown;
	gVis.Alarms.Active.PageDown												:= FALSE;
	
	brsmemset(ADR(gVis.Alarms.Active.TableConfig),0,SIZEOF(gVis.Alarms.Active.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.Active.TableConfig),ADR('{"specRows": [ {"from":'),SIZEOF(gVis.Alarms.Active.TableConfig));
	IF gVis.Alarms.Active.UIConnect.AlarmList.MaxSelection = 0 THEN
		IF gVis.Alarms.Active.UIConnect.AlarmList.Timestamp[0] = '' THEN
			gVis.Alarms.Active.TempINT										:= 0;
		ELSE
			gVis.Alarms.Active.TempINT										:= 1;
		END_IF;
	ELSE
		gVis.Alarms.Active.TempINT											:= UINT_TO_INT(gVis.Alarms.Active.UIConnect.AlarmList.MaxSelection)+1;
	END_IF;
	gVis.Alarms.Active.TempSTRING 											:= INT_TO_STRING(gVis.Alarms.Active.TempINT);
	HA_brsstrcat(ADR(gVis.Alarms.Active.TableConfig),ADR(gVis.Alarms.Active.TempSTRING),SIZEOF(gVis.Alarms.Active.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.Active.TableConfig),ADR(', "to":'),SIZEOF(gVis.Alarms.Active.TableConfig));
	gVis.Alarms.Active.TempINT												:= 49;
	gVis.Alarms.Active.TempSTRING 											:= INT_TO_STRING(gVis.Alarms.Active.TempINT);
	HA_brsstrcat(ADR(gVis.Alarms.Active.TableConfig),ADR(gVis.Alarms.Active.TempSTRING),SIZEOF(gVis.Alarms.Active.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.Active.TableConfig),ADR(', "visible":false} ]}'),SIZEOF(gVis.Alarms.Active.TableConfig));

END_ACTION