
(* TODO: Add your comment here *)
FUNCTION WString2DataProvider
	
	brwcscpy(TargetString, ADR("{$"value$":$""));
	Value_String := UDINT_TO_WSTRING(Value);
	brwcscat(TargetString, ADR(Value_String));
	brwcscat(TargetString, ADR("$",$"text$":$""));
	brwcscat(TargetString, SourceString);
	brwcscat(TargetString, ADR("$"}"));

	WString2DataProvider := TRUE;
END_FUNCTION

FUNCTION String2DataProvider
	brsstrcpy (TargetString, ADR('{$'value$':$''));
	brsstrcat(TargetString, SourceString);
	brsstrcat(TargetString, ADR('$',$'text$':$''));
	brsstrcat(TargetString, SourceString);
	brsstrcat(TargetString, ADR('$'}'));

	String2DataProvider := TRUE;
END_FUNCTION

FUNCTION StepListElementCreator
	brwcscpy(TargetString, ADR("Step "));
	brsitoa(Index,ADR(IndexString));
	IndexWString:=STRING_TO_WSTRING(IndexString);
	brwcscat(TargetString, ADR(IndexWString));
	brwcscat(TargetString, ADR(": "));
	brwcscat(TargetString, SourceString);

	StepListElementCreator := TRUE;
END_FUNCTION
