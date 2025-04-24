
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
			
	// force transfer
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
	gSkid[IdxSkids].Pmax_General_Variables.NAOH_CONC:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[11]);
	gSkid[IdxSkids].Pmax_General_Variables.NAOH_CONC_OD:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[12]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[13]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC_OD:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[14]);
	
	gSkid[IdxSkids].Pmax_Pump_101.P101_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[21]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PV:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[22]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[23]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_FQ:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[24]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_TI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[25]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[26]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[27]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[28]);
	
	gSkid[IdxSkids].Pmax_Pump_101B.P101B_OP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[35]);
	gSkid[IdxSkids].Pmax_Pump_101B.P101B_PFI:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[36]);
	gSkid[IdxSkids].Pmax_Pump_101B.P101B_SP:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[37]);
	gSkid[IdxSkids].Pmax_Pump_101B.P101B_LS:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Real[38]);
	
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
	
	gSkid[IdxSkids].Dosing_Pump_201.P201_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[6];
	gSkid[IdxSkids].Dosing_Pump_201.P201_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[8];
	gSkid[IdxSkids].Dosing_Pump_201.P201_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[10];
	
	gSkid[IdxSkids].Dosing_Pump_202.P202_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[16];
	gSkid[IdxSkids].Dosing_Pump_202.P202_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[18];
	gSkid[IdxSkids].Dosing_Pump_202.P202_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[20];
	
	gSkid[IdxSkids].Dosing_Pump_203.P203_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[26];
	gSkid[IdxSkids].Dosing_Pump_203.P203_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[28];
	gSkid[IdxSkids].Dosing_Pump_203.P203_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[30];
	
	gSkid[IdxSkids].Dosing_Pump_204.P204_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[36];
	gSkid[IdxSkids].Dosing_Pump_204.P204_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[38];
	gSkid[IdxSkids].Dosing_Pump_204.P204_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[40];
	
	gSkid[IdxSkids].Dosing_Pump_205.P205_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[46];
	gSkid[IdxSkids].Dosing_Pump_205.P205_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[48];
	gSkid[IdxSkids].Dosing_Pump_205.P205_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[50];
	
	gSkid[IdxSkids].Dosing_Pump_206.P206_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[56];
	gSkid[IdxSkids].Dosing_Pump_206.P206_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[58];
	gSkid[IdxSkids].Dosing_Pump_206.P206_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[60];
	
	gSkid[IdxSkids].Dosing_Pump_207.P207_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[66];
	gSkid[IdxSkids].Dosing_Pump_207.P207_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[68];
	gSkid[IdxSkids].Dosing_Pump_207.P207_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[70];
	
	gSkid[IdxSkids].Dosing_Pump_208.P208_XS := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[76];
	gSkid[IdxSkids].Dosing_Pump_208.P208_HOA := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[78];
	gSkid[IdxSkids].Dosing_Pump_208.P208_CHEM := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[80];
	
	gSkid[IdxSkids].Sensor_Variables.SERNSORS_CONFIG := gModbus[IdxSkids].Modbus_Dosing.Block6_Int[86];
	
	// AS Block 7 - 7000 DOSING INT - SPARE
	//:= gModbus[IdxSkids].Modbus_Dosing.Block7_Int[0];
	
	// AS Block 8 - 7000 DOSING REAL
	gSkid[IdxSkids].Dosing_Pump_201.P201_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[1]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[2]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[3]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[4]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[5]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[6]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[7]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[8]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[9]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[10]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[11]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[12]);
	gSkid[IdxSkids].Dosing_Pump_201.P201_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[13]);
	
	gSkid[IdxSkids].Dosing_Pump_202.P202_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[19]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[20]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[21]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[22]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[23]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[24]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[25]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[26]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[27]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[28]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[29]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[30]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[31]);
	gSkid[IdxSkids].Dosing_Pump_202.P202_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[32]);
	
	gSkid[IdxSkids].Dosing_Pump_203.P203_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[38]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[39]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[40]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[41]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[42]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[43]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[44]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[45]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[46]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[47]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[48]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[49]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[50]);
	gSkid[IdxSkids].Dosing_Pump_203.P203_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[51]);
	
	gSkid[IdxSkids].Dosing_Pump_204.P204_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[57]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[58]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[59]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[60]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[61]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block8_Real[62]);
	
	// AS Block 9 - 7000 DOSING REAL
	gSkid[IdxSkids].Dosing_Pump_204.P204_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[1]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[2]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[3]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[4]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[5]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[6]);
	gSkid[IdxSkids].Dosing_Pump_204.P204_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[7]);
	
	
	gSkid[IdxSkids].Dosing_Pump_205.P205_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[13]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[14]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[15]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[16]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[17]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[18]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[19]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[20]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[21]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[22]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[23]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[24]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[25]);
	gSkid[IdxSkids].Dosing_Pump_205.P205_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[26]);
	
	gSkid[IdxSkids].Dosing_Pump_206.P206_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[32]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[33]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[34]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[35]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[36]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[37]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[38]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[39]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[40]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[41]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[42]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[43]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[44]);
	gSkid[IdxSkids].Dosing_Pump_206.P206_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[45]);
	
	gSkid[IdxSkids].Dosing_Pump_207.P207_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[51]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[52]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[53]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[54]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[55]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[56]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[57]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[58]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[59]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[60]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[61]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block9_Real[62]);
	
	// AS Block 10 - 7000 DOSING REAL
	gSkid[IdxSkids].Dosing_Pump_207.P207_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_207.P207_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[1]);
	
	gSkid[IdxSkids].Dosing_Pump_208.P208_REF_SENSOR := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[7]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[8]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[9]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[10]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[11]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[12]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[13]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[14]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[15]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[16]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[17]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[18]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[19]);
	gSkid[IdxSkids].Dosing_Pump_208.P208_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[20]);
	
	gSkid[IdxSkids].Sensor_Variables.SENSOR301 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[26]);
	gSkid[IdxSkids].Sensor_Variables.SENSOR302 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[27]);
	gSkid[IdxSkids].Sensor_Variables.SENSOR303 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[28]);
	gSkid[IdxSkids].Sensor_Variables.SENSOR304 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[29]);
	
	gSkid[IdxSkids].Sensor_Variables.FI301 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[34]);
	gSkid[IdxSkids].Sensor_Variables.FI301_QT := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[35]);
	gSkid[IdxSkids].Sensor_Variables.FI302 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[36]);
	gSkid[IdxSkids].Sensor_Variables.FI302_QT := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[37]);
	gSkid[IdxSkids].Sensor_Variables.FI303 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[38]);
	gSkid[IdxSkids].Sensor_Variables.FI303_QT := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[39]);
	gSkid[IdxSkids].Sensor_Variables.FI304 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[40]);
	gSkid[IdxSkids].Sensor_Variables.FI304_QT := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block10_Real[41]);
	
	// AS Block 11 - 7000 DOSING REAL - SPARE
	//:= IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block11_Real[0]);
	
	// AS Block 48 - ALARMS
	//gSkid[IdxSkids].Alarms.ALARM_AB1 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[0];
	//gSkid[IdxSkids].Alarms.ALARM_AB2 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[1];
	gSkid[IdxSkids].Alarms.ALARM_AB3 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[2];
	gSkid[IdxSkids].Alarms.ALARM_AB4 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[3];
	gSkid[IdxSkids].Alarms.ALARM_AB5 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[4];
	gSkid[IdxSkids].Alarms.ALARM_AB6 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[5];
	gSkid[IdxSkids].Alarms.ALARM_AB7 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[6];
	gSkid[IdxSkids].Alarms.ALARM_AB8 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[7];
	gSkid[IdxSkids].Alarms.ALARM_P102 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[13];
	gSkid[IdxSkids].Alarms.ALARM_P103 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[14];
	gSkid[IdxSkids].Alarms.ALARM_P104 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[15];
	gSkid[IdxSkids].Alarms.ALARM_P201 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[16];
	gSkid[IdxSkids].Alarms.ALARM_P202 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[17];
	gSkid[IdxSkids].Alarms.ALARM_P203 := gModbus[IdxSkids].Modbus_Alarms.Block48_Int[18];
	

	//Set Unit Number and Add Alarms
	IF gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID <> 0 AND (gUnit[IdxSkids] <> gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID) THEN
		gUnit[IdxSkids] := gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID;
		
		gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
		gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
		
		gSkid[IdxSkids].i := 1;
		
		SkidNumberINT := UINT_TO_STRING(gUnit[IdxSkids]);
		
		gVis.Alarms.Active.FilterString[IdxSkids] := CONCAT('[{"value":',SkidNumberINT);
		gVis.Alarms.Active.FilterString[IdxSkids] :=  CONCAT(gVis.Alarms.Active.FilterString[IdxSkids] ,',"conditionType":"==","columnPosition":1}]');
		
	ELSIF gUnit[IdxSkids] <> 0 AND gVis.Alarms.Active.FilterString[IdxSkids] = '' THEN
		
		SkidNumberINT := UINT_TO_STRING(gUnit[IdxSkids]);
		
		gVis.Alarms.Active.FilterString[IdxSkids] := CONCAT('[{"value":',SkidNumberINT);
		gVis.Alarms.Active.FilterString[IdxSkids] :=  CONCAT(gVis.Alarms.Active.FilterString[IdxSkids] ,',"conditionType":"==","columnPosition":1}]');

	END_IF;
	
END_ACTION
