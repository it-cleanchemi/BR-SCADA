
PROGRAM _INIT
	
	brsmemset(ADR(gVis.Main.Out.IPAddressDataProv),0,SIZEOF(gVis.Main.Out.IPAddressDataProv));
	
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		gVis.Main.Internal.IP_WSTRING_Temp := STRING_TO_WSTRING(SLAVE_IP_ADDRESSES[IdxSkids]);
		WString2DataProvider(ADR(gVis.Main.Internal.IP_WSTRING_Temp),IdxSkids,ADR(gVis.Main.Out.IPAddressDataProv[IdxSkids]));

	END_FOR;
	
END_PROGRAM

PROGRAM _CYCLIC
	
//	IF gVis.Main.In.TestButton THEN
//		//Do action
//	END_IF;
	
//	gVis.Main.Out.SkidID :=  
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM
