
ACTION Alarms_History: 

	//gVis.Alarms.History.UIConnect.Language									:= gPar.System.LanguageCode;
	gVis.Alarms.History.UIConnect.AlarmList.SelectedIndex					:= gVis.Alarms.History.SelectedIndex;
	gVis.Alarms.History.UIConnect.AlarmList.PageUp							:= gVis.Alarms.History.PageUp;
	gVis.Alarms.History.PageUp												:= FALSE;
	gVis.Alarms.History.UIConnect.AlarmList.PageDown						:= gVis.Alarms.History.PageDown;
	gVis.Alarms.History.PageDown											:= FALSE;
	gServices.Alarms.In.ClearHistory									:= gVis.Alarms.History.Clear;
	gVis.Alarms.History.Clear												:= FALSE;
	gServices.Alarms.In.ExportHistory									:= gVis.Alarms.History.Export;
	gVis.Alarms.History.Export												:= FALSE;
	// Below loop sets the state variable to 1. Non 1 values are filtered from the table. This filters the history to only have when the alarm was triggered and not when it was acknowledged.
	FOR Idx_AlarmList := 0 TO 49 DO
		gVis.Alarms.History.State[Idx_AlarmList] 										:= 0;
		IF gVis.Alarms.History.UIConnect.AlarmList.NewState[Idx_AlarmList] = mpALARMX_STATE_ACTIVE THEN
			gVis.Alarms.History.State[Idx_AlarmList] 									:= 1;
		END_IF;
	END_FOR;

	brsmemset(ADR(gVis.Alarms.History.TableConfig),0,SIZEOF(gVis.Alarms.History.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.History.TableConfig),ADR('{"specRows": [ {"from":'),SIZEOF(gVis.Alarms.History.TableConfig));
	IF gVis.Alarms.History.UIConnect.AlarmList.MaxSelection = 0 THEN
		IF gVis.Alarms.History.UIConnect.AlarmList.Timestamp[0] = '' THEN
			gVis.Alarms.History.TempINT										:= 0;
		ELSE
			gVis.Alarms.History.TempINT										:= 1;
		END_IF;
	ELSE
		gVis.Alarms.History.TempINT											:= UINT_TO_INT(gVis.Alarms.History.UIConnect.AlarmList.MaxSelection)+1;
	END_IF;
	gVis.Alarms.History.TempSTRING 											:= INT_TO_STRING(gVis.Alarms.History.TempINT);
	HA_brsstrcat(ADR(gVis.Alarms.History.TableConfig),ADR(gVis.Alarms.History.TempSTRING),SIZEOF(gVis.Alarms.History.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.History.TableConfig),ADR(', "to":'),SIZEOF(gVis.Alarms.History.TableConfig));
	gVis.Alarms.History.TempINT												:= 49;
	gVis.Alarms.History.TempSTRING 											:= INT_TO_STRING(gVis.Alarms.History.TempINT);
	HA_brsstrcat(ADR(gVis.Alarms.History.TableConfig),ADR(gVis.Alarms.History.TempSTRING),SIZEOF(gVis.Alarms.History.TableConfig));
	HA_brsstrcat(ADR(gVis.Alarms.History.TableConfig),ADR(', "visible":false} ]}'),SIZEOF(gVis.Alarms.History.TableConfig));

END_ACTION
