
(* TODO: Add your comment here *)
FUNCTION_BLOCK Post_Login
	
	IF bEnable AND NOT bEnabled THEN
		bEnabled	:= TRUE;
		sHeader		:= '';
		Ressource	:= '/auth/jwt/create';
		Host		:= 'https://cci-api-development-wjc4fopyua-uc.a.run.app';
		//sHeader		:= CONCAT('Authorization: ',sAuthorization);
		RequestDataJson :='{"username": "m.gogela@cleanchemi.com","password": "Fire1776"}';
		
		HttpClientRef.option 			:= httpOPTION_HTTP_11;
		HttpClientRef.pHost 			:= ADR(Host);
		HttpClientRef.method 			:= httpMETHOD_POST;
		HttpClientRef.pUri 				:= ADR(Ressource);
		HttpClientRef.pRequestHeader	:= ADR(RequestHeader);
		HttpClientRef.pRequestData		:= ADR(RequestDataJson);
		HttpClientRef.requestDataLen	:= LEN(RequestDataJson); 
		HttpClientRef.pResponseHeader	:= ADR(ResponseHeader);
		HttpClientRef.pResponseData 	:= ADR(ResponseData);
		HttpClientRef.responseDataSize	:= SIZEOF(ResponseData);
		
		RequestHeader.protocol			:= 'HTTP/1.1';
		RequestHeader.host				:= Host;
		RequestHeader.contentType		:= 'application/json';
		RequestHeader.contentLength		:=  LEN(RequestDataJson);
		RequestHeader.connection		:= 'keep-alive';
		RequestHeader.userLine[0].name	:= 'Accept-Language';
		RequestHeader.userLine[0].value	:= 'en_US';
		RequestHeader.userLine[1].name	:= 'Accept';
		RequestHeader.userLine[1].value	:= 'application/json';
		RequestHeader.rawHeader.dataLen	:= LEN(sHeader);
		RequestHeader.rawHeader.pData	:= ADR(sHeader);

	ELSIF bEnable AND bEnabled THEN
		HttpClientRef.enable	:= TRUE;
		IF bRequest THEN
			HttpClientRef.send	:= TRUE;
		END_IF
	ELSIF NOT bEnable AND bEnabled THEN
		bEnabled	:= FALSE;
		bRequest	:= FALSE;
		HttpClientRef.enable	:= FALSE;
		HttpClientRef.send	:= FALSE;
	END_IF

	HttpClientRef();
	
	Status := HttpClientRef.status;
	Phase := HttpClientRef.phase;
	ResponseStatus := ResponseHeader.status;
	
END_FUNCTION_BLOCK
