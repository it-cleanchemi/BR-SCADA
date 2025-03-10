
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
				
	
	// AS Block 1 - 7000 DOSING INT
	gSkid[IdxSkids].Pmax_General_Variables.UNIT_ID := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[0];
	
	gSkid[IdxSkids].Dosing_Pump_201.P201_XS := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[10];
	gSkid[IdxSkids].Dosing_Pump_201.P201_HOA := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[12];
	
	gSkid[IdxSkids].Dosing_Pump_202.P202_XS := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[20];
	gSkid[IdxSkids].Dosing_Pump_202.P202_HOA := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[22];
	
	gSkid[IdxSkids].Dosing_Pump_203.P203_XS := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[30];
	gSkid[IdxSkids].Dosing_Pump_203.P203_HOA := gModbus[IdxSkids].Modbus_Dosing.Block1_Int[32];


	// AS Block 2 - 7000 DOSING REAL
	gSkid[IdxSkids].Dosing_Pump_201.P201_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[0]);			
	gSkid[IdxSkids].Dosing_Pump_201.P201_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[1]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[2]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[3]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[4]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[5]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[6]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[7]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[8]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[9]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[10]);	
	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[15]);			
	gSkid[IdxSkids].Dosing_Pump_202.P202_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[16]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[17]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[18]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[19]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[20]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[21]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[22]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[23]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[24]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[25]);
	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[30]);			
	gSkid[IdxSkids].Dosing_Pump_203.P203_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[31]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[32]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[33]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[34]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[35]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[36]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[37]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[38]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[39]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[40]);
	
	gSkid[IdxSkids].Sensor_Variables.FI301 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[45]);
	gSkid[IdxSkids].Sensor_Variables.FI302 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[47]);
	gSkid[IdxSkids].Sensor_Variables.FI303 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[49]);
	
	
	// AS Block 3 - 6000 DOSING INT
	gSkid[IdxSkids].Pmax_General_Variables.USER_ID := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[0];	
	gSkid[IdxSkids].Pmax_General_Variables.USER_ACCESS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[2];
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_HOA := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[10];
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_STATUS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[12];
	gSkid[IdxSkids].Pmax_Pump_101.P101_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[20];
	gSkid[IdxSkids].Pmax_Pump_102.P102_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[30];
	gSkid[IdxSkids].Pmax_Pump_103.P103_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[40];
	gSkid[IdxSkids].Pmax_Pump_104.P104_XS := gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[50];
	
	
	// AS Block 4 - 6000 DOSING REAL
	gSkid[IdxSkids].ConversionRatios.EFF_1 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[0]);
	gSkid[IdxSkids].ConversionRatios.EFF_2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[1]);
	gSkid[IdxSkids].ConversionRatios.NAOH_TO_H2O2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[2]);
	gSkid[IdxSkids].ConversionRatios.TRI_TO_H2O2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[3]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[4]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_RATE := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[5]);
	gSkid[IdxSkids].Pmax_General_Variables.NAOH_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[6]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[7]);
	
	gSkid[IdxSkids].Pmax_Pump_101.P101_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[10]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[11]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[12]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[13]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[14]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[15]);
	
	gSkid[IdxSkids].Pmax_Pump_102.P102_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[20]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[21]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[22]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[23]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[24]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[25]);
	
	gSkid[IdxSkids].Pmax_Pump_103.P103_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[30]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[31]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[32]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[33]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[34]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[35]);
	
	gSkid[IdxSkids].Pmax_Pump_104.P104_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[40]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[41]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[42]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[43]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[44]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[45]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[46]);
	
	gSkid[IdxSkids].Sensor_Variables.CD101 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[50]);
	gSkid[IdxSkids].Sensor_Variables.CD101_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[51]);
	gSkid[IdxSkids].Sensor_Variables.CD102 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[52]);
	gSkid[IdxSkids].Sensor_Variables.CD102_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[53]);
	gSkid[IdxSkids].Sensor_Variables.CD101_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[54]);
	gSkid[IdxSkids].Sensor_Variables.CD102_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[55]);
	gSkid[IdxSkids].BufferTank.LI200 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[56]);
	gSkid[IdxSkids].BufferTank.LSHH200 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[57]);


END_ACTION
