
{REDUND_ERROR} FUNCTION SRAND : BOOL (*seed function*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Seed : UINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION DRAND : DINT (*Generates random number between (low,high)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Low : DINT;
		High : DINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION RRAND : LREAL (*Generates random number between (low,high)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Low : LREAL;
		High : LREAL;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION RAND : INT (*Generates random number*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
END_FUNCTION
