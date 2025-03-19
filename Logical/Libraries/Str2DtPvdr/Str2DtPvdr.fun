
{REDUND_ERROR} FUNCTION WString2DataProvider : BOOL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		SourceString : UDINT;
		Value : UDINT;
		TargetString : UDINT;
	END_VAR
	VAR
		Value_String : WSTRING[40];
	END_VAR
END_FUNCTION

FUNCTION StepListElementCreator : BOOL
	VAR_INPUT
		SourceString : UDINT;
		Index : DINT;
		TargetString : UDINT;
	END_VAR
	VAR
		IndexString : STRING[80];
		IndexWString : WSTRING[80];
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION String2DataProvider : BOOL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		SourceString : UDINT;
		TargetString : UDINT;
	END_VAR
END_FUNCTION
