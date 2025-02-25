PROGRAM _INIT
	brsstrcpy(ADR(interface), ADR('IF3'));					 // Ethernet interface used on this PLC 

	// --------------------------------------------------------------------
	//  Reset FUNCTION blocks AND data structure on startup (SGC)
	//  -------------------------------------------------------------------
	brsmemset(ADR(ModbusTcpMaster), 0, SIZEOF(ModbusTcpMaster));
	brsmemset(ADR(MasterConfig), 0, SIZEOF(MasterConfig));
	brsmemset(ADR(logger), 0, SIZEOF(logger));

	// --------------------------------------------------------------------
	// Sample FOR reading/writing data from/TO a modbusTCP slave
	// --------------------------------------------------------------------
	MasterConfig.action_enable[0].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[0].p_pv		:= ADR(REAL_In[0]);	// Store data in this variable 
	MasterConfig.action_param[0].quantity 	:= 8;			// Number of items to read 
	MasterConfig.action_param[0].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[0].start_addr := 6050;		// Read from this modbus address 
	MasterConfig.action_param[0].timer 		:= 100;			// Refresh timer for this item 
	MasterConfig.action_param[0].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 

	
	MasterConfig.action_enable[1].cyclic 	:= 1;			// Read data cyclic 
	MasterConfig.action_param[1].p_pv		:= ADR(UINT_In[0]);	// Store data in this variable 
	MasterConfig.action_param[1].quantity 	:= 10;			// Number of items to read 
	MasterConfig.action_param[1].unit 		:= 1;			// Unit address - ignore if not specified 
	MasterConfig.action_param[1].start_addr := 7000;		// Read from this modbus address 
	MasterConfig.action_param[1].timer 		:= 100;			// Refresh timer for this item 
	MasterConfig.action_param[1].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	//	MasterConfig.action_enable[1].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[1].p_pv		:= ADR(A_In[1]);	// Store data in this variable 
	//	MasterConfig.action_param[1].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[1].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[1].start_addr := 7100;		// Read from this modbus address 
	//	MasterConfig.action_param[1].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[1].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[2].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[2].p_pv		:= ADR(A_In[2]);	// Store data in this variable 
	//	MasterConfig.action_param[2].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[2].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[2].start_addr := 7104;		// Read from this modbus address 
	//	MasterConfig.action_param[2].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[2].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[3].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[3].p_pv		:= ADR(A_In[3]);	// Store data in this variable 
	//	MasterConfig.action_param[3].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[3].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[3].start_addr := 7110;		// Read from this modbus address 
	//	MasterConfig.action_param[3].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[3].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[4].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[4].p_pv		:= ADR(A_In[4]);	// Store data in this variable 
	//	MasterConfig.action_param[4].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[4].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[4].start_addr := 7112;		// Read from this modbus address 
	//	MasterConfig.action_param[4].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[4].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[5].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[5].p_pv		:= ADR(A_In[5]);	// Store data in this variable 
	//	MasterConfig.action_param[5].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[5].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[5].start_addr := 7114;		// Read from this modbus address 
	//	MasterConfig.action_param[5].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[5].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[6].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[6].p_pv		:= ADR(A_In[6]);	// Store data in this variable 
	//	MasterConfig.action_param[6].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[6].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[6].start_addr := 7116;		// Read from this modbus address 
	//	MasterConfig.action_param[6].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[6].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[7].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[7].p_pv		:= ADR(A_In[7]);	// Store data in this variable 
	//	MasterConfig.action_param[7].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[7].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[7].start_addr := 7118;		// Read from this modbus address 
	//	MasterConfig.action_param[7].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[7].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[8].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[8].p_pv		:= ADR(A_In[8]);	// Store data in this variable 
	//	MasterConfig.action_param[8].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[8].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[8].start_addr := 7120;		// Read from this modbus address 
	//	MasterConfig.action_param[8].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[8].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[9].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[9].p_pv		:= ADR(A_In[9]);	// Store data in this variable 
	//	MasterConfig.action_param[9].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[9].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[9].start_addr := 7122;		// Read from this modbus address 
	//	MasterConfig.action_param[9].timer 		:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[9].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[10].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[10].p_pv		:= ADR(A_In[10]);	// Store data in this variable 
	//	MasterConfig.action_param[10].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[10].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[10].start_addr := 7124;		// Read from this modbus address 
	//	MasterConfig.action_param[10].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[10].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[11].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[11].p_pv		:= ADR(A_In[11]);	// Store data in this variable 
	//	MasterConfig.action_param[11].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[11].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[11].start_addr := 7126;		// Read from this modbus address 
	//	MasterConfig.action_param[11].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[11].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[12].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[12].p_pv		:= ADR(A_In[12]);	// Store data in this variable 
	//	MasterConfig.action_param[12].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[12].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[12].start_addr := 7128;		// Read from this modbus address 
	//	MasterConfig.action_param[12].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[12].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[13].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[13].p_pv		:= ADR(A_In[13]);	// Store data in this variable 
	//	MasterConfig.action_param[13].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[13].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[13].start_addr := 7130;		// Read from this modbus address 
	//	MasterConfig.action_param[13].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[13].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[14].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[14].p_pv		:= ADR(A_In[14]);	// Store data in this variable 
	//	MasterConfig.action_param[14].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[14].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[14].start_addr := 7140;		// Read from this modbus address 
	//	MasterConfig.action_param[14].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[14].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[15].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[15].p_pv		:= ADR(A_In[15]);	// Store data in this variable 
	//	MasterConfig.action_param[15].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[15].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[15].start_addr := 7150;		// Read from this modbus address 
	//	MasterConfig.action_param[15].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[15].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[16].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[16].p_pv		:= ADR(A_In[16]);	// Store data in this variable 
	//	MasterConfig.action_param[16].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[16].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[16].start_addr := 7152;		// Read from this modbus address 
	//	MasterConfig.action_param[16].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[16].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[17].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[17].p_pv		:= ADR(A_In[17]);	// Store data in this variable 
	//	MasterConfig.action_param[17].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[17].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[17].start_addr := 7154;		// Read from this modbus address 
	//	MasterConfig.action_param[17].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[17].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[18].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[18].p_pv		:= ADR(A_In[18]);	// Store data in this variable 
	//	MasterConfig.action_param[18].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[18].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[18].start_addr := 7156;		// Read from this modbus address 
	//	MasterConfig.action_param[18].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[18].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[19].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[19].p_pv		:= ADR(A_In[19]);	// Store data in this variable 
	//	MasterConfig.action_param[19].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[19].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[19].start_addr := 7158;		// Read from this modbus address 
	//	MasterConfig.action_param[19].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[19].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[20].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[20].p_pv		:= ADR(A_In[20]);	// Store data in this variable 
	//	MasterConfig.action_param[20].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[20].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[20].start_addr := 7160;		// Read from this modbus address 
	//	MasterConfig.action_param[20].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[20].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[21].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[21].p_pv		:= ADR(A_In[21]);	// Store data in this variable 
	//	MasterConfig.action_param[21].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[21].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[21].start_addr := 7162;		// Read from this modbus address 
	//	MasterConfig.action_param[21].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[21].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[22].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[22].p_pv		:= ADR(A_In[22]);	// Store data in this variable 
	//	MasterConfig.action_param[22].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[22].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[22].start_addr := 7164;		// Read from this modbus address 
	//	MasterConfig.action_param[22].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[22].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[23].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[23].p_pv		:= ADR(A_In[23]);	// Store data in this variable 
	//	MasterConfig.action_param[23].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[23].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[23].start_addr := 7166;		// Read from this modbus address 
	//	MasterConfig.action_param[23].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[23].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[24].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[24].p_pv		:= ADR(A_In[24]);	// Store data in this variable 
	//	MasterConfig.action_param[24].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[24].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[24].start_addr := 7168;		// Read from this modbus address 
	//	MasterConfig.action_param[24].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[24].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[25].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[25].p_pv		:= ADR(A_In[25]);	// Store data in this variable 
	//	MasterConfig.action_param[25].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[25].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[25].start_addr := 7170;		// Read from this modbus address 
	//	MasterConfig.action_param[25].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[25].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[26].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[26].p_pv		:= ADR(A_In[26]);	// Store data in this variable 
	//	MasterConfig.action_param[26].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[26].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[26].start_addr := 7180;		// Read from this modbus address 
	//	MasterConfig.action_param[26].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[26].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[27].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[27].p_pv		:= ADR(A_In[27]);	// Store data in this variable 
	//	MasterConfig.action_param[27].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[27].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[27].start_addr := 7184;		// Read from this modbus address 
	//	MasterConfig.action_param[27].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[27].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[28].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[28].p_pv		:= ADR(A_In[28]);	// Store data in this variable 
	//	MasterConfig.action_param[28].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[28].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[28].start_addr := 7190;		// Read from this modbus address 
	//	MasterConfig.action_param[28].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[28].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[29].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[29].p_pv		:= ADR(A_In[29]);	// Store data in this variable 
	//	MasterConfig.action_param[29].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[29].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[29].start_addr := 7192;		// Read from this modbus address 
	//	MasterConfig.action_param[29].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[29].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[30].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[30].p_pv		:= ADR(A_In[30]);	// Store data in this variable 
	//	MasterConfig.action_param[30].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[30].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[30].start_addr := 7194;		// Read from this modbus address 
	//	MasterConfig.action_param[30].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[30].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[31].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[31].p_pv		:= ADR(A_In[31]);	// Store data in this variable 
	//	MasterConfig.action_param[31].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[31].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[31].start_addr := 7196;		// Read from this modbus address 
	//	MasterConfig.action_param[31].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[31].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[32].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[32].p_pv		:= ADR(A_In[32]);	// Store data in this variable 
	//	MasterConfig.action_param[32].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[32].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[32].start_addr := 7198;		// Read from this modbus address 
	//	MasterConfig.action_param[32].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[32].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[33].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[33].p_pv		:= ADR(A_In[33]);	// Store data in this variable 
	//	MasterConfig.action_param[33].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[33].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[33].start_addr := 7200;		// Read from this modbus address 
	//	MasterConfig.action_param[33].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[33].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[34].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[34].p_pv		:= ADR(A_In[34]);	// Store data in this variable 
	//	MasterConfig.action_param[34].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[34].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[34].start_addr := 7202;		// Read from this modbus address 
	//	MasterConfig.action_param[34].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[34].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[35].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[35].p_pv		:= ADR(A_In[35]);	// Store data in this variable 
	//	MasterConfig.action_param[35].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[35].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[35].start_addr := 7204;		// Read from this modbus address 
	//	MasterConfig.action_param[35].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[35].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[36].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[36].p_pv		:= ADR(A_In[36]);	// Store data in this variable 
	//	MasterConfig.action_param[36].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[36].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[36].start_addr := 7206;		// Read from this modbus address 
	//	MasterConfig.action_param[36].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[36].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[37].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[37].p_pv		:= ADR(A_In[37]);	// Store data in this variable 
	//	MasterConfig.action_param[37].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[37].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[37].start_addr := 7208;		// Read from this modbus address 
	//	MasterConfig.action_param[37].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[37].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[38].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[38].p_pv		:= ADR(A_In[38]);	// Store data in this variable 
	//	MasterConfig.action_param[38].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[38].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[38].start_addr := 7210;		// Read from this modbus address 
	//	MasterConfig.action_param[38].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[38].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[39].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[39].p_pv		:= ADR(A_In[39]);	// Store data in this variable 
	//	MasterConfig.action_param[39].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[39].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[39].start_addr := 7620;		// Read from this modbus address 
	//	MasterConfig.action_param[39].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[39].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[40].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[40].p_pv		:= ADR(A_In[40]);	// Store data in this variable 
	//	MasterConfig.action_param[40].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[40].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[40].start_addr := 7624;		// Read from this modbus address 
	//	MasterConfig.action_param[40].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[40].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[41].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[41].p_pv		:= ADR(A_In[41]);	// Store data in this variable 
	//	MasterConfig.action_param[41].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[41].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[41].start_addr := 7628;		// Read from this modbus address 
	//	MasterConfig.action_param[41].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[41].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[42].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[42].p_pv		:= ADR(A_In[42]);	// Store data in this variable 
	//	MasterConfig.action_param[42].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[42].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[42].start_addr := 6050;		// Read from this modbus address 
	//	MasterConfig.action_param[42].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[42].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[43].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[43].p_pv		:= ADR(A_In[43]);	// Store data in this variable 
	//	MasterConfig.action_param[43].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[43].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[43].start_addr := 6052;		// Read from this modbus address 
	//	MasterConfig.action_param[43].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[43].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[44].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[44].p_pv		:= ADR(A_In[44]);	// Store data in this variable 
	//	MasterConfig.action_param[44].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[44].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[44].start_addr := 6054;		// Read from this modbus address 
	//	MasterConfig.action_param[44].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[44].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[45].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[45].p_pv		:= ADR(A_In[45]);	// Store data in this variable 
	//	MasterConfig.action_param[45].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[45].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[45].start_addr := 6056;		// Read from this modbus address 
	//	MasterConfig.action_param[45].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[45].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[46].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[46].p_pv		:= ADR(A_In[46]);	// Store data in this variable 
	//	MasterConfig.action_param[46].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[46].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[46].start_addr := 6100;		// Read from this modbus address 
	//	MasterConfig.action_param[46].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[46].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[47].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[47].p_pv		:= ADR(A_In[47]);	// Store data in this variable 
	//	MasterConfig.action_param[47].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[47].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[47].start_addr := 6102;		// Read from this modbus address 
	//	MasterConfig.action_param[47].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[47].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[48].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[48].p_pv		:= ADR(A_In[48]);	// Store data in this variable 
	//	MasterConfig.action_param[48].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[48].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[48].start_addr := 6104;		// Read from this modbus address 
	//	MasterConfig.action_param[48].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[48].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[49].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[49].p_pv		:= ADR(A_In[49]);	// Store data in this variable 
	//	MasterConfig.action_param[49].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[49].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[49].start_addr := 6106;		// Read from this modbus address 
	//	MasterConfig.action_param[49].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[49].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[50].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[50].p_pv		:= ADR(A_In[50]);	// Store data in this variable 
	//	MasterConfig.action_param[50].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[50].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[50].start_addr := 6110;		// Read from this modbus address 
	//	MasterConfig.action_param[50].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[50].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[51].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[51].p_pv		:= ADR(A_In[51]);	// Store data in this variable 
	//	MasterConfig.action_param[51].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[51].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[51].start_addr := 6114;		// Read from this modbus address 
	//	MasterConfig.action_param[51].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[51].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[52].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[52].p_pv		:= ADR(A_In[52]);	// Store data in this variable 
	//	MasterConfig.action_param[52].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[52].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[52].start_addr := 6150;		// Read from this modbus address 
	//	MasterConfig.action_param[52].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[52].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[53].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[53].p_pv		:= ADR(A_In[53]);	// Store data in this variable 
	//	MasterConfig.action_param[53].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[53].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[53].start_addr := 6140;		// Read from this modbus address 
	//	MasterConfig.action_param[53].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[53].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[54].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[54].p_pv		:= ADR(A_In[54]);	// Store data in this variable 
	//	MasterConfig.action_param[54].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[54].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[54].start_addr := 6142;		// Read from this modbus address 
	//	MasterConfig.action_param[54].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[54].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[55].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[55].p_pv		:= ADR(A_In[55]);	// Store data in this variable 
	//	MasterConfig.action_param[55].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[55].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[55].start_addr := 6148;		// Read from this modbus address 
	//	MasterConfig.action_param[55].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[55].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[56].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[56].p_pv		:= ADR(A_In[56]);	// Store data in this variable 
	//	MasterConfig.action_param[56].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[56].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[56].start_addr := 6152;		// Read from this modbus address 
	//	MasterConfig.action_param[56].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[56].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[57].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[57].p_pv		:= ADR(A_In[57]);	// Store data in this variable 
	//	MasterConfig.action_param[57].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[57].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[57].start_addr := 6154;		// Read from this modbus address 
	//	MasterConfig.action_param[57].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[57].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[58].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[58].p_pv		:= ADR(A_In[58]);	// Store data in this variable 
	//	MasterConfig.action_param[58].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[58].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[58].start_addr := 6230;		// Read from this modbus address 
	//	MasterConfig.action_param[58].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[58].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[59].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[59].p_pv		:= ADR(A_In[59]);	// Store data in this variable 
	//	MasterConfig.action_param[59].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[59].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[59].start_addr := 6220;		// Read from this modbus address 
	//	MasterConfig.action_param[59].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[59].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[60].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[60].p_pv		:= ADR(A_In[60]);	// Store data in this variable 
	//	MasterConfig.action_param[60].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[60].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[60].start_addr := 6226;		// Read from this modbus address 
	//	MasterConfig.action_param[60].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[60].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[61].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[61].p_pv		:= ADR(A_In[61]);	// Store data in this variable 
	//	MasterConfig.action_param[61].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[61].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[61].start_addr := 6232;		// Read from this modbus address 
	//	MasterConfig.action_param[61].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[61].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[62].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[62].p_pv		:= ADR(A_In[62]);	// Store data in this variable 
	//	MasterConfig.action_param[62].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[62].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[62].start_addr := 6234;		// Read from this modbus address 
	//	MasterConfig.action_param[62].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[62].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[63].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[63].p_pv		:= ADR(A_In[63]);	// Store data in this variable 
	//	MasterConfig.action_param[63].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[63].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[63].start_addr := 6240;		// Read from this modbus address 
	//	MasterConfig.action_param[63].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[63].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[64].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[64].p_pv		:= ADR(A_In[64]);	// Store data in this variable 
	//	MasterConfig.action_param[64].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[64].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[64].start_addr := 6270;		// Read from this modbus address 
	//	MasterConfig.action_param[64].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[64].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[65].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[65].p_pv		:= ADR(A_In[65]);	// Store data in this variable 
	//	MasterConfig.action_param[65].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[65].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[65].start_addr := 6260;		// Read from this modbus address 
	//	MasterConfig.action_param[65].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[65].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[66].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[66].p_pv		:= ADR(A_In[66]);	// Store data in this variable 
	//	MasterConfig.action_param[66].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[66].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[66].start_addr := 6266;		// Read from this modbus address 
	//	MasterConfig.action_param[66].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[66].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[67].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[67].p_pv		:= ADR(A_In[67]);	// Store data in this variable 
	//	MasterConfig.action_param[67].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[67].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[67].start_addr := 6272;		// Read from this modbus address 
	//	MasterConfig.action_param[67].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[67].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[68].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[68].p_pv		:= ADR(A_In[68]);	// Store data in this variable 
	//	MasterConfig.action_param[68].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[68].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[68].start_addr := 6274;		// Read from this modbus address 
	//	MasterConfig.action_param[68].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[68].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[69].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[69].p_pv		:= ADR(A_In[69]);	// Store data in this variable 
	//	MasterConfig.action_param[69].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[69].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[69].start_addr := 6280;		// Read from this modbus address 
	//	MasterConfig.action_param[69].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[69].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[70].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[70].p_pv		:= ADR(A_In[70]);	// Store data in this variable 
	//	MasterConfig.action_param[70].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[70].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[70].start_addr := 6310;		// Read from this modbus address 
	//	MasterConfig.action_param[70].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[70].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[71].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[71].p_pv		:= ADR(A_In[71]);	// Store data in this variable 
	//	MasterConfig.action_param[71].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[71].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[71].start_addr := 6300;		// Read from this modbus address 
	//	MasterConfig.action_param[71].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[71].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[72].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[72].p_pv		:= ADR(A_In[72]);	// Store data in this variable 
	//	MasterConfig.action_param[72].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[72].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[72].start_addr := 6302;		// Read from this modbus address 
	//	MasterConfig.action_param[72].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[72].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[73].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[73].p_pv		:= ADR(A_In[73]);	// Store data in this variable 
	//	MasterConfig.action_param[73].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[73].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[73].start_addr := 6306;		// Read from this modbus address 
	//	MasterConfig.action_param[73].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[73].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[74].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[74].p_pv		:= ADR(A_In[74]);	// Store data in this variable 
	//	MasterConfig.action_param[74].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[74].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[74].start_addr := 6308;		// Read from this modbus address 
	//	MasterConfig.action_param[74].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[74].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[75].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[75].p_pv		:= ADR(A_In[75]);	// Store data in this variable 
	//	MasterConfig.action_param[75].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[75].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[75].start_addr := 6312;		// Read from this modbus address 
	//	MasterConfig.action_param[75].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[75].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[76].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[76].p_pv		:= ADR(A_In[76]);	// Store data in this variable 
	//	MasterConfig.action_param[76].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[76].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[76].start_addr := 6314;		// Read from this modbus address 
	//	MasterConfig.action_param[76].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[76].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[77].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[77].p_pv		:= ADR(A_In[77]);	// Store data in this variable 
	//	MasterConfig.action_param[77].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[77].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[77].start_addr := 6350;		// Read from this modbus address 
	//	MasterConfig.action_param[77].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[77].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[78].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[78].p_pv		:= ADR(A_In[78]);	// Store data in this variable 
	//	MasterConfig.action_param[78].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[78].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[78].start_addr := 6352;		// Read from this modbus address 
	//	MasterConfig.action_param[78].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[78].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[79].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[79].p_pv		:= ADR(A_In[79]);	// Store data in this variable 
	//	MasterConfig.action_param[79].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[79].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[79].start_addr := 6354;		// Read from this modbus address 
	//	MasterConfig.action_param[79].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[79].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[80].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[80].p_pv		:= ADR(A_In[80]);	// Store data in this variable 
	//	MasterConfig.action_param[80].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[80].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[80].start_addr := 6356;		// Read from this modbus address 
	//	MasterConfig.action_param[80].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[80].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[81].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[81].p_pv		:= ADR(A_In[81]);	// Store data in this variable 
	//	MasterConfig.action_param[81].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[81].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[81].start_addr := 6362;		// Read from this modbus address 
	//	MasterConfig.action_param[81].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[81].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[82].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[82].p_pv		:= ADR(A_In[82]);	// Store data in this variable 
	//	MasterConfig.action_param[82].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[82].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[82].start_addr := 6364;		// Read from this modbus address 
	//	MasterConfig.action_param[82].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[82].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[83].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[83].p_pv		:= ADR(A_In[83]);	// Store data in this variable 
	//	MasterConfig.action_param[83].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[83].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[83].start_addr := 6374;		// Read from this modbus address 
	//	MasterConfig.action_param[83].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[83].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	//	
	//	MasterConfig.action_enable[84].cyclic 	:= 1;			// Read data cyclic 
	//	MasterConfig.action_param[84].p_pv		:= ADR(A_In[84]);	// Store data in this variable 
	//	MasterConfig.action_param[84].quantity 	:= 1;			// Number of items to read 
	//	MasterConfig.action_param[84].unit 		:= 1;			// Unit address - ignore if not specified 
	//	MasterConfig.action_param[84].start_addr := 6376;		// Read from this modbus address 
	//	MasterConfig.action_param[84].timer 	:= 100;			// Refresh timer for this item 
	//	MasterConfig.action_param[84].type 		:= 3;			// Function code for this item (2 := read discrete inputs) 
	
	
	
	// --------------------------------------------------------------------
	// Sample FOR reading data from a modbusTCP slave
	// --------------------------------------------------------------------
	FOR IdxSkids := 0 TO MAX_SKIDS DO
		ModbusTcpMaster[IdxSkids].enable 			:= 1;						// Start master 
		ModbusTcpMaster[IdxSkids].device			:= ADR(interface); 			// Ethernet device string 
		ModbusTcpMaster[IdxSkids].p_cfg 			:= ADR(MasterConfig); 		// Pointer to configuration 
		ModbusTcpMaster[IdxSkids].p_log 			:= ADR(logger);				// Pointer to logger string array. The logger information will show communication details. Enable for debugging, disable for production to save system resources.
		ModbusTcpMaster[IdxSkids].port				:= 510;
		ModbusTcpMaster[IdxSkids].slave_ip_addr 	:= SLAVE_IP_ADDRESSES[IdxSkids]; 						// Transfer slave device IP address 
	END_FOR;
	
	//Set IP Per Skid

	
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
			
			
			gSkid[IdxSkids].Pmax_General_Variables.skid_id := UINT_In[0]);
			
		END_FOR;
	END_IF


	

	  
		
		

	
END_PROGRAM
