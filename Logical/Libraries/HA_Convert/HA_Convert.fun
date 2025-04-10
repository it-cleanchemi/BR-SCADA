
FUNCTION HA_DT_Parser : BOOL
	VAR_INPUT
		pValueString : UDINT;
		pOutDT : UDINT;
	END_VAR
	VAR
		Internal : HA_DT_Parser_Internal_typ;
	END_VAR
END_FUNCTION

FUNCTION HA_DT_Formatter : BOOL
	VAR_INPUT
		value : DATE_AND_TIME;
		pInFormatString : UDINT; (*Optional*)
		pOutString : UDINT;
		OutStringLength : UDINT;
	END_VAR
	VAR
		Internal : HA_DT_Formatter_Internal_typ;
	END_VAR
END_FUNCTION
