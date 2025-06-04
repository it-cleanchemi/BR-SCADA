
ACTION API_Calls_Action: 
	
	Post_Login_0(HttpClientRef := Client,username := 'm.gogela@cleanchemi.com',password := 'Fire1776');
	
	HA_JSON_Parse_0(pBuffer := ADR(Post_Login_0.ResponseData), pPairs := ADR(JSON_Parsed));
	
	FOR IdxJSON := 0 TO MAX_JSON_PARSE_PAIR_IDX DO
		IF JSON_Parsed[IdxJSON].Name = 'access' THEN
			brsmemcpy(ADR(Authorization_Bearer),ADR(JSON_Parsed[IdxJSON].Value)+1,LEN(JSON_Parsed[IdxJSON].Value)-2);
		END_IF;
	END_FOR;
	
	
	IcmpPing_0(pHost := ADR('google.com'), timeout := 10);
	
	HostByName_0(pName :=  ADR('cci-api-development-wjc4fopyua-uc.a.run.app'));
	
	GET_UserInfo_0(HttpClientRef := Client, sAuthorization := Authorization_Bearer);

	
	HA_JSON_Parse_1(pBuffer := ADR(GET_UserInfo_0.ResponseData), pPairs := ADR(JSON_Parsed_UserInfo));
	
	FOR IdxClients := 0 TO MAX_CLIENTS DO
		
		IF gVis.Global.ClientInfo[IdxClients].LoginRequest THEN
			gVis.Global.ClientInfo[IdxClients].LoginSuccess := TRUE;
			gVis.Global.ClientInfo[IdxClients].LoginRequest := FALSE;
		END_IF;

	END_FOR;
	
END_ACTION
