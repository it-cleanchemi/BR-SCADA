
(* TODO: Add your comment here *)
FUNCTION_BLOCK API_Login_FB
	
	IF NOT bExecute THEN
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
			ErrorInfo := '';
			
			Done := FALSE;
			Error := FALSE;
			
			IF bExecute THEN
				LoginState := REQ_AUTH_C;
			END_IF;
			
		REQ_AUTH_C:
			
			POST_Login.username := sUser;
			POST_Login.password := sPassword;
			
			POST_Login.bEnable := TRUE;
			POST_Login.bRequest := TRUE;
			
			LoginState := REQ_AUTH_W;
			
		REQ_AUTH_W:
			
			IF POST_Login.Status = 0 AND POST_Login.ResponseStatus = '200 OK' THEN
				LoginState := PARSE_AUTH_JSON_C;
			ELSIF  POST_Login.Status = 0 AND POST_Login.ResponseStatus = '401 Unauthorized' THEN
				LoginState := LOGIN_API_ERROR;
				ErrorInfo := POST_Login.ResponseStatus;
			ELSIF POST_Login.Status = 0 AND POST_Login.ResponseStatus = '400 Bad Request' THEN
				LoginState := LOGIN_API_ERROR;
				ErrorInfo := POST_Login.ResponseStatus;
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
			
			IF GET_UserInfo.Status = 0 AND GET_UserInfo.ResponseStatus = '200 OK' THEN
				LoginState := PARSE_USER_INFO_C;
			ELSIF GET_UserInfo.Status = 0 AND GET_UserInfo.ResponseStatus = '401 Unauthorized' THEN
				LoginState := LOGIN_API_ERROR;
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
				
				FOR IdxJSON := 0 TO MAX_JSON_PARSE_PAIR_IDX DO
					IF JSON_Parsed[IdxJSON].Name = 'role' THEN
						brsmemcpy(ADR(ReturnedRole),ADR(JSON_Parsed[IdxJSON].Value)+1,LEN(JSON_Parsed[IdxJSON].Value)-2);
						EXIT;
					END_IF;
				END_FOR;
				
				LoginState := CREATE_USER_C;
			END_IF;
			
		CREATE_USER_C:
			
			ArUserCreate.Execute := TRUE;
			ArUserCreate.UserName := sUser;
			
			LoginState := CREATE_USER_W;
			
		CREATE_USER_W:
			
			IF ArUserCreate.Done THEN
				LoginState := SET_PASSWORD_C;
			ELSIF ArUserCreate.ErrorID = arUSER_ERR_ALREADY_EXISTS THEN
				LoginState := SET_PASSWORD_C;
			END_IF;
			
		SET_PASSWORD_C:
			
			ArUserSetPassword.Execute := TRUE;
			ArUserSetPassword.UserName := sUser;
			ArUserSetPassword.Password := sPassword;
			
			LoginState := SET_PASSWORD_W;
			
		SET_PASSWORD_W:
			
			IF ArUserSetPassword.Done THEN
				LoginState := SET_ROLES_C;
			ELSIF ArUserSetPassword.Error THEN
				CASE ArUserSetPassword.ErrorID OF
					arUSER_ERR_PARAMETER:
						LoginState := LOGIN_API_ERROR;
					arUSER_ERR_DOES_NOT_EXIST:
						LoginState := LOGIN_API_ERROR;
					arUSER_ERR_INTERNAL:
						LoginState := LOGIN_API_ERROR;
				END_CASE;
			END_IF;
			
		SET_ROLES_C:
			
			ArUserAssignRole.Execute := TRUE;
			ArUserAssignRole.UserName := sUser;
			ArUserAssignRole.RoleName := ReturnedRole;
			
			LoginState := SET_ROLES_W;
			
		SET_ROLES_W:
			
			IF ArUserAssignRole.Done THEN
				LoginState := USER_CREATED_SUCCESSS;
			ELSIF ArUserAssignRole.Error THEN
				CASE ArUserAssignRole.ErrorID OF
					arUSER_ERR_PARAMETER:
						
					arUSER_ERR_DOES_NOT_EXIST:
						ErrorInfo := 'User Role Returned from Login API Does NOT Exist on Traget System';
						LoginState := LOGIN_API_ERROR;
					arUSER_ERR_ALREADY_EXISTS:
						LoginState := USER_CREATED_SUCCESSS;
					arUSER_ERR_INTERNAL :
						ErrorInfo := 'Unknown Error Occured Setting User Permissions';
						LoginState := LOGIN_API_ERROR;
				END_CASE;
			END_IF;
	
		USER_CREATED_SUCCESSS:
			
			Done := TRUE;
			
		LOGIN_API_ERROR:
			
			GET_UserInfo.bEnable := FALSE;
			GET_UserInfo.bRequest := FALSE;
			POST_Login.bEnable := FALSE;
			POST_Login.bRequest := FALSE;
			HA_JSON_Parse.Enable := FALSE;
			ArUserSetPassword.Execute := FALSE;
			ArUserCreate.Execute := FALSE;
			ArUserAssignRole.Execute := FALSE;
			
			Error := TRUE;
		
	END_CASE;
	
	GET_UserInfo(HttpClientRef := HttpClientRef, RequestHeader := RequestHeader);
	POST_Login(HttpClientRef := HttpClientRef, RequestHeader := RequestHeader);
	HA_JSON_Parse();
	ArUserSetPassword();
	ArUserCreate();
	ArUserAssignRole();
	


END_FUNCTION_BLOCK
