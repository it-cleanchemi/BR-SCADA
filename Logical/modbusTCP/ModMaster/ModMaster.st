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
		MasterConfig[IdxSkids].action_param[2].timer 		:= 100;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[2].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
		// AS Block 4 - 6000 REAL
		MasterConfig[IdxSkids].action_enable[3].cyclic 	:= 1;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[3].p_pv		:= ADR(gModbus[IdxSkids].Modbus_PeroxyMAX.Block4_Real[0]);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[3].quantity 	:= 117;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[3].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[3].start_addr := 6150;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[3].timer 		:= 100;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[3].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 	
	
	
		// --------------------------------------------------------------------
		// Writing data TO modbusTCP slave
		// --------------------------------------------------------------------
	
		// AS Block 5 - UNIT_ID
		MasterConfig[IdxSkids].action_enable[4].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[4].p_pv		:= ADR(gCmd[IdxSkids].Write_UNIT_ID.wUNIT_ID);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[4].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[4].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[4].start_addr := 6000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[4].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[4].type 		:= 16;			// Function code for this item (2 := read discrete inputs)	

		// AS Block 6 - P201_XS
		MasterConfig[IdxSkids].action_enable[5].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[5].p_pv		:= ADR(gCmd[IdxSkids].Write_P201_XS.wP201_XS);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[5].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[5].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[5].start_addr := 20000.00;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[5].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[5].type 		:= 16;			// Function code for this item (2 := read discrete inputs)	
		
		// AS Block 7 - P201_HOA
		MasterConfig[IdxSkids].action_enable[6].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[6].p_pv		:= ADR(gCmd[IdxSkids].Write_P201_HOA.wP201_HOA);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[6].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[6].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[6].start_addr := 21010;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[6].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[6].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 8 - P201_PPM
		MasterConfig[IdxSkids].action_enable[7].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[7].p_pv		:= ADR(gCmd[IdxSkids].Write_P201_PPM.wP201_PPM_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[7].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[7].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[7].start_addr := 21140;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[7].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[7].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 9 - P201_SP
		MasterConfig[IdxSkids].action_enable[8].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[8].p_pv		:= ADR(gCmd[IdxSkids].Write_P201_SP.wP201_SP_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[8].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[8].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[8].start_addr := 21100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[8].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[8].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 10 - P202_XS
		MasterConfig[IdxSkids].action_enable[9].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[9].p_pv		:= ADR(gCmd[IdxSkids].Write_P202_XS.wP202_XS);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[9].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[9].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[9].start_addr := 20000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[9].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[9].type 		:= 16;			// Function code for this item (2 := read discrete inputs)	
		
		// AS Block 11 - P202_HOA
		MasterConfig[IdxSkids].action_enable[10].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[10].p_pv		:= ADR(gCmd[IdxSkids].Write_P202_HOA.wP202_HOA);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[10].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[10].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[10].start_addr := 22010;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[10].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[10].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 12 - P202_PPM
		MasterConfig[IdxSkids].action_enable[11].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[11].p_pv		:= ADR(gCmd[IdxSkids].Write_P202_PPM.wP202_PPM_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[11].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[11].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[11].start_addr := 22140;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[11].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[11].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 13 - P202_SP
		MasterConfig[IdxSkids].action_enable[12].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[12].p_pv		:= ADR(gCmd[IdxSkids].Write_P202_SP.wP202_SP_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[12].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[12].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[12].start_addr := 22100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[12].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[12].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 14 - P203_XS
		MasterConfig[IdxSkids].action_enable[13].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[13].p_pv		:= ADR(gCmd[IdxSkids].Write_P203_XS.wP203_XS);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[13].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[13].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[13].start_addr := 20000;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[13].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[13].type 		:= 16;			// Function code for this item (2 := read discrete inputs)	
		
		// AS Block 15 - P203_HOA
		MasterConfig[IdxSkids].action_enable[14].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[14].p_pv		:= ADR(gCmd[IdxSkids].Write_P203_HOA.wP203_HOA);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[14].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[14].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[14].start_addr := 23010;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[14].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[14].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 16 - P203_PPM
		MasterConfig[IdxSkids].action_enable[15].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[15].p_pv		:= ADR(gCmd[IdxSkids].Write_P203_PPM.wP203_PPM_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[15].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[15].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[15].start_addr := 23140;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[15].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[15].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 17 - P203_SP
		MasterConfig[IdxSkids].action_enable[16].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[16].p_pv		:= ADR(gCmd[IdxSkids].Write_P203_SP.wP203_SP_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[16].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[16].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[16].start_addr := 23100;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[16].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[16].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 18 - EFF_1
		MasterConfig[IdxSkids].action_enable[17].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[17].p_pv		:= ADR(gCmd[IdxSkids].Write_EFF_1.wEFF_1_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[17].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[17].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[17].start_addr := 10910;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[17].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[17].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 19 - EFF_2
		MasterConfig[IdxSkids].action_enable[18].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[18].p_pv		:= ADR(gCmd[IdxSkids].Write_EFF_2.wEFF_2_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[18].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[18].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[18].start_addr := 10930;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[18].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[18].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		
		// AS Block 20 - NAOH_TO_H2O2
		MasterConfig[IdxSkids].action_enable[19].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[19].p_pv		:= ADR(gCmd[IdxSkids].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[19].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[19].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[19].start_addr := 10940;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[19].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[19].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 21 - TRI_TO_H2O2
		MasterConfig[IdxSkids].action_enable[20].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[20].p_pv		:= ADR(gCmd[IdxSkids].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[20].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[20].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[20].start_addr := 10920;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[20].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[20].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 22 - PMAX_HOA
		MasterConfig[IdxSkids].action_enable[21].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[21].p_pv		:= ADR(gCmd[IdxSkids].Write_PMAX_HOA.wPMAX_HOA);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[21].quantity 	:= 1;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[21].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[21].start_addr := 10010;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[21].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[21].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 23 - PMAX_CONC
		MasterConfig[IdxSkids].action_enable[22].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[22].p_pv		:= ADR(gCmd[IdxSkids].Write_PMAX_CONC.wPMAX_CONC_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[22].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[22].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[22].start_addr := 10900;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[22].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[22].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 24 - HP_CONC
		MasterConfig[IdxSkids].action_enable[23].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[23].p_pv		:= ADR(gCmd[IdxSkids].Write_HP_CONC.wHP_CONC_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[23].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[23].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[23].start_addr := 13130;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[23].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[23].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		// AS Block 25 - NAOH_CONC
		MasterConfig[IdxSkids].action_enable[24].cyclic 	:= FALSE;			// Read data cyclic 
		MasterConfig[IdxSkids].action_param[24].p_pv		:= ADR(gCmd[IdxSkids].Write_NAOH_CONC.wNAOH_CONC_SWAPPED);	// Store data in this variable 
		MasterConfig[IdxSkids].action_param[24].quantity 	:= 2;			// Number of items to read 
		MasterConfig[IdxSkids].action_param[24].unit 		:= 1;			// Unit address - ignore if not specified 
		MasterConfig[IdxSkids].action_param[24].start_addr := 12130;		// Read from this modbus address 
		MasterConfig[IdxSkids].action_param[24].timer 	:= 10;			// Refresh timer for this item 
		MasterConfig[IdxSkids].action_param[24].type 		:= 16;			// Function code for this item (2 := read discrete inputs)
		
		
		

		
		
		
		
		
		
		
		

	
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
