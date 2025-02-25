
(* TODO: Add your comment here *)

FUNCTION IDEC_REAL_Conv
	
	brsmemmove(ADR(Real_Temp) + 2,ADR(REAL_FROM_IDEC),2);
	brsmemmove(ADR(Real_Temp),ADR(REAL_FROM_IDEC)+2,2);

	IDEC_REAL_Conv := Real_Temp;
	
END_FUNCTION



