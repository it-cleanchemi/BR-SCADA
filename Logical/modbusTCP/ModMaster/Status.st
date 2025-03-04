
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
			
	// AS Block 1 Misc (Skid ID) INT
	gSkid[IdxSkids].Pmax_General_Variables.skid_id := gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[0];
			
	// AS Block 2 P201 INT
	gSkid[IdxSkids].Dosing_Pump_201.p201_is_on := gModbus[IdxSkids].Pump_Data_201.Block_Int[0];
	gSkid[IdxSkids].Dosing_Pump_201.p201_ref_fm := gModbus[IdxSkids].Pump_Data_201.Block_Int[4];
			
	// AS Block 3 P201 REAL
	gSkid[IdxSkids].Dosing_Pump_201.p201_ppm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_appm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[1]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[2]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_pv := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[3]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_op := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[4]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[5]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_fm_tot := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[6]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_pi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[7]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_ti := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[8]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[9]);
	gSkid[IdxSkids].Dosing_Pump_201.p201_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_201.Block_Real[10]);
			
	// AS Block 4 P202 INT
	gSkid[IdxSkids].Dosing_Pump_202.p202_is_on := gModbus[IdxSkids].Pump_Data_202.Block_Int[0];
	gSkid[IdxSkids].Dosing_Pump_202.p202_ref_fm := gModbus[IdxSkids].Pump_Data_202.Block_Int[4];
			
	// AS Block 5 P202 REAL
	gSkid[IdxSkids].Dosing_Pump_202.p202_ppm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_appm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[1]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[2]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_pv := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[3]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_op := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[4]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[5]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_fm_tot := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[6]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_pi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[7]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_ti := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[8]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[9]);
	gSkid[IdxSkids].Dosing_Pump_202.p202_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_202.Block_Real[10]);
			
	// AS Block 6 P203 INT
	gSkid[IdxSkids].Dosing_Pump_203.p203_is_on := gModbus[IdxSkids].Pump_Data_203.Block_Int[0];
	gSkid[IdxSkids].Dosing_Pump_203.p203_ref_fm := gModbus[IdxSkids].Pump_Data_203.Block_Int[4];
			
	// AS Block 7 P203 REAL
	gSkid[IdxSkids].Dosing_Pump_203.p203_ppm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[0]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_appm := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[1]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[2]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_pv := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[3]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_op := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[4]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[5]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_fm_tot := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[6]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_pi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[7]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_ti := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[8]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[9]);
	gSkid[IdxSkids].Dosing_Pump_203.p203_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_203.Block_Real[10]);
			
	// AS Block 8 Misc (Flowmeter) REAL
	gSkid[IdxSkids].Sensor_Variables.flowmeter301 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[0]);
	gSkid[IdxSkids].Sensor_Variables.flowmeter302 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[2]);
	gSkid[IdxSkids].Sensor_Variables.flowmeter303 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[4]);
			
	// AS Block 9 Misc (Conversion Ratios) REAL
	gSkid[IdxSkids].ConversionRatios.e_1 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[5]);
	gSkid[IdxSkids].ConversionRatios.e_2 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[6]);
	gSkid[IdxSkids].ConversionRatios.naoh_to_h202 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[7]);
	gSkid[IdxSkids].ConversionRatios.tri_to_h202 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[8]);
			
	// AS Block 10 Misc (Skid Status) INT
	gSkid[IdxSkids].Pmax_General_Variables.is_on := gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[1];
	gSkid[IdxSkids].Pmax_General_Variables.status := gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[3];
			
	// AS Block 11 Misc (Concentrations) REAL
	gSkid[IdxSkids].Pmax_General_Variables.pmax_conc := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[9]);
	gSkid[IdxSkids].Pmax_General_Variables.pmax_rate := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[10]);
	gSkid[IdxSkids].Pmax_General_Variables.hp_conc := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[12]);
	gSkid[IdxSkids].Pmax_General_Variables.naoh_conc := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[14]);
			
	// AS Block 12 P101 INT
	gSkid[IdxSkids].Pmax_Pump_101.p101_is_on := gModbus[IdxSkids].Pump_Data_101.Block_Int[0];
			
	// AS Block 13 P101 REAL
	gSkid[IdxSkids].Pmax_Pump_101.p101_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_101.Block_Real[0]);
	gSkid[IdxSkids].Pmax_Pump_101.p101_pv := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_101.Block_Real[1]);
	gSkid[IdxSkids].Pmax_Pump_101.p101_fm_tot := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_101.Block_Real[4]);
	gSkid[IdxSkids].Pmax_Pump_101.p101_ti := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_101.Block_Real[6]);
	gSkid[IdxSkids].Pmax_Pump_101.p101_pi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_101.Block_Real[7]);
	//			
	// AS Block 14 P102 INT
	gSkid[IdxSkids].Pmax_Pump_102.p102_is_on := gModbus[IdxSkids].Pump_Data_102.Block_Int[0];
			
	// AS Block 15 P102 REAL
	gSkid[IdxSkids].Pmax_Pump_102.p102_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_102.Block_Real[0]);
	gSkid[IdxSkids].Pmax_Pump_102.p102_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_102.Block_Real[3]);
	gSkid[IdxSkids].Pmax_Pump_102.p102_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_102.Block_Real[6]);
	gSkid[IdxSkids].Pmax_Pump_102.p102_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_102.Block_Real[7]);
	gSkid[IdxSkids].Pmax_Pump_102.p102_ls := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_102.Block_Real[10]);
			
	// AS Block 16 P103 INT
	gSkid[IdxSkids].Pmax_Pump_103.p103_is_on := gModbus[IdxSkids].Pump_Data_103.Block_Int[0];
			
	// AS Block 17 P103 REAL
	gSkid[IdxSkids].Pmax_Pump_103.p103_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_103.Block_Real[0]);
	gSkid[IdxSkids].Pmax_Pump_103.p103_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_103.Block_Real[3]);
	gSkid[IdxSkids].Pmax_Pump_103.p103_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_103.Block_Real[6]);
	gSkid[IdxSkids].Pmax_Pump_103.p103_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_103.Block_Real[7]);
	gSkid[IdxSkids].Pmax_Pump_103.p103_ls := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_103.Block_Real[10]);
			
	// AS Block 18 P104 INT
	gSkid[IdxSkids].Pmax_Pump_104.p104_is_on := gModbus[IdxSkids].Pump_Data_104.Block_Int[0];
			
	// AS Block 19 P104 REAL
	gSkid[IdxSkids].Pmax_Pump_104.p104_sp := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[0]);
	gSkid[IdxSkids].Pmax_Pump_104.p104_pv := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[1]);
	gSkid[IdxSkids].Pmax_Pump_104.p104_fb := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[3]);
	gSkid[IdxSkids].Pmax_Pump_104.p104_fm_tot := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[4]);
	gSkid[IdxSkids].Pmax_Pump_104.p104_pfq := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[6]);
	gSkid[IdxSkids].Pmax_Pump_104.p104_ppi := IDEC_REAL_Conv(gModbus[IdxSkids].Pump_Data_104.Block_Real[7]);
			
	// AS Block 20 Misc (Sensor/Buffer Tank) REAL
	gSkid[IdxSkids].Sensor_Variables.cd101 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[15]);
	gSkid[IdxSkids].Sensor_Variables.cd101_target := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[16]);
	gSkid[IdxSkids].Sensor_Variables.cd102 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[17]);
	gSkid[IdxSkids].Sensor_Variables.cd102_target := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[18]);
	gSkid[IdxSkids].Sensor_Variables.ti101 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[21]);
	gSkid[IdxSkids].Sensor_Variables.ti102 := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[22]);
	gSkid[IdxSkids].BufferTank.bt_level := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[27]);
	gSkid[IdxSkids].BufferTank.bt_hihi := IDEC_REAL_Conv(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[28]);

END_ACTION
