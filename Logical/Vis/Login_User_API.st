
ACTION Login_User_API: 
	
	Client.option 			:= httpOPTION_HTTP_11;
	Client.pHost 			:= ADR('cci-api-development-wjc4fopyua-uc.a.run.app');
	
	Header.protocol			:= 'HTTP/1.1';
	Header.host				:= 'cci-api-development-wjc4fopyua-uc.a.run.app';
	Header.contentType		:= 'application/json';
	Header.connection		:= 'keep-alive';
	Header.userLine[0].name	:= 'User-Agent';
	Header.userLine[0].value := 'SCADA';
	
	CASE CLIENT_LOGIN_STATE OF
		
		WAITING_FOR_LOGIN_I:
			
			API_Login_FB_0.bExecute := FALSE;
			ArUserDelete_0.Execute := FALSE;
			
			FOR IdxClients := 0 TO MAX_CLIENTS DO
				IF gVis.Global.ClientInfo[IdxClients].LogoutRequest THEN
					gVis.Global.ClientInfo[IdxClients].LogoutRequest := FALSE;
					IF gVis.Global.ClientInfo[IdxClients].LoginBypass OR gVis.Global.ClientInfo[IdxClients].UserID = 'Anonymous' THEN
						CLIENT_LOGIN_STATE := DELETE_USER_SUCCESS;
					ELSE
						CLIENT_LOGIN_STATE := DELETE_USER_C;
					END_IF;
					EXIT;
				ELSIF NOT gVis.Global.ClientInfo[IdxClients].IsValid AND gVis.Global.ClientInfo[IdxClients].UserID <> '' THEN
					IF gVis.Global.ClientInfo[IdxClients].UserID <> 'Anonymous' AND NOT gVis.Global.ClientInfo[IdxClients].LoginBypass AND NOT gVis.Global.ClientInfo[IdxClients].LogoutRequest THEN
						CLIENT_LOGIN_STATE := DELETE_USER_C;
					END_IF
					brsmemset(ADR(gVis.Global.ClientInfo[IdxClients]),0,SIZEOF(gVis.Global.ClientInfo[IdxClients]));
					EXIT;
				ELSIF gVis.Global.ClientInfo[IdxClients].LoginRequest THEN
					gVis.Global.ClientInfo[IdxClients].LoginRequest := FALSE;
					CLIENT_LOGIN_STATE := LOGIN_USER_C;
					EXIT;
				END_IF;
			END_FOR;
			
		LOGIN_USER_C:	
			
			API_Login_FB_0.bExecute := TRUE;
			API_Login_FB_0.sUser := gVis.Global.ClientInfo[IdxClients].User;
			API_Login_FB_0.sPassword := gVis.Global.ClientInfo[IdxClients].Password;

			
			CLIENT_LOGIN_STATE := LOGIN_USER_W;
			
		LOGIN_USER_W:
			
			IF API_Login_FB_0.Done THEN
				
				CLIENT_LOGIN_STATE := LOGIN_SUCCESS;
			ELSIF API_Login_FB_0.Error THEN
				CLIENT_LOGIN_STATE := LOGIN_ERROR;
			END_IF;
			
		LOGIN_SUCCESS:
			
			gVis.Global.ClientInfo[IdxClients].LoginSuccess := TRUE;
			gVis.Global.ClientInfo[IdxClients].API_ID := API_Login_FB_0.ReturnedID;
			
			CLIENT_LOGIN_STATE := WAITING_FOR_LOGIN_I;
			
		LOGIN_ERROR:
			//Insert code for error popup
			gVis.Global.ClientInfo[IdxClients].LoginSuccess := FALSE;
			gVis.Global.ClientInfo[IdxClients].LoginFailed := TRUE;
			gVis.Global.ClientInfo[IdxClients].LoginErrorInfo := API_Login_FB_0.ErrorInfo;
			API_Login_FB_0.bExecute := FALSE;
		
			CLIENT_LOGIN_STATE := WAITING_FOR_LOGIN_I;
		DELETE_USER_C:
			
			ArUserDelete_0.Execute := TRUE;
			ArUserDelete_0.UserName := gVis.Global.ClientInfo[IdxClients].UserID;
			
			CLIENT_LOGIN_STATE := DELETE_USER_W;
		DELETE_USER_W:
			
			IF ArUserDelete_0.Done THEN
				CLIENT_LOGIN_STATE := DELETE_USER_SUCCESS;
			ELSIF ArUserDelete_0.Error THEN
				CLIENT_LOGIN_STATE := DELETE_USER_ERROR;
			END_IF;
			
		DELETE_USER_SUCCESS:
			gVis.Global.ClientInfo[IdxClients].LogoutSuccess := TRUE;
			CLIENT_LOGIN_STATE := WAITING_FOR_LOGIN_I;
		DELETE_USER_ERROR:
			//Insert code for error popup
			CLIENT_LOGIN_STATE := WAITING_FOR_LOGIN_I;

		
	END_CASE;
	
	API_Login_FB_0(HttpClientRef := Client, RequestHeader := Header);
		 	 	 	 	
				 	 	 	 	
	ArUserDelete_0();
	ArUserCreate_0();
				 	 	
			 	 	 	 	


	

	
	
				END_ACTION
