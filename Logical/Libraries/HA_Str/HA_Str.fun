
FUNCTION HA_brsstrcat : BOOL
	VAR_INPUT
		pDest : UDINT;
		pSrc : UDINT;
		DestSize : UDINT;
	END_VAR
	VAR
		Internal : HA_brsstrcat_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Find_L : DINT (*Returns index of substring. Negative values are Errors.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		pSearch : UDINT;
	END_VAR
	VAR
		Internal : HA_Find_L_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Find_R : DINT (*Returns right index of substring. Negative values are Errors.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		pSearch : UDINT;
	END_VAR
	VAR
		Internal : HA_Find_R_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Find_S : DINT (*Returns right index of substring. Negative values are Errors.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		pSearch : UDINT;
	END_VAR
	VAR
		Internal : HA_Find_S_Internal_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Find_Extract : DINT (*Returns end position for next search. Negative values are Errors.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		pSearchL : UDINT;
		pSearchR : UDINT;
		pExtractADR : UDINT;
		pExtractSIZEOF : UDINT;
	END_VAR
	VAR
		Internal : HA_Find_Extract_Internal_typ;
	END_VAR
END_FUNCTION
