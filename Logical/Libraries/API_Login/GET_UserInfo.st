(* TODO: Add your comment here *)
FUNCTION_BLOCK GET_UserInfo_FB
	
	IF bEnable AND NOT bEnabled THEN
		bEnabled	:= TRUE;
		sHeader		:= CONCAT('Authorization: Bearer ',sAuthorization);
		Ressource	:= '/auth/users/me/';
		Host		:= 'cci-api-development-wjc4fopyua-uc.a.run.app';
		
		HttpClientRef.option 			:= httpOPTION_HTTP_11;
		HttpClientRef.pHost 			:= ADR(Host);
		HttpClientRef.method 			:= httpMETHOD_GET;
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
		RequestHeader.rawHeader.dataLen	:= LEN(sHeader);
		RequestHeader.rawHeader.pData	:= ADR(sHeader);
		//	RequestHeader.userLine[0].name	:= 'Authorization';
		//	RequestHeader.userLine[0].value := CONCAT('Bearer ','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5MDYwOTYzLCJqdGkiOiJkNDg0MDAxMjM0MmE0YjJjYjQ2NzMwYjVhNGY1YTFmNyIsInVzZXJfaWQiOjEwfQ.AVaWOw9VqAKLQE9KLkQGM_h3jkvgIiEIJNefHxd0ypA');
		RequestHeader.userLine[1].name	:= 'User-Agent';
		RequestHeader.userLine[1].value := 'SCADA';

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