
PROGRAM _INIT
	
	brsmemset(ADR(gVis.Main.Out.IPAddressDataProv),0,SIZEOF(gVis.Main.Out.IPAddressDataProv));
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		SkidNumberINT := INT_TO_STRING(IdxSkids + 1);
		
		gVis.Alarms.Active.FilterString[IdxSkids] := CONCAT('[{"value":',SkidNumberINT);
		gVis.Alarms.Active.FilterString[IdxSkids] :=  CONCAT(gVis.Alarms.Active.FilterString[IdxSkids] ,',"conditionType":"==","columnPosition":1}]');
		
		//		gVis.Main.Internal.IP_WSTRING_Temp := STRING_TO_WSTRING(SLAVE_IP_ADDRESSES[IdxSkids]);
		//		WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids]));

	END_FOR;

	
	//Set IP Address for screen
	gVis.Main.Out.SkidIPAddress := SLAVE_IP_ADDRESSES;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//Grab Unit ID and Create Dropdown List 
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		IF gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID = 0 THEN
			gVis.Main.Internal.IP_WSTRING_Temp := STRING_TO_WSTRING(SLAVE_IP_ADDRESSES[IdxSkids]);
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids]));
		ELSE
			gVis.Main.Internal.IP_WSTRING_Temp := UINT_TO_WSTRING(gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID );
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids]));	
		END_IF;
		
	END_FOR

	//	IF gVis.Main.In.TestButton THEN
	//		//Do action
	//	END_IF;
	
	//	gVis.Main.Out.SkidID :=  
	
	//Alarm Page Logic
	Alarms_Active;
	//Alarms_History;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
