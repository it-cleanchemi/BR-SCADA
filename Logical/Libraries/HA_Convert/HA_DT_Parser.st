
(* Parses string into DATE_AND_TIME format !!!!!STRING MUST BE IN THE FORM OF DT#yyyy-mm-dd-hh:MM:ss!!!!! all other will fail*)
FUNCTION HA_DT_Parser
	HA_DT_Parser 						:= TRUE;
	IF pOutDT = 0 OR pValueString = 0 THEN
		HA_DT_Parser 					:= FALSE;
	ELSE
		HA_DT_Parser					:= TRUE;
		brsmemset(ADR(Internal),0,SIZEOF(Internal));
		brsmemcpy(ADR(Internal.year),pValueString+3,4);
		brsmemcpy(ADR(Internal.month),pValueString+8,2);
		brsmemcpy(ADR(Internal.day),pValueString+11,2);
		brsmemcpy(ADR(Internal.hour),pValueString+14,2);
		brsmemcpy(ADR(Internal.minute),pValueString+17,2);
		brsmemcpy(ADR(Internal.second),pValueString+20,2);
		Internal.dateTimeStruct.year	:= STRING_TO_UINT(Internal.year);
		Internal.dateTimeStruct.month	:= STRING_TO_USINT(Internal.month);
		Internal.dateTimeStruct.day		:= STRING_TO_USINT(Internal.day);
		Internal.dateTimeStruct.hour	:= STRING_TO_USINT(Internal.hour);
		Internal.dateTimeStruct.minute	:= STRING_TO_USINT(Internal.minute);
		Internal.dateTimeStruct.second	:= STRING_TO_USINT(Internal.second);
		Internal.DateTime := DTStructure_TO_DT(ADR(Internal.dateTimeStruct));
		brsmemcpy(pOutDT,ADR(Internal.DateTime),SIZEOF(Internal.DateTime));
	END_IF;
END_FUNCTION
