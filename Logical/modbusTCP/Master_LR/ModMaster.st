PROGRAM _INIT
	brsstrcpy(ADR(interface), ADR('IF3')); // Ethernet interface used on this PLC 

	// --------------------------------------------------------------------
	//  Reset FUNCTION blocks AND data structure on startup (SGC)
	//  -------------------------------------------------------------------
	brsmemset(ADR(ModbusTcpMaster_LR), 0, SIZEOF(ModbusTcpMaster_LR));
	brsmemset(ADR(MasterConfig_LR), 0, SIZEOF(MasterConfig_LR));
	brsmemset(ADR(logger), 0, SIZEOF(logger));

	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO


		// --------------------------------------------------------------------
		// FOR Reading data FROM modbusTCP slave
		// --------------------------------------------------------------------

		// AS Block 1 - 6000 INT
		MasterConfig_LR[IdxSkids_LR].action_enable[0].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[0].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_PeroxyMAX.Block1_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[0].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[0].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[0].start_addr := 6000;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[0].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[0].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 2 - 6000 INT SPARE
		MasterConfig_LR[IdxSkids_LR].action_enable[1].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[1].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_PeroxyMAX.Block2_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[1].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[1].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[1].start_addr := 6126;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[1].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[1].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 3 - 6000 REAL
		MasterConfig_LR[IdxSkids_LR].action_enable[2].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[2].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_PeroxyMAX.Block3_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[2].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[2].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[2].start_addr := 6252;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[2].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[2].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 4 - 6000 REAL
		MasterConfig_LR[IdxSkids_LR].action_enable[3].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[3].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_PeroxyMAX.Block4_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[3].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[3].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[3].start_addr := 6378;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[3].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[3].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 5 - 6000 REAL - SPARE
		MasterConfig_LR[IdxSkids_LR].action_enable[4].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[4].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_PeroxyMAX.Block5_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[4].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[4].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[4].start_addr := 6504;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[4].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[4].type := 3;// Function code for this item (2 := read discrete inputs)

		// AS Block 6 - 7000 INT
		MasterConfig_LR[IdxSkids_LR].action_enable[5].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[5].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block6_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[5].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[5].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[5].start_addr := 7000;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[5].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[5].type := 3;// Function code for this item (2 := read discrete inputs)

		// AS Block 7 - 7000 INT 
		MasterConfig_LR[IdxSkids_LR].action_enable[6].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[6].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block7_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[6].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[6].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[6].start_addr := 7126;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[6].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[6].type := 3;// Function code for this item (2 := read discrete inputs)

		// AS Block 8 - 7000 REAL
		MasterConfig_LR[IdxSkids_LR].action_enable[7].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[7].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block8_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[7].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[7].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[7].start_addr := 7252;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[7].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[7].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 9 - 7000 REAL
		MasterConfig_LR[IdxSkids_LR].action_enable[8].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[8].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block9_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[8].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[8].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[8].start_addr := 7378;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[8].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[8].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 10 - 7000 REAL
		MasterConfig_LR[IdxSkids_LR].action_enable[9].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[9].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block10_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[9].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[9].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[9].start_addr := 7504;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[9].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[9].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 11 - 7000 REAL - SPARE
		MasterConfig_LR[IdxSkids_LR].action_enable[10].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[10].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block11_Real[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[10].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[10].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[10].start_addr := 7630;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[10].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[10].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 48 - INT - ALARMS
		MasterConfig_LR[IdxSkids_LR].action_enable[47].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[47].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Alarms.Block48_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[47].quantity := 25;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[47].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[47].start_addr := 40;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[47].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[47].type := 3;// Function code for this item (2 := read discrete inputs) 

		// AS Block 61 - 7000 INT - DOSING PUMP TEXT ID
		MasterConfig_LR[IdxSkids_LR].action_enable[60].cyclic := 1;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[60].p_pv:= ADR(gModbus_LR[IdxSkids_LR].Modbus_Dosing.Block61_Int[0]);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[60].quantity := 125;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[60].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[60].start_addr := 7756;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[60].timer := 20;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[60].type := 3;// Function code for this item (2 := read discrete inputs)



		// --------------------------------------------------------------------
		// Writing data TO modbusTCP slave
		// --------------------------------------------------------------------

		// AS Block 12 - UNIT_ID
		MasterConfig_LR[IdxSkids_LR].action_enable[11].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[11].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_UNIT_ID.wUNIT_ID);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[11].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[11].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[11].start_addr := 6000;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[11].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[11].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 13 - P201_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[12].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[12].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P201_STRT_CMD.wP201_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[12].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[12].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[12].start_addr := 21020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[12].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[12].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 14 - P201_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[13].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[13].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P201_STP_CMD.wP201_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[13].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[13].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[13].start_addr := 21022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[13].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[13].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 15 - P201_HOA
		MasterConfig_LR[IdxSkids_LR].action_enable[14].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[14].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P201_HOA.wP201_HOA);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[14].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[14].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[14].start_addr := 21010;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[14].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[14].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 16 - P201_PPM
		MasterConfig_LR[IdxSkids_LR].action_enable[15].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[15].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P201_PPM.wP201_PPM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[15].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[15].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[15].start_addr := 21140;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[15].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[15].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 17 - P201_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[16].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[16].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P201_SP.wP201_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[16].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[16].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[16].start_addr := 21100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[16].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[16].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 18 - P202_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[17].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[17].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P202_STRT_CMD.wP202_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[17].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[17].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[17].start_addr := 22020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[17].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[17].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 19 - P202_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[18].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[18].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P202_STP_CMD.wP202_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[18].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[18].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[18].start_addr := 22022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[18].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[18].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 20 - P202_HOA
		MasterConfig_LR[IdxSkids_LR].action_enable[19].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[19].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P202_HOA.wP202_HOA);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[19].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[19].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[19].start_addr := 22010;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[19].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[19].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 21 - P202_PPM
		MasterConfig_LR[IdxSkids_LR].action_enable[20].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[20].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P202_PPM.wP202_PPM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[20].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[20].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[20].start_addr := 22140;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[20].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[20].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 22 - P202_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[21].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[21].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P202_SP.wP202_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[21].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[21].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[21].start_addr := 22100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[21].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[21].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 23 - P203_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[22].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[22].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P203_STRT_CMD.wP203_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[22].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[22].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[22].start_addr := 23020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[22].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[22].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 24 - P203_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[23].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[23].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P203_STP_CMD.wP203_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[23].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[23].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[23].start_addr := 23022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[23].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[23].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 25 - P203_HOA
		MasterConfig_LR[IdxSkids_LR].action_enable[24].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[24].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P203_HOA.wP203_HOA);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[24].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[24].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[24].start_addr := 23010;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[24].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[24].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 26 - P203_PPM
		MasterConfig_LR[IdxSkids_LR].action_enable[25].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[25].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P203_PPM.wP203_PPM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[25].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[25].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[25].start_addr := 23140;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[25].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[25].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 27 - P203_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[26].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[26].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P203_SP.wP203_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[26].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[26].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[26].start_addr := 23100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[26].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[26].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 28 - EFF_1
		MasterConfig_LR[IdxSkids_LR].action_enable[27].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[27].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_EFF_1.wEFF_1_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[27].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[27].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[27].start_addr := 10910;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[27].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[27].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 29 - EFF_2
		MasterConfig_LR[IdxSkids_LR].action_enable[28].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[28].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_EFF_2.wEFF_2_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[28].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[28].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[28].start_addr := 10930;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[28].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[28].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 30 - NAOH_TO_H2O2
		MasterConfig_LR[IdxSkids_LR].action_enable[29].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[29].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[29].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[29].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[29].start_addr := 10940;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[29].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[29].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 31 - TRI_TO_H2O2
		MasterConfig_LR[IdxSkids_LR].action_enable[30].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[30].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[30].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[30].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[30].start_addr := 10920;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[30].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[30].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 32 - PMAX_HOA
		MasterConfig_LR[IdxSkids_LR].action_enable[31].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[31].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.wPMAX_HOA);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[31].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[31].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[31].start_addr := 10010;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[31].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[31].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 33 - PMAX_CONC
		MasterConfig_LR[IdxSkids_LR].action_enable[32].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[32].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.wPMAX_CONC_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[32].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[32].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[32].start_addr := 10900;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[32].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[32].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 34 - HP_CONC
		MasterConfig_LR[IdxSkids_LR].action_enable[33].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[33].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_HP_CONC.wHP_CONC_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[33].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[33].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[33].start_addr := 13130;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[33].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[33].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 35 - NAOH_CONC
		MasterConfig_LR[IdxSkids_LR].action_enable[34].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[34].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.wNAOH_CONC_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[34].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[34].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[34].start_addr := 12130;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[34].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[34].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 36 - P101_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[35].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[35].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P101_STRT_CMD.wP101_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[35].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[35].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[35].start_addr := 11020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[35].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[35].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 37 - P101_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[36].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[36].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P101_STP_CMD.wP101_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[36].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[36].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[36].start_addr := 11022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[36].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[36].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 38 - P101_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[37].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[37].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P101_SP.wP101_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[37].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[37].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[37].start_addr := 11100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[37].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[37].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 39 - P102_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[38].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[38].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P102_STRT_CMD.wP102_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[38].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[38].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[38].start_addr := 12020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[38].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[38].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 40 - P102_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[39].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[39].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P102_STP_CMD.wP102_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[39].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[39].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[39].start_addr := 12022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[39].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[39].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 41 - P102_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[40].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[40].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P102_SP.wP102_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[40].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[40].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[40].start_addr := 12100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[40].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[40].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 42 - P103_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[41].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[41].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P103_STRT_CMD.wP103_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[41].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[41].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[41].start_addr := 13020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[41].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[41].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 43 - P103_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[42].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[42].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P103_STP_CMD.wP103_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[42].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[42].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[42].start_addr := 13022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[42].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[42].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 44 - P103_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[43].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[43].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P103_SP.wP103_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[43].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[43].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[43].start_addr := 13100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[43].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[43].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 45 - P104_STRT_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[44].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[44].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P104_STRT_CMD.wP104_STRT_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[44].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[44].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[44].start_addr := 14020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[44].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[44].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 46 - P104_STP_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[45].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[45].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P104_STP_CMD.wP104_STP_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[45].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[45].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[45].start_addr := 14022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[45].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[45].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 47 - P104_SP
		MasterConfig_LR[IdxSkids_LR].action_enable[46].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[46].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_P104_SP.wP104_SP_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[46].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[46].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[46].start_addr := 14100;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[46].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[46].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 48 is in READ section above

		// AS Block 49 - LOCK_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[48].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[48].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_LOCK_CMD.wLOCK_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[48].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[48].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[48].start_addr := 10020;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[48].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[48].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 50 - UNLOCK_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[49].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[49].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_UNLOCK_CMD.wUNLOCK_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[49].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[49].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[49].start_addr := 10022;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[49].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[49].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 51 - FI301_SIM_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[50].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[50].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI301_SIM_CMD.wFI301_SIM_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[50].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[50].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[50].start_addr := 30122;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[50].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[50].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 52 - FI301_MEA_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[51].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[51].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI301_MEA_CMD.wFI301_MEA_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[51].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[51].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[51].start_addr := 30124;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[51].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[51].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 53 - FI301_SIM
		MasterConfig_LR[IdxSkids_LR].action_enable[52].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[52].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI301_SIM.wFI301_SIM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[52].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[52].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[52].start_addr := 30120;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[52].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[52].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 54 - FI302_SIM_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[53].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[53].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI302_SIM_CMD.wFI302_SIM_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[53].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[53].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[53].start_addr := 30222;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[53].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[53].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 55 - FI302_MEA_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[54].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[54].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI302_MEA_CMD.wFI302_MEA_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[54].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[54].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[54].start_addr := 30224;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[54].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[54].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 56 - FI302_SIM
		MasterConfig_LR[IdxSkids_LR].action_enable[55].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[55].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI302_SIM.wFI302_SIM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[55].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[55].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[55].start_addr := 30220;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[55].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[55].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 57 - FI303_SIM_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[56].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[56].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI303_SIM_CMD.wFI303_SIM_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[56].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[56].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[56].start_addr := 30322;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[56].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[56].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 58 - FI303_MEA_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[57].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[57].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI303_MEA_CMD.wFI303_MEA_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[57].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[57].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[57].start_addr := 30324;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[57].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[57].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 59 - FI303_SIM
		MasterConfig_LR[IdxSkids_LR].action_enable[58].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[58].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_FI303_SIM.wFI303_SIM_SWAPPED);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[58].quantity := 2;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[58].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[58].start_addr := 30320;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[58].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[58].type := 16;// Function code for this item (2 := read discrete inputs)

		// AS Block 60 - UNIT_ACK
		MasterConfig_LR[IdxSkids_LR].action_enable[59].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[59].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_UNIT_ACK.wUNIT_ACK);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[59].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[59].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[59].start_addr := 4001;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[59].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[59].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 62 - XV101_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[61].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[61].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV101_OPEN_CMD.wXV101_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[61].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[61].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[61].start_addr := 11012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[61].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[61].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 63 - XV102_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[62].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[62].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV102_OPEN_CMD.wXV102_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[62].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[62].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[62].start_addr := 12012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[62].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[62].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 64 - XV103_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[63].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[63].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV103_OPEN_CMD.wXV103_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[63].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[63].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[63].start_addr := 13012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[63].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[63].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 65 - XV104_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[64].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[64].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV104_OPEN_CMD.wXV104_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[64].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[64].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[64].start_addr := 14012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[64].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[64].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 66 - XV201_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[65].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[65].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV201_OPEN_CMD.wXV201_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[65].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[65].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[65].start_addr := 21012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[65].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[65].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 67 - XV202_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[66].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[66].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV202_OPEN_CMD.wXV202_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[66].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[66].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[66].start_addr := 22012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[66].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[66].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 68 - XV203_OPEN_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[67].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[67].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_XV203_OPEN_CMD.wXV203_OPEN_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[67].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[67].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[67].start_addr := 23012;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[67].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[67].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 69 - AS_USER
		MasterConfig_LR[IdxSkids_LR].action_enable[68].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[68].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_AS_USER.wAS_USER);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[68].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[68].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[68].start_addr := 200;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[68].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[68].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 70 - AS_ACCESS
		MasterConfig_LR[IdxSkids_LR].action_enable[69].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[69].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_AS_ACCESS.wAS_ACCESS);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[69].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[69].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[69].start_addr := 210;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[69].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[69].type := 6;// Function code for this item (2 := read discrete inputs)

		// AS Block 71 - TOTALIZER_RESET
		MasterConfig_LR[IdxSkids_LR].action_enable[70].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[70].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_TOTALIZER_RESET.wTOTALIZER_RESET);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[70].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[70].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[70].start_addr := 30;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[70].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[70].type := 6;// Function code for this item (2 := read discrete inputs)
		
		// AS Block 72 - RECALC_CMD
		MasterConfig_LR[IdxSkids_LR].action_enable[71].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[71].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_RECALC_CMD.wRECALC_CMD);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[71].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[71].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[71].start_addr := 1000;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[71].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[71].type := 6;// Function code for this item (2 := read discrete inputs)
		
		// AS Block 73 - ESTOP
		MasterConfig_LR[IdxSkids_LR].action_enable[72].cyclic := FALSE;// Read data cyclic 
		MasterConfig_LR[IdxSkids_LR].action_param[72].p_pv:= ADR(gCMD_LR[IdxSkids_LR].Write_ESTOP.wESTOP);// Store data in this variable 
		MasterConfig_LR[IdxSkids_LR].action_param[72].quantity := 1;// Number of items to read 
		MasterConfig_LR[IdxSkids_LR].action_param[72].unit := 1;// Unit address - ignore if not specified 
		MasterConfig_LR[IdxSkids_LR].action_param[72].start_addr := 0;// Read from this modbus address 
		MasterConfig_LR[IdxSkids_LR].action_param[72].timer := 2;// Refresh timer for this item 
		MasterConfig_LR[IdxSkids_LR].action_param[72].type := 6;// Function code for this item (2 := read discrete inputs)

		// --------------------------------------------------------------------
		// FOR Modbus Read/Write
		// --------------------------------------------------------------------

		ModbusTcpMaster_LR[IdxSkids_LR].enable := 1;// Start master 
		ModbusTcpMaster_LR[IdxSkids_LR].device:= ADR(interface); // Ethernet device string 
		ModbusTcpMaster_LR[IdxSkids_LR].p_cfg := ADR(MasterConfig_LR[IdxSkids_LR]); // Pointer to configuration 
		ModbusTcpMaster_LR[IdxSkids_LR].p_log := ADR(logger[0,IdxSkids_LR]);// Pointer to logger string array. The logger information will show communication details. Enable for debugging, disable for production to save system resources.
		ModbusTcpMaster_LR[IdxSkids_LR].port:= 510;
		ModbusTcpMaster_LR[IdxSkids_LR].slave_ip_addr := SLAVE_IP_ADDRESSES_LR[IdxSkids_LR]; // Transfer slave device IP address 


	END_FOR;

	StartStop := 1;
END_PROGRAM


PROGRAM _CYCLIC
// --------------------------------------------------------------------
// Cyclic FUNCTION call
// --------------------------------------------------------------------
	IF(StartStop) THEN

		FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO

			Modbus_CMD_action;
			Modbus_Status_action;
			Alarms_action;

		END_FOR;

	END_IF



END_PROGRAM

PROGRAM _EXIT

	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		ModbusTcpMaster_LR[IdxSkids_LR](enable := FALSE);
	END_FOR;

END_PROGRAM
     
