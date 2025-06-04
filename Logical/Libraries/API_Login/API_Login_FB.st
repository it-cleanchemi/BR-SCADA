
(* TODO: Add your comment here *)
FUNCTION_BLOCK API_Login_FB
	
	IF NOT bEnable THEN
		LoginState := IDLE_I;
	END_IF;

	CASE LoginState OF
		
		IDLE_I:
			
			GET_UserInfo.bEnable := FALSE;
			GET_UserInfo.bRequest := FALSE;
			POST_Login.bEnable := FALSE;
			POST_Login.bRequest := FALSE;
			HA_JSON_Parse.Enable := FALSE;
			ArUserSetPassword.Execute := FALSE;
			ArUserCreate.Execute := FALSE;
			
			IF bEnable THEN
				LoginState := REQ_AUTH_C;
			END_IF;
			
		REQ_AUTH_C:
			
			POST_Login.username := sUser;
			POST_Login.password := sPassword;
			
			POST_Login.bEnable := TRUE;
			POST_Login.bRequest := TRUE;
			
			LoginState := REQ_AUTH_W;
			
		REQ_AUTH_W:
			
			IF POST_Login.Status = 0 THEN
				LoginState := PARSE_AUTH_JSON_C;
			END_IF;
			
		PARSE_AUTH_JSON_C:
			
			POST_Login.bEnable := FALSE;
			POST_Login.bRequest := FALSE;
			HA_JSON_Parse.Enable := TRUE;
			HA_JSON_Parse.pBuffer := ADR(POST_Login.ResponseData);
			HA_JSON_Parse.pPairs := ADR(JSON_Parsed);
			
			LoginState := PARSE_AUTH_JSON_W;
			
		PARSE_AUTH_JSON_W:
			
			IF HA_JSON_Parse.Done THEN
				LoginState := REQ_USER_INFO_C;
			END_IF;
			
		REQ_USER_INFO_C:
			
			HA_JSON_Parse.Enable := FALSE;
			
			FOR IdxJSON := 0 TO MAX_JSON_PARSE_PAIR_IDX DO
				IF JSON_Parsed[IdxJSON].Name = 'access' THEN
					brsmemcpy(ADR(Authorization_Bearer),ADR(JSON_Parsed[IdxJSON].Value)+1,LEN(JSON_Parsed[IdxJSON].Value)-2);
					EXIT;
				END_IF;
			END_FOR;
			
			GET_UserInfo.bEnable := TRUE;
			GET_UserInfo.bRequest := TRUE;
			GET_UserInfo.sAuthorization := Authorization_Bearer;
			
			LoginState := REQ_USER_INFO_W;
			
		REQ_USER_INFO_W:
			
			IF GET_UserInfo.Status = 0 THEN
				LoginState := PARSE_USER_INFO_C;
			END_IF;
			
		PARSE_USER_INFO_C:
			
			GET_UserInfo.bEnable := FALSE;
			GET_UserInfo.bRequest := FALSE;
			HA_JSON_Parse.Enable := TRUE;
			HA_JSON_Parse.pBuffer := ADR(GET_UserInfo.ResponseData);
			HA_JSON_Parse.pPairs := ADR(JSON_Parsed);
			
			LoginState := PARSE_USER_INFO_W;
			
		PARSE_USER_INFO_W:
			
			IF HA_JSON_Parse.Done THEN
				LoginState := CREATE_USER_C;
			END_IF;
			
		CREATE_USER_C:
			
			ArUserCreate.Execute := TRUE;
			ArUserCreate.UserName := sUser;
			
			LoginState := CREATE_USER_W;
			
		CREATE_USER_W:
			
			IF ArUserCreate.Done THEN
				LoginState := SET_PASSWORD_C;
			ELSIF ArUserCreate.ErrorID = -1070585893 THEN
					LoginState := SET_PASSWORD_C;
			END_IF;
			
		SET_PASSWORD_C:
			
			ArUserSetPassword.Execute := TRUE;
			ArUserSetPassword.UserName := sUser;
			ArUserSetPassword.Password := sPassword;
			
			LoginState := SET_PASSWORD_W;
			
		SET_PASSWORD_W:
			
			IF ArUserSetPassword.Done THEN
				LoginState := LOGIN_SUCCESS;
			END_IF;
			
		SET_ROLES_C:
			
		SET_ROLES_W:
	
		LOGIN_SUCCESS:
			
		LOGIN_ERROR:
		
	END_CASE;
	
	GET_UserInfo(HttpClientRef := HttpClientRef, RequestHeader := RequestHeader);
	POST_Login(HttpClientRef := HttpClientRef, RequestHeader := RequestHeader);
	HA_JSON_Parse();
	ArUserSetPassword();
	ArUserCreate();


END_FUNCTION_BLOCK
