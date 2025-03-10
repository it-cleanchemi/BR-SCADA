
ACTION Modbus_CMD_action: 
	
	// --------------------------------------------------------------------
	// Variable Write Commands
	// --------------------------------------------------------------------	
	
	
	// AS Block 5 - UNIT_ID
	IF gCmd[IdxSkids].Write_UNIT_ID.Send THEN
		MasterConfig[IdxSkids].action_enable[4].single := TRUE;
		gCmd[IdxSkids].Write_UNIT_ID.Send := FALSE;
	END_IF;

	// AS Block 6 - P201_XS
	IF gCmd[IdxSkids].Write_P201_XS.Send THEN
		MasterConfig[IdxSkids].action_enable[5].single := TRUE;
		gCmd[IdxSkids].Write_P201_XS.Send := FALSE;
		gCmd[IdxSkids].Write_P201_XS.wP201_XS.2 := 1;
	END_IF;
	
	// AS Block 7 - P201_HOA
	IF gCmd[IdxSkids].Write_P201_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[6].single := TRUE;
		gCmd[IdxSkids].Write_P201_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 8 - P201_PPM
	IF gCmd[IdxSkids].Write_P201_PPM.Send THEN
		gCmd[IdxSkids].Write_P201_PPM.wP201_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P201_PPM.wP201_PPM);
		MasterConfig[IdxSkids].action_enable[7].single := TRUE;
		gCmd[IdxSkids].Write_P201_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 9 - P201_SP
	IF gCmd[IdxSkids].Write_P201_SP.Send THEN
		gCmd[IdxSkids].Write_P201_SP.wP201_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P201_SP.wP201_SP);
		MasterConfig[IdxSkids].action_enable[8].single := TRUE;
		gCmd[IdxSkids].Write_P201_SP.Send := FALSE;
	END_IF;
	
	// AS Block 10 - P202_XS
	IF gCmd[IdxSkids].Write_P202_XS.Send THEN
		MasterConfig[IdxSkids].action_enable[9].single := TRUE;
		gCmd[IdxSkids].Write_P202_XS.Send := FALSE;
	END_IF;
	
	// AS Block 11 - P202_HOA
	IF gCmd[IdxSkids].Write_P202_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[10].single := TRUE;
		gCmd[IdxSkids].Write_P202_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 12 - P202_PPM
	IF gCmd[IdxSkids].Write_P202_PPM.Send THEN
		gCmd[IdxSkids].Write_P202_PPM.wP202_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P202_PPM.wP202_PPM);
		MasterConfig[IdxSkids].action_enable[11].single := TRUE;
		gCmd[IdxSkids].Write_P202_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 13 - P202_SP
	IF gCmd[IdxSkids].Write_P202_SP.Send THEN
		gCmd[IdxSkids].Write_P202_SP.wP202_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P202_SP.wP202_SP);
		MasterConfig[IdxSkids].action_enable[12].single := TRUE;
		gCmd[IdxSkids].Write_P202_SP.Send := FALSE;
	END_IF;
	
	// AS Block 14 - P203_XS
	IF gCmd[IdxSkids].Write_P203_XS.Send THEN
		MasterConfig[IdxSkids].action_enable[13].single := TRUE;
		gCmd[IdxSkids].Write_P203_XS.Send := FALSE;
	END_IF;
	
	// AS Block 15 - P203_HOA
	IF gCmd[IdxSkids].Write_P203_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[14].single := TRUE;
		gCmd[IdxSkids].Write_P203_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 16 - P203_PPM
	IF gCmd[IdxSkids].Write_P203_PPM.Send THEN
		gCmd[IdxSkids].Write_P203_PPM.wP203_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P203_PPM.wP203_PPM);
		MasterConfig[IdxSkids].action_enable[15].single := TRUE;
		gCmd[IdxSkids].Write_P203_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 17 - P203_SP
	IF gCmd[IdxSkids].Write_P203_SP.Send THEN
		gCmd[IdxSkids].Write_P203_SP.wP203_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P203_SP.wP203_SP);
		MasterConfig[IdxSkids].action_enable[16].single := TRUE;
		gCmd[IdxSkids].Write_P203_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 18 - EFF_1
	IF gCmd[IdxSkids].Write_EFF_1.Send THEN
		gCmd[IdxSkids].Write_EFF_1.wEFF_1_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_EFF_1.wEFF_1);
		MasterConfig[IdxSkids].action_enable[17].single := TRUE;
		gCmd[IdxSkids].Write_EFF_1.Send := FALSE;
	END_IF;	
	
	// AS Block 19 - EFF_2
	IF gCmd[IdxSkids].Write_EFF_2.Send THEN
		gCmd[IdxSkids].Write_EFF_2.wEFF_2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_EFF_2.wEFF_2);
		MasterConfig[IdxSkids].action_enable[18].single := TRUE;
		gCmd[IdxSkids].Write_EFF_2.Send := FALSE;
	END_IF;		
	
	// AS Block 20 - NAOH_TO_H2O2
	IF gCmd[IdxSkids].Write_NAOH_TO_H2O2.Send THEN
		gCmd[IdxSkids].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2);
		MasterConfig[IdxSkids].action_enable[19].single := TRUE;
		gCmd[IdxSkids].Write_NAOH_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 21 - TRI_TO_H2O2
	IF gCmd[IdxSkids].Write_TRI_TO_H2O2.Send THEN
		gCmd[IdxSkids].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_TRI_TO_H2O2.wTRI_TO_H2O2);
		MasterConfig[IdxSkids].action_enable[20].single := TRUE;
		gCmd[IdxSkids].Write_TRI_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 22 - PMAX_HOA
	IF gCmd[IdxSkids].Write_PMAX_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[21].single := TRUE;
		gCmd[IdxSkids].Write_PMAX_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 23 - PMAX_CONC
	IF gCmd[IdxSkids].Write_PMAX_CONC.Send THEN
		gCmd[IdxSkids].Write_PMAX_CONC.wPMAX_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_PMAX_CONC.wPMAX_CONC);
		MasterConfig[IdxSkids].action_enable[22].single := TRUE;
		gCmd[IdxSkids].Write_PMAX_CONC.Send := FALSE;
	END_IF;		
	
	// AS Block 24 - HP_CONC
	IF gCmd[IdxSkids].Write_HP_CONC.Send THEN
		gCmd[IdxSkids].Write_HP_CONC.wHP_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_HP_CONC.wHP_CONC);
		MasterConfig[IdxSkids].action_enable[23].single := TRUE;
		gCmd[IdxSkids].Write_HP_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 25 - NAOH_CONC
	IF gCmd[IdxSkids].Write_NAOH_CONC.Send THEN
		gCmd[IdxSkids].Write_NAOH_CONC.wNAOH_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_NAOH_CONC.wNAOH_CONC);
		MasterConfig[IdxSkids].action_enable[24].single := TRUE;
		gCmd[IdxSkids].Write_NAOH_CONC.Send := FALSE;
	END_IF;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

END_ACTION
