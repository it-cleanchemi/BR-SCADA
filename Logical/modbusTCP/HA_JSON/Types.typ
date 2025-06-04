
TYPE
	HA_JSON_PairsToJSON_Internal_typ : 	STRUCT 
		Depth : DINT;
		DepthArrayIdx : ARRAY[0..MAX_JSON_PARSE_DEPTH_IDX]OF DINT;
		Enabled : BOOL;
		j : DINT;
		i : DINT;
		Pair : HA_JSON_Parse_Pair_typ;
	END_STRUCT;
	HA_JSON_Parse_Internal_typ : 	STRUCT 
		Depth : DINT;
		DepthArrayIdx : ARRAY[0..MAX_JSON_PARSE_DEPTH_IDX]OF DINT;
		DepthIDs : ARRAY[0..MAX_JSON_PARSE_DEPTH_IDX]OF STRING[MAX_JSON_PARSE_NAME_LEN];
		Marker : UDINT;
		InValueNonWhiteFound : BOOL;
		InValue : BOOL;
		InQuote : BOOL;
		QuoteIsDouble : BOOL;
		Send : BOOL;
		Idx : DINT;
		i : DINT;
		Enabled : BOOL;
		BufferLEN : UDINT;
		Pair : HA_JSON_Parse_Pair_typ;
	END_STRUCT;
	HA_JSON_Parse_Pair_typ : 	STRUCT 
		Name : STRING[MAX_JSON_PARSE_NAME_LEN];
		Value : STRING[MAX_JSON_PARSE_VALUE_LEN];
	END_STRUCT;
END_TYPE
