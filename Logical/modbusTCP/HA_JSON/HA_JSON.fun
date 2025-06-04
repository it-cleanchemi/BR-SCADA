
{REDUND_ERROR} FUNCTION_BLOCK HA_JSON_PairsToJSON (*FB parses a JSON string into a flat array of Name and Value Pairs*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		pBuffer : UDINT; (*Pointer to Buffer*)
		BufferSIZEOF : UDINT; (*Buffer SIZEOF*)
		pPairs : UDINT; (*Pointer to Array defined as HA_JSON_Parse_Pair_typ[0..MAX_JSON_PARSE_PAIR_IDX]*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : HA_JSON_PairsToJSON_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_JSON_Parse (*FB parses a JSON string into a flat array of Name and Value Pairs*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		pBuffer : UDINT; (*Pointer to Buffer*)
		pPairs : UDINT; (*Pointer to Array defined as HA_JSON_Parse_Pair_typ[0..MAX_JSON_PARSE_PAIR_IDX]*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : HA_JSON_Parse_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
