
(* Formats DATE_AND_TIME Value into a string *)
FUNCTION HA_DT_Formatter
	HA_DT_Formatter 								:= TRUE;
	IF pOutString = 0 OR OutStringLength = 0 THEN
		HA_DT_Formatter 							:= FALSE;
	ELSE
		HA_DT_Formatter 							:= TRUE;
		Internal.output								:= '';
		Internal.formatLen 							:= brsstrlen(pInFormatString);
		IF pInFormatString = 0 OR Internal.formatLen = 0 OR Internal.formatLen > SIZEOF(Internal.format)-1 THEN
			Internal.format 						:= 'DT#y-m-d-h:M:s';
			Internal.formatLen 						:= brsstrlen(ADR(Internal.format));
		ELSE
			brsstrcpy(ADR(Internal.format),pInFormatString);
			Internal.formatLen 						:= brsstrlen(ADR(Internal.format));
		END_IF;
		DT_TO_DTStructure(value,ADR(Internal.dateTimeStruct));
		Internal.year 								:= UINT_TO_STRING(Internal.dateTimeStruct.year);
		Internal.month 								:= USINT_TO_STRING(Internal.dateTimeStruct.month);
		Internal.day 								:= USINT_TO_STRING(Internal.dateTimeStruct.day);
		Internal.hour 								:= USINT_TO_STRING(Internal.dateTimeStruct.hour);
		Internal.minute 							:= USINT_TO_STRING(Internal.dateTimeStruct.minute);
		Internal.second 							:= USINT_TO_STRING(Internal.dateTimeStruct.second);
		FOR Internal.i := 0 TO Internal.formatLen DO
			brsmemcpy(ADR(Internal.c),ADR(Internal.format)+Internal.i,1);
		    CASE Internal.c OF
		        121: //'y' 
					IF Internal.length + 4 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.year)) - ADR(Internal.output);
					END_IF;
		        109: //'m'
					IF Internal.length + 2 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						IF Internal.dateTimeStruct.month <= 9 THEN
							brsstrcat(ADR(Internal.output),ADR('0'));
						END_IF;
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.month)) - ADR(Internal.output);
					END_IF;
		        100: //'d' 
					IF Internal.length + 2 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						IF Internal.dateTimeStruct.day <= 9 THEN
							brsstrcat(ADR(Internal.output),ADR('0'));
						END_IF;
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.day)) - ADR(Internal.output);
					END_IF;
		        104: //'h' 
					IF Internal.length + 2 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						IF Internal.dateTimeStruct.hour <= 9 THEN
							brsstrcat(ADR(Internal.output),ADR('0'));
						END_IF;
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.hour)) - ADR(Internal.output);
					END_IF;
		        77: //'M' 
					IF Internal.length + 2 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						IF Internal.dateTimeStruct.minute <= 9 THEN
							brsstrcat(ADR(Internal.output),ADR('0'));
						END_IF;
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.minute)) - ADR(Internal.output);
					END_IF;
		        115: //'s' 
					IF Internal.length + 2 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						IF Internal.dateTimeStruct.second <= 9 THEN
							brsstrcat(ADR(Internal.output),ADR('0'));
						END_IF;
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.second)) - ADR(Internal.output);
					END_IF;
		        ELSE
					brsmemset(ADR(Internal.separator),0,SIZEOF(Internal.separator));
					brsmemcpy(ADR(Internal.separator),ADR(Internal.c),1);
					IF Internal.length + 1 >= OutStringLength-1 THEN
						Internal.output 			:= '';
						HA_DT_Formatter 			:= FALSE;
						RETURN;
					ELSE
						Internal.length				:= brsstrcat(ADR(Internal.output),ADR(Internal.separator)) - ADR(Internal.output);
					END_IF;
		    END_CASE
		END_FOR;
		IF NOT HA_DT_Formatter THEN
			brsmemset(pOutString,0,OutStringLength);
		ELSE
			brsstrcpy(pOutString,ADR(Internal.output));
		END_IF;
	END_IF;
END_FUNCTION
