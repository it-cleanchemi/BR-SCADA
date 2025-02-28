PROGRAM _INIT
	brsstrcpy(ADR(interface), ADR('IF3'));					 // Ethernet interface used on this PLC 

	// --------------------------------------------------------------------
	//  Reset FUNCTION blocks AND data structure on startup (SGC)
	//  -------------------------------------------------------------------
	brsmemset(ADR(ModbusTcpMaster), 0, SIZEOF(ModbusTcpMaster));
	brsmemset(ADR(MasterConfig), 0, SIZEOF(MasterConfig));
	brsmemset(ADR(logger), 0, SIZEOF(logger));

	// --------------------------------------------------------------------
	// FOR Reading data FROM modbusTCP slave
	// --------------------------------------------------------------------
	
	
	// AS Block 1
	MasterConfig.action_enable[0].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[0].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[0].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[0].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[0].start_addr := 7000;		// Read from this modbus address 
	MasterConfig.action_param[0].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[0].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 2
	MasterConfig.action_enable[1].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[1].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_201.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[1].quantity 	:= 5;			// Number of items to read 
	MasterConfig.action_param[1].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[1].start_addr := 7100;		// Read from this modbus address 
	MasterConfig.action_param[1].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[1].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 3
	MasterConfig.action_enable[2].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[2].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_201.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[2].quantity 	:= 22;			// Number of items to read 
	MasterConfig.action_param[2].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[2].start_addr := 7110;		// Read from this modbus address 
	MasterConfig.action_param[2].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[2].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 4
	MasterConfig.action_enable[3].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[3].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_202.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[3].quantity 	:= 5;			// Number of items to read 
	MasterConfig.action_param[3].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[3].start_addr := 7140;		// Read from this modbus address 
	MasterConfig.action_param[3].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[3].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
	// AS Block 5
	MasterConfig.action_enable[4].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[4].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_202.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[4].quantity 	:= 22;			// Number of items to read 
	MasterConfig.action_param[4].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[4].start_addr := 7150;		// Read from this modbus address 
	MasterConfig.action_param[4].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[4].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 6
	MasterConfig.action_enable[5].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[5].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_203.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[5].quantity 	:= 5;			// Number of items to read 
	MasterConfig.action_param[5].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[5].start_addr := 7180;		// Read from this modbus address 
	MasterConfig.action_param[5].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[5].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
	// AS Block 7
	MasterConfig.action_enable[6].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[6].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_203.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[6].quantity 	:= 22;			// Number of items to read 
	MasterConfig.action_param[6].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[6].start_addr := 7190;		// Read from this modbus address 
	MasterConfig.action_param[6].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[6].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
	// AS Block 8
	MasterConfig.action_enable[7].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[7].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[7].quantity 	:= 10;			// Number of items to read 
	MasterConfig.action_param[7].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[7].start_addr := 7620;		// Read from this modbus address 
	MasterConfig.action_param[7].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[7].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 9
	MasterConfig.action_enable[8].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[8].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[5]);	// Store data in this variable 
	MasterConfig.action_param[8].quantity 	:= 7;			// Number of items to read 
	MasterConfig.action_param[8].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[8].start_addr := 6050;		// Read from this modbus address 
	MasterConfig.action_param[8].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[8].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 10
	MasterConfig.action_enable[9].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[9].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[1]);	// Store data in this variable 
	MasterConfig.action_param[9].quantity 	:= 3;			// Number of items to read 
	MasterConfig.action_param[9].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[9].start_addr := 6100;		// Read from this modbus address 
	MasterConfig.action_param[9].timer 		:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[9].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 11
	MasterConfig.action_enable[10].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[10].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[9]);	// Store data in this variable 
	MasterConfig.action_param[10].quantity 	:= 11;			// Number of items to read 
	MasterConfig.action_param[10].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[10].start_addr := 6104;		// Read from this modbus address 
	MasterConfig.action_param[10].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[10].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
	// AS Block 12
	MasterConfig.action_enable[11].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[11].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_101.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[11].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[11].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[11].start_addr := 6150;		// Read from this modbus address 
	MasterConfig.action_param[11].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[11].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 13
	MasterConfig.action_enable[12].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[12].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_101.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[12].quantity 	:= 15;			// Number of items to read 
	MasterConfig.action_param[12].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[12].start_addr := 6140;		// Read from this modbus address 
	MasterConfig.action_param[12].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[12].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 14
	MasterConfig.action_enable[13].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[13].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_102.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[13].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[13].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[13].start_addr := 6230;		// Read from this modbus address 
	MasterConfig.action_param[13].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[13].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 15
	MasterConfig.action_enable[14].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[14].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_102.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[14].quantity 	:= 22;			// Number of items to read 
	MasterConfig.action_param[14].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[14].start_addr := 6220;		// Read from this modbus address 
	MasterConfig.action_param[14].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[14].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 16
	MasterConfig.action_enable[15].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[15].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_103.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[15].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[15].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[15].start_addr := 6270;		// Read from this modbus address 
	MasterConfig.action_param[15].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[15].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 17
	MasterConfig.action_enable[16].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[16].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_103.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[16].quantity 	:= 22;			// Number of items to read 
	MasterConfig.action_param[16].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[16].start_addr := 6260;		// Read from this modbus address 
	MasterConfig.action_param[16].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[16].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
	// AS Block 18
	MasterConfig.action_enable[17].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[17].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_104.Block_Int[0]);	// Store data in this variable 
	MasterConfig.action_param[17].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[17].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[17].start_addr := 6310;		// Read from this modbus address 
	MasterConfig.action_param[17].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[17].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	// AS Block 19
	MasterConfig.action_enable[18].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[18].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_104.Block_Real[0]);	// Store data in this variable 
	MasterConfig.action_param[18].quantity 	:= 15;			// Number of items to read 
	MasterConfig.action_param[18].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[18].start_addr := 6300;		// Read from this modbus address 
	MasterConfig.action_param[18].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[18].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
	// AS Block 20
	MasterConfig.action_enable[19].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[19].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[15]);	// Store data in this variable 
	MasterConfig.action_param[19].quantity 	:= 27;			// Number of items to read 
	MasterConfig.action_param[19].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[19].start_addr := 6350;		// Read from this modbus address 
	MasterConfig.action_param[19].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[19].type 		:= 3;			// Function code for this item (2 := read discrete inputs)	
	
	
	// --------------------------------------------------------------------
	// Writing data TO modbusTCP slave
	// --------------------------------------------------------------------
	
	// Write 6000
	MasterConfig.action_enable[20].cyclic 	:= FALSE;			// Read data cyclic 
	MasterConfig.action_param[20].p_pv		:= ADR(SkidID);	// Store data in this variable 
	MasterConfig.action_param[20].quantity 	:= 1;			// Number of items to read 
	MasterConfig.action_param[20].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[20].start_addr := 6000;		// Read from this modbus address 
	MasterConfig.action_param[20].timer 	:= 10;			// Refresh timer for this item 
	MasterConfig.action_param[20].type 		:= 6;			// Function code for this item (2 := read discrete inputs)	
	
	// --------------------------------------------------------------------
	// FOR Modbus Read/Write
	// --------------------------------------------------------------------
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		ModbusTcpMaster[IdxSkids].enable 			:= 1;						// Start master 
		ModbusTcpMaster[IdxSkids].device			:= ADR(interface); 			// Ethernet device string 
		ModbusTcpMaster[IdxSkids].p_cfg 			:= ADR(MasterConfig); 		// Pointer to configuration 
		ModbusTcpMaster[IdxSkids].p_log 			:= ADR(logger);				// Pointer to logger string array. The logger information will show communication details. Enable for debugging, disable for production to save system resources.
		ModbusTcpMaster[IdxSkids].port				:= 510;
		ModbusTcpMaster[IdxSkids].slave_ip_addr 	:= SLAVE_IP_ADDRESSES[IdxSkids]; 		// Transfer slave device IP address 
	END_FOR;
	
	StartStop := 1;
	
END_PROGRAM


PROGRAM _CYCLIC
	// --------------------------------------------------------------------
	// Cyclic FUNCTION call
	// --------------------------------------------------------------------
	IF(StartStop) THEN
		FOR IdxSkids := 0 TO MAX_SKIDS DO
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
			
		END_FOR;
	END_IF



END_PROGRAM
