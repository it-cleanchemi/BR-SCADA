
ACTION Modbus_Status_action: 
	
	ModbusTcpMaster[IdxSkids]();
			
	// --------------------------------------------------------------------
	// Reset last error information
	// --------------------------------------------------------------------
	IF(reset_error) THEN
		brsmemset(ADR(ModbusTcpMaster[IdxSkids].last_error), 0, 2);
		reset_error := 0;
	END_IF
			
			
			
	// --------------------------------------------------------------------
	// Final Variable Mapping AND Data Conversion - READ
	// --------------------------------------------------------------------	
				
	
	// AS Block 1 - 6000 DOSING INT
	gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[0];
	gSkid[IdxSkids].Pmax_General_Variables.USER_ID := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[2];
	gSkid[IdxSkids].Pmax_General_Variables.USER_ACCESS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[4];
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_HOA := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[6];
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_STATUS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[8];
	
	gSkid[IdxSkids].Pmax_Pump_101.P101_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[20];
	
	gSkid[IdxSkids].Pmax_Pump_102.P102_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[26];
	
	gSkid[IdxSkids].Pmax_Pump_103.P103_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[32];
	
	gSkid[IdxSkids].Pmax_Pump_104.P104_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[38];
	
	gSkid[IdxSkids].Pmax_Alarms.PMAX_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[84];
	gSkid[IdxSkids].Pmax_Alarms.P101_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[86];
	gSkid[IdxSkids].Pmax_Alarms.P101B_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[88];
	gSkid[IdxSkids].Pmax_Alarms.P102_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[90];
	gSkid[IdxSkids].Pmax_Alarms.P103_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[92];
	gSkid[IdxSkids].Pmax_Alarms.P104_ALARM := gModbus[IdxSkids].Modbus_PeroxyMAX.Block1_Int[94];
	
	// AS Block 2 - 6000 DOSING INT - SPARE
	//:= gModbus[IdxSkids].Modbus_PeroxyMAX.Block2_Int[0];
	
	// AS Block 3 - 6000 DOSING REAL
	gSkid[IdxSkids].ConversionRatios.EFF_1:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[0]);
	gSkid[IdxSkids].ConversionRatios.EFF_2:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[1]);
	gSkid[IdxSkids].ConversionRatios.NAOH_TO_H2O2:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[2]);
	gSkid[IdxSkids].ConversionRatios.TRI_TO_H2O2:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[3]);
	gSkid[IdxSkids].ConversionRatios.NAOH_TO_TRI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[4]);
	
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_CONC:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[8]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_RATE:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[9]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[10]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[11]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC_OD:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[12]);
	gSkid[IdxSkids].Pmax_General_Variables.NAOH_CONC:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[13]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC_OD:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[14]);
	
	gSkid[IdxSkids].Pmax_Pump_101.P101_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[21]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[22]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[23]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_FQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[24]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[25]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[26]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[27]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[28]);
	
	*INSERT*
	
	gSkid[IdxSkids].Pmax_Pump_102.P102_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[45]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[46]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[47]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[48]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_FQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[49]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[50]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PPI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[51]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[52]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[53]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[54]);
	
	gSkid[IdxSkids].Pmax_Pump_103.P103_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[59]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[60]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[61]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[62]);
	
	// AS Block 4 - 6000 DOSING REAL
	gSkid[IdxSkids].Pmax_Pump_103.P103_FQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[0]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[1]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PPI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[2]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[3]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[4]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[5]);
	
	gSkid[IdxSkids].Pmax_Pump_104.P104_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[10]);
	
	gSkid[IdxSkids].Pmax_Pump_104.P104_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[11]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[12]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[13]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_FQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[14]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[15]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PPI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[16]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[17]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[18]);
	
	gSkid[IdxSkids].Sensor_Variables.CD101:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[24]);
	gSkid[IdxSkids].Sensor_Variables.CD101_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[25]);
	gSkid[IdxSkids].Sensor_Variables.CD102:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[26]);
	gSkid[IdxSkids].Sensor_Variables.CD102_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[27]);
	gSkid[IdxSkids].Sensor_Variables.CD103:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[28]);
	gSkid[IdxSkids].Sensor_Variables.CD103_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[29]);
	
	gSkid[IdxSkids].Sensor_Variables.CD101_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[36]);
	gSkid[IdxSkids].Sensor_Variables.CD102_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[37]);
	gSkid[IdxSkids].Sensor_Variables.CD103_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[38]);
	
	gSkid[IdxSkids].BufferTank.LI200:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[51]);
	gSkid[IdxSkids].BufferTank.LSHH200:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[52]);
	gSkid[IdxSkids].BufferTank.DRAINTIME_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[53]);
	gSkid[IdxSkids].BufferTank.DRAINTIME_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[54]);
	gSkid[IdxSkids].BufferTank.FILLTIME_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[55]);
	gSkid[IdxSkids].BufferTank.FILLTIME_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	
	// AS Block 5 - 6000 DOSING REAL - SPARE
	//:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block5_Real[0]);
	
	// AS Block 6 - 7000 DOSING INT
	gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID_DOSE := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[0];
	
	// AS Block 7 - 7000 DOSING INT - SPARE
	//:= gModbus[IdxSkids].Modbus_Dosing.Block7_Int[0];
	
	// AS Block 8 - 7000 DOSING REAL
	gSkid[IdxSkids].:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	
	// AS Block 9 - 7000 DOSING REAL
	gSkid[IdxSkids].BufferTank.FILLTIME_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	
	// AS Block 10 - 7000 DOSING REAL
	gSkid[IdxSkids].BufferTank.FILLTIME_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	
	// AS Block 11 - 7000 DOSING REAL - SPARE
	:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	


END_ACTION
