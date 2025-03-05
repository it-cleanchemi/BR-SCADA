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
	
	
		// AS Block 1 - 7000 INT
		MasterConfig[IdxSkids].action_enable[0].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[0].p_pv		:= ADR(gModbus[IdxSkids].Modbus_Dosing.Block1_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[0].quantity 	:= 35;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[0].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[0].start_addr := 7000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[0].timer 		:= 100;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[0].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 2 - 7000 REAL
		MasterConfig[IdxSkids].action_enable[1].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[1].p_pv		:= ADR(gModbus[IdxSkids].Modbus_Dosing.Block2_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[1].quantity 	:= 101;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[1].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[1].start_addr := 7150;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[1].timer 		:= 100;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[1].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 3 - 6000 INT
		MasterConfig[IdxSkids].action_enable[2].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[2].p_pv		:= ADR(gModbus[IdxSkids].Modbus_PeroxyMAX.Block3_Int[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[2].quantity 	:= 53;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[2].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[2].start_addr := 6010;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[2].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[2].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 4 - 6000 REAL
		MasterConfig[IdxSkids].action_enable[3].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[3].p_pv		:= ADR(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[3].quantity 	:= 117;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[3].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[3].start_addr := 6150;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[3].timer 		:= 1000;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[3].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
	
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
