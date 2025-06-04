
(* TODO: Add your comment here *)
FUNCTION_BLOCK POST_Login_FB
	
	IF bEnable AND NOT bEnabled THEN
		bEnabled	:= TRUE;
		Ressource	:= '/auth/jwt/create';
		RequestDataJson := CONCAT('{"username":"',username);
		RequestDataJson := CONCAT(	RequestDataJson,'","password":"');
		RequestDataJson := CONCAT(	RequestDataJson,password);
		RequestDataJson := CONCAT(	RequestDataJson,'"}');
		
		HttpClientRef.method 			:= httpMETHOD_POST;
		HttpClientRef.pUri 				:= ADR(Ressource);
		HttpClientRef.pRequestHeader	:= ADR(RequestHeader);
		HttpClientRef.pRequestData		:= ADR(RequestDataJson);
		HttpClientRef.requestDataLen	:= LEN(RequestDataJson)+2; //According to WireShark there is a /r/n in the packet that is not being accounted for which requires us to add 2 bytes to the length
		HttpClientRef.pResponseHeader	:= ADR(ResponseHeader);
		HttpClientRef.pResponseData 	:= ADR(ResponseData);
		HttpClientRef.responseDataSize	:= SIZEOF(ResponseData);
		
		RequestHeader.protocol			:= 'HTTP/1.1';
		RequestHeader.host				:= Host;
		RequestHeader.contentType		:= 'application/json';
		RequestHeader.contentLength		:=  LEN(RequestDataJson)+2; //According to WireShark there is a /r/n in the packet that is not being accounted for which requires us to add 2 bytes to the length
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
