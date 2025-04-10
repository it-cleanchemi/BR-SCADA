
TYPE
	HA_Sim_Actuator_TF_Internal_typ : 	STRUCT 
		Active : BOOL;
		OldDampingRatio : REAL;
		OldNaturalFreq : REAL;
		OldFullStrokeValue : REAL;
		MTBasicsTransferFcn_0 : MTBasicsTransferFcn;
	END_STRUCT;
	HA_Sim_Actuator_Lin_Internal_typ : 	STRUCT 
		Active : BOOL;
		OldTimePos : REAL;
		OldTimeNeg : REAL;
		MTBasicsLimiter_0 : MTBasicsLimiter;
	END_STRUCT;
END_TYPE
