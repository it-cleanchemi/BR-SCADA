
FUNCTION_BLOCK API_Login_FB
	VAR_INPUT
		bEnable : BOOL;
		sUser : STRING[80];
		sPassword : STRING[80];
	END_VAR
	VAR_OUTPUT
		LoginState : LoginState_Enum;
		UserID : STRING[80];
		Password : STRING[80];
		Name : STRING[80];
		Authorization_Bearer : STRING[250];
	END_VAR
	VAR_IN_OUT
		RequestHeader : httpRequestHeader_t;
		HttpClientRef : httpsClient;
	END_VAR
	VAR
		IdxJSON : DINT;
		GET_UserInfo : GET_UserInfo_FB;
		POST_Login : POST_Login_FB;
		HA_JSON_Parse : HA_JSON_Parse;
		ArUserSetPassword : ArUserSetPassword;
		JSON_Parsed : ARRAY[0..MAX_JSON_PARSE_PAIR_IDX] OF HA_JSON_Parse_Pair_typ;
		ArUserCreate : ArUserCreate;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK POST_Login_FB (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		username : STRING[80];
		password : STRING[80];
		bEnable : BOOL;
		bRequest : BOOL;
	END_VAR
	VAR_OUTPUT
		Phase : UINT;
		Status : {REDUND_UNREPLICABLE} UINT;
		ResponseStatus : {REDUND_UNREPLICABLE} STRING[280];
		Authorization : STRING[200];
		ResponseData : {REDUND_UNREPLICABLE} STRING[2000];
	END_VAR
	VAR_IN_OUT
		HttpClientRef : httpsClient;
		RequestHeader : httpRequestHeader_t;
	END_VAR
	VAR
		Host : {REDUND_UNREPLICABLE} STRING[80];
		ResponseHeader : {REDUND_UNREPLICABLE} httpResponseHeader_t;
		Ressource : {REDUND_UNREPLICABLE} STRING[80];
		sHeader : {REDUND_UNREPLICABLE} STRING[300];
		bEnabled : {REDUND_UNREPLICABLE} BOOL;
		RequestDataJson : {REDUND_UNREPLICABLE} STRING[1000];
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK GET_UserInfo_FB (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		sAuthorization : STRING[250];
		bEnable : BOOL;
		bRequest : BOOL;
	END_VAR
	VAR_OUTPUT
		Phase : UINT;
		Status : {REDUND_UNREPLICABLE} UINT;
		ResponseStatus : {REDUND_UNREPLICABLE} STRING[280];
		ResponseData : {REDUND_UNREPLICABLE} STRING[2000];
	END_VAR
	VAR_IN_OUT
		HttpClientRef : httpsClient;
		RequestHeader : httpRequestHeader_t;
	END_VAR
	VAR
		Host : {REDUND_UNREPLICABLE} STRING[80];
		ResponseHeader : {REDUND_UNREPLICABLE} httpResponseHeader_t;
		Ressource : {REDUND_UNREPLICABLE} STRING[80];
		sHeader : {REDUND_UNREPLICABLE} STRING[400];
		bEnabled : {REDUND_UNREPLICABLE} BOOL;
		RequestDataJson : {REDUND_UNREPLICABLE} STRING[1000];
	END_VAR
END_FUNCTION_BLOCK
