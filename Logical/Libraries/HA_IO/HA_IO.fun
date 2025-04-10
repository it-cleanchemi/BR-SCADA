
{REDUND_ERROR} FUNCTION_BLOCK HA_IO_DO (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Logical : BOOL;
		Forcing : HA_IO_Digital_Forcing_typ;
		Par : HA_IO_Digital_Par_typ;
	END_VAR
	VAR_OUTPUT
		Signal : HA_IO_Digital_Signal_typ;
	END_VAR
	VAR
		Internal : HA_IO_Digital_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_IO_DI (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		IOMapping : BOOL;
		Forcing : HA_IO_Digital_Forcing_typ;
		Par : HA_IO_Digital_Par_typ;
		Sim : HA_IO_Digital_Sim_typ;
	END_VAR
	VAR_OUTPUT
		Signal : HA_IO_Digital_Signal_typ;
	END_VAR
	VAR
		Internal : HA_IO_Digital_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_IO_AI (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		VarType : HA_IO_ANALOG_TYPE_ENUM;
		IOMapping : HA_IO_Analog_Mapping_typ;
		Forcing : HA_IO_Analog_Forcing_typ;
		Sim : HA_IO_Analog_Sim_typ;
		Par : HA_IO_Analog_Par_typ;
	END_VAR
	VAR_OUTPUT
		Signal : HA_IO_Analog_Signal_typ;
	END_VAR
	VAR
		Internal : HA_IO_Analog_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK HA_IO_AO (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		VarType : HA_IO_ANALOG_TYPE_ENUM;
		Logical : LREAL;
		Forcing : HA_IO_Analog_Forcing_typ;
		Par : HA_IO_Analog_Par_typ;
	END_VAR
	VAR_OUTPUT
		Signal : HA_IO_Analog_Signal_typ;
	END_VAR
	VAR
		Internal : HA_IO_Analog_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
