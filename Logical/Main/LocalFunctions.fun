
{REDUND_ERROR} FUNCTION_BLOCK Post_Login (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
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
		ResponseData : {REDUND_UNREPLICABLE} STRING[2000];
	END_VAR
	VAR_IN_OUT
		HttpClientRef : httpsClient;
	END_VAR
	VAR
		RequestHeader : {REDUND_UNREPLICABLE} httpRequestHeader_t;
		Host : {REDUND_UNREPLICABLE} STRING[80];
		ResponseHeader : {REDUND_UNREPLICABLE} httpResponseHeader_t;
		Ressource : {REDUND_UNREPLICABLE} STRING[80];
		sHeader : {REDUND_UNREPLICABLE} STRING[300];
		bEnabled : {REDUND_UNREPLICABLE} BOOL;
		RequestDataJson : {REDUND_UNREPLICABLE} STRING[1000];
	END_VAR
END_FUNCTION_BLOCK
