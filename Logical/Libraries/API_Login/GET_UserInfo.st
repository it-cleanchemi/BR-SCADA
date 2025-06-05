(* TODO: Add your comment here *)
FUNCTION_BLOCK GET_UserInfo_FB
	
	IF bEnable AND NOT bEnabled THEN
		bEnabled	:= TRUE;
		sHeader		:= CONCAT('Authorization: Bearer ',sAuthorization);
		Ressource	:= '/auth/users/me/';
		
		HttpClientRef.option 			:= httpOPTION_HTTP_11;
		HttpClientRef.method 			:= httpMETHOD_GET;
		HttpClientRef.pUri 				:= ADR(Ressource);
		HttpClientRef.pRequestHeader	:= ADR(RequestHeader);
		HttpClientRef.pRequestData		:= ADR(RequestDataJson);
		HttpClientRef.requestDataLen	:= LEN(RequestDataJson);
		HttpClientRef.pResponseHeader	:= ADR(ResponseHeader);
		HttpClientRef.pResponseData 	:= ADR(ResponseData);
		HttpClientRef.responseDataSize	:= SIZEOF(ResponseData);
		
		RequestHeader.protocol			:= 'HTTP/1.1';
		RequestHeader.contentType		:= 'application/json';
		RequestHeader.contentLength		:=  LEN(RequestDataJson);
		RequestHeader.connection		:= 'keep-alive';
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