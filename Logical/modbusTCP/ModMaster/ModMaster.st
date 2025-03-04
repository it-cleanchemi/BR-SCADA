PROGRAM _INIT
	brsstrcpy(ADR(interface), ADR('IF3'));					 // Ethernet interface used on this PLC 

	// --------------------------------------------------------------------
	//  Reset FUNCTION blocks AND data structure on startup (SGC)
	//  -------------------------------------------------------------------
	brsmemset(ADR(ModbusTcpMaster), 0, SIZEOF(ModbusTcpMaster));
	brsmemset(ADR(MasterConfig), 0, SIZEOF(MasterConfig));
	brsmemset(ADR(logger), 0, SIZEOF(logger));

	FOR IdxSkids := 0 TO MAX_SKIDS DO
		
		// --------------------------------------------------------------------
		// FOR Reading data FROM modbusTCP slave
		// --------------------------------------------------------------------
	
	
		// AS Block 1
		MasterConfig[IdxSkids].action_enable[0].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[0].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[0].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[0].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[0].start_addr := 7000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[0].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[0].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 2
		MasterConfig[IdxSkids].action_enable[1].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[1].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_201.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[1].quantity 	:= 5;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[1].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[1].start_addr := 7100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[1].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[1].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 3
		MasterConfig[IdxSkids].action_enable[2].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[2].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_201.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[2].quantity 	:= 22;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[2].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[2].start_addr := 7110;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[2].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[2].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 4
		MasterConfig[IdxSkids].action_enable[3].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[3].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_202.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[3].quantity 	:= 5;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[3].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[3].start_addr := 7140;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[3].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[3].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
		// AS Block 5
		MasterConfig[IdxSkids].action_enable[4].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[4].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_202.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[4].quantity 	:= 22;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[4].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[4].start_addr := 7150;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[4].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[4].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 6
		MasterConfig[IdxSkids].action_enable[5].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[5].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_203.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[5].quantity 	:= 5;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[5].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[5].start_addr := 7180;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[5].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[5].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
		// AS Block 7
		MasterConfig[IdxSkids].action_enable[6].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[6].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_203.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[6].quantity 	:= 22;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[6].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[6].start_addr := 7190;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[6].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[6].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
		// AS Block 8
		MasterConfig[IdxSkids].action_enable[7].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[7].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[7].quantity 	:= 1000;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[7].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[7].start_addr := 7620;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[7].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[7].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 9
		MasterConfig[IdxSkids].action_enable[8].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[8].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[5]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[8].quantity 	:= 7;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[8].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[8].start_addr := 6050;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[8].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[8].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 10
		MasterConfig[IdxSkids].action_enable[9].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[9].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Int[1]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[9].quantity 	:= 3;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[9].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[9].start_addr := 6100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[9].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[9].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 11
		MasterConfig[IdxSkids].action_enable[10].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[10].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[9]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[10].quantity 	:= 11;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[10].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[10].start_addr := 6104;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[10].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[10].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
		// AS Block 12
		MasterConfig[IdxSkids].action_enable[11].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[11].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_101.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[11].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[11].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[11].start_addr := 6150;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[11].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[11].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 13
		MasterConfig[IdxSkids].action_enable[12].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[12].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_101.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[12].quantity 	:= 15;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[12].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[12].start_addr := 6140;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[12].timer 	:= 100;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[12].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 14
		MasterConfig[IdxSkids].action_enable[13].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[13].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_102.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[13].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[13].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[13].start_addr := 6230;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[13].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[13].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 15
		MasterConfig[IdxSkids].action_enable[14].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[14].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_102.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[14].quantity 	:= 22;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[14].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[14].start_addr := 6220;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[14].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[14].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 16
		MasterConfig[IdxSkids].action_enable[15].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[15].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_103.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[15].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[15].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[15].start_addr := 6270;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[15].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[15].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 17
		MasterConfig[IdxSkids].action_enable[16].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[16].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_103.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[16].quantity 	:= 22;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[16].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[16].start_addr := 6260;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[16].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[16].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
		// AS Block 18
		MasterConfig[IdxSkids].action_enable[17].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[17].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_104.Block_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[17].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[17].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[17].start_addr := 6310;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[17].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[17].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 19
		MasterConfig[IdxSkids].action_enable[18].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[18].p_pv		:= ADR(gModbus[IdxSkids].Pump_Data_104.Block_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[18].quantity 	:= 15;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[18].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[18].start_addr := 6300;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[18].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[18].type 		:= 3;			// Function code for this item (2 := read discrete inputs)
	
		// AS Block 20
		MasterConfig[IdxSkids].action_enable[19].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[19].p_pv		:= ADR(gModbus[IdxSkids].Modbus_SkidMisc.Block_Real[15]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[19].quantity 	:= 27;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[19].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[19].start_addr := 6350;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[19].timer 	:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[19].type 		:= 3;			// Function code for this item (2 := read discrete inputs)	
	
	
		// --------------------------------------------------------------------
		// Writing data TO modbusTCP slave
		// --------------------------------------------------------------------
	
		// Write 6000
		MasterConfig[IdxSkids].action_enable[20].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[20].p_pv		:= ADR(gCmd[IdxSkids].WriteSkidID.SkidID);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[20].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[20].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[20].start_addr := 6000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[20].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[20].type 		:= 6;			// Function code for this item (2 := read discrete inputs)	
		
		MasterConfig[IdxSkids].action_enable[21].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[21].p_pv		:= ADR(gCmd[IdxSkids].WriteP101_SP.P101_SP_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[21].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[21].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[21].start_addr := 11100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[21].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[21].type 		:= 6;			// Function code for this item (2 := read discrete inputs)	
	
		// --------------------------------------------------------------------
		// FOR Modbus Read/Write
		// --------------------------------------------------------------------

		ModbusTcpMaster[IdxSkids].enable 			:= 1;						// Start master 
		ModbusTcpMaster[IdxSkids].device			:= ADR(interface); 			// Ethernet device string 
		ModbusTcpMaster[IdxSkids].p_cfg 			:= ADR(MasterConfig[IdxSkids]); 		// Pointer to configuration 
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
			
			Modbus_CMD_action;
			Modbus_Status_action;
			
		END_FOR;
		
	END_IF



				END_PROGRAM
