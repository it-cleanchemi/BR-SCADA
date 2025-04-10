
{REDUND_ERROR} FUNCTION_BLOCK HA_Sim_Actuator_Lin (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		Actuate : BOOL;
		FullStrokeValue : REAL;
		FeedbackTol : REAL;
		TimeNeg : REAL;
		TimePos : REAL;
	END_VAR
	VAR_OUTPUT
		Position : REAL;
		AtFalsePosition : BOOL;
		AtTruePosition : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : HA_Sim_Actuator_Lin_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_Sim_Actuator_TF (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		Actuate : BOOL;
		ClampValueToEnds : BOOL;
		FullStrokeValue : REAL;
		FeedbackTol : REAL;
		NaturalFreq : REAL;
		DampingRatio : REAL;
	END_VAR
	VAR_OUTPUT
		Position : REAL;
		AtFalsePosition : BOOL;
		AtTruePosition : BOOL;
		Error : BOOL;
	END_VAR
	VAR
		Internal : HA_Sim_Actuator_TF_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
