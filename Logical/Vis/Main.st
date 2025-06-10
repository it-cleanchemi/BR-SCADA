
PROGRAM _INIT
	
	brsmemset(ADR(gVis.Main.Out.IPAddressDataProv),0,SIZEOF(gVis.Main.Out.IPAddressDataProv));
	
	
	//Set IP Address for screen
	gVis.Main.Out.SkidIPAddress := SLAVE_IP_ADDRESSES;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//Grab Unit ID and Create Dropdown List 
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
		IF gSkid_lR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID = 0 THEN
			gVis.Main.Internal.IP_WSTRING_Temp := STRING_TO_WSTRING(SLAVE_IP_ADDRESSES[IdxSkids_LR]);
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids_LR,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids_LR]));
		ELSE
			gVis.Main.Internal.IP_WSTRING_Temp := UINT_TO_WSTRING(gSkid_lR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID );
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids_LR,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids_LR]));	
		END_IF;
		
	END_FOR
	
	FOR IdxSkids_HR_HR := 0 TO MAX_SKIDS_HR DO
		
		IF gSkid_HR[IdxSkids_HR].Pmax_General_Variables.UNIT_ID = 0 THEN
			gVis.Main.Internal.IP_WSTRING_Temp := STRING_TO_WSTRING(SLAVE_IP_ADDRESSES[IdxSkids_HR]);
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids_HR,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids_HR]));
		ELSE
			gVis.Main.Internal.IP_WSTRING_Temp := UINT_TO_WSTRING(gSkid_HR[IdxSkids_HR].Pmax_General_Variables.UNIT_ID );
			WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids_HR,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids_HR]));	
		END_IF;
		
	END_FOR

	//Main Page Widget Vis
	Vis_Main_HR;
	Vis_Main_LR;
	
	//Vis Action Calls	
	Login_User_API;
	
	//Alarm Page Logic
	Alarms_Active;
	Alarms_History;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
