
TYPE
	HA_DT_Parser_Internal_typ : 	STRUCT 
		DateTime : DATE_AND_TIME;
		dateTimeStruct : DTStructure;
		year : STRING[4];
		month : STRING[2];
		day : STRING[2];
		hour : STRING[2];
		minute : STRING[2];
		second : STRING[2];
	END_STRUCT;
	HA_DT_Formatter_Internal_typ : 	STRUCT 
		dateTimeStruct : DTStructure;
		year : STRING[4];
		month : STRING[2];
		day : STRING[2];
		hour : STRING[2];
		minute : STRING[2];
		second : STRING[2];
		separator : STRING[1];
		c : USINT;
		i : UDINT;
		formatLen : UDINT;
		format : STRING[80];
		output : STRING[80];
		length : UDINT;
	END_STRUCT;
END_TYPE
