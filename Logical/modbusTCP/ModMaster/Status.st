
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
	gSkid[IdxSkids].Dosing_Pump_201.P201_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[2]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[4]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[6]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[8]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[10]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[12]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[14]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[16]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[18]);	
	gSkid[IdxSkids].Dosing_Pump_201.P201_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[20]);	
	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[30]);			
	gSkid[IdxSkids].Dosing_Pump_202.P202_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[32]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[34]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[36]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[38]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[40]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[42]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[44]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[46]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[48]);	
	gSkid[IdxSkids].Dosing_Pump_202.P202_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[50]);
	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[60]);			
	gSkid[IdxSkids].Dosing_Pump_203.P203_APPM := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[62]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[64]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[66]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[68]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[70]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[72]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[74]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[76]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[78]);	
	gSkid[IdxSkids].Dosing_Pump_203.P203_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[80]);
	
	gSkid[IdxSkids].Sensor_Variables.FI301 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[90]);
	gSkid[IdxSkids].Sensor_Variables.FI302 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[94]);
	gSkid[IdxSkids].Sensor_Variables.FI303 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[98]);
	
	
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
	gSkid[IdxSkids].ConversionRatios.EFF_2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[2]);
	gSkid[IdxSkids].ConversionRatios.NAOH_TO_H2O2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[4]);
	gSkid[IdxSkids].ConversionRatios.TRI_TO_H2O2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[6]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[8]);
	gSkid[IdxSkids].Pmax_General_Variables.PMAX_RATE := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[10]);
	gSkid[IdxSkids].Pmax_General_Variables.HP_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[12]);
	gSkid[IdxSkids].Pmax_General_Variables.NAOH_CONC := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[14]);
	
	gSkid[IdxSkids].Pmax_Pump_101.P101_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[20]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[22]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[24]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[26]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[28]);
	gSkid[IdxSkids].Pmax_Pump_101.P101_PI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[30]);
	
	gSkid[IdxSkids].Pmax_Pump_102.P102_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[40]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[42]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[44]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[46]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[48]);
	gSkid[IdxSkids].Pmax_Pump_102.P102_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[50]);
	
	gSkid[IdxSkids].Pmax_Pump_103.P103_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[60]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[62]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[64]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[66]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[68]);
	gSkid[IdxSkids].Pmax_Pump_103.P103_LS := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[70]);
	
	gSkid[IdxSkids].Pmax_Pump_104.P104_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[80]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PV := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[82]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_OP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[84]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[86]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_FQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[88]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PFQ := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[90]);
	gSkid[IdxSkids].Pmax_Pump_104.P104_PPI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[92]);
	
	gSkid[IdxSkids].Sensor_Variables.CD101 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[100]);
	gSkid[IdxSkids].Sensor_Variables.CD101_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[102]);
	gSkid[IdxSkids].Sensor_Variables.CD102 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[104]);
	gSkid[IdxSkids].Sensor_Variables.CD102_SP := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[106]);
	gSkid[IdxSkids].Sensor_Variables.CD101_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[108]);
	gSkid[IdxSkids].Sensor_Variables.CD102_TI := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[110]);
	gSkid[IdxSkids].BufferTank.LI200 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[112]);
	gSkid[IdxSkids].BufferTank.LSHH200 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[114]);


END_ACTION
