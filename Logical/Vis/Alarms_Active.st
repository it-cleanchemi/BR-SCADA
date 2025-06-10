ACTION Alarms_Active: 
	
	gVis.Alarms.Active.UIConnect.Language									:= gPar.System.LanguageCode;
	gVis.Alarms.Active.UIConnect.AlarmList.SelectedIndex					:= gVis.Alarms.Active.SelectedIndex;
	IF gVis.Alarms.Active.Reset THEN
		gVis.Alarms.Active.Reset											:= FALSE;
		gVis.Global.ErrorReset													:= TRUE;
		brsmemset(ADR(gServices.Alarms.Internal.Alarms_State),0,SIZEOF(gServices.Alarms.Internal.Alarms_State));
	END_IF;
	
	IF gVis.Alarms.Active.PageUp THEN
		IF gVis.Alarms.Active.SelectedIndex > 0 THEN
			gVis.Alarms.Active.SelectedIndex := gVis.Alarms.Active.SelectedIndex - 1;
		END_IF;
		gVis.Alarms.Active.PageUp												:= FALSE;
	ELSIF gVis.Alarms.Active.PageDown THEN
		gVis.Alarms.Active.SelectedIndex := gVis.Alarms.Active.SelectedIndex + 1;
		gVis.Alarms.Active.PageDown												:= FALSE;
	END_IF;	
	
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
	
	IF gVis.Alarms.Active.SelectedIndex <> gVis.Alarms.Active.SelectedIndex_Temp THEN
	  
		FOR IdxSkids_HR := 0 TO MAX_SKIDS_HR DO
			IF gUnit_HR[IdxSkids_HR] = gVis.Alarms_HR.Active.UIConnect.AlarmList.Code[gVis.Alarms_HR.Active.SelectedIndex]  THEN
				gVis.Alarms_HR.Active.SelectedSkidIdx := IdxSkids_HR;
				EXIT;
			END_IF;
		END_FOR;
		gVis.Alarms_HR.Active.SelectedIndex_Temp := gVis.Alarms_HR.Active.SelectedIndex;
	END_IF;
	
	IF gVis.Alarms_LR.Active.SelectedIndex <> gVis.Alarms_LR.Active.SelectedIndex_Temp THEN
		FOR IdxSkids_LR := 0 TO MAX_SKIDS DO
			IF gUnit_LR[IdxSkids_LR] = gVis.Alarms_LR.Active.UIConnect.AlarmList.Code[gVis.Alarms_LR.Active.SelectedIndex]  THEN
				gVis.Alarms_LR.Active.SelectedSkidIdx := IdxSkids_LR;
				EXIT;
			END_IF;
		END_FOR;
		gVis.Alarms_LR.Active.SelectedIndex_Temp := gVis.Alarms_LR.Active.SelectedIndex;
	END_IF;
	
	
END_ACTION