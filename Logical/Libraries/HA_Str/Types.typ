
TYPE
	HA_brsstrcat_Internal_typ : 	STRUCT 
		SrcSize : UDINT;
		DestSize : UDINT;
	END_STRUCT;
	HA_Find_Extract_Internal_typ : 	STRUCT 
		i : UDINT;
		sB : UDINT;
		sSL : UDINT;
		sSR : UDINT;
		Len : UDINT;
		Pos : UDINT;
		P1 : DINT;
		P2 : DINT;
	END_STRUCT;
	HA_Find_S_Internal_typ : 	STRUCT 
		i : UDINT;
		sB : UDINT;
		sS : UDINT;
	END_STRUCT;
	HA_Find_R_Internal_typ : 	STRUCT 
		i : UDINT;
		sB : UDINT;
		sS : UDINT;
	END_STRUCT;
	HA_Find_L_Internal_typ : 	STRUCT 
		i : UDINT;
		sB : UDINT;
		sS : UDINT;
	END_STRUCT;
END_TYPE
