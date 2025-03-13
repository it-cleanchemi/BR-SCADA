
ACTION Modbus_CMD_action: 
	
	// --------------------------------------------------------------------
	// Variable Write Commands
	// --------------------------------------------------------------------	
	
	
	// AS Block 12 - UNIT_ID
	IF gCmd[IdxSkids].Write_UNIT_ID.Send THEN
		MasterConfig[IdxSkids].action_enable[11].single := TRUE;
		gCmd[IdxSkids].Write_UNIT_ID.Send := FALSE;
	END_IF;
	
	// AS Block 13 - P201_STRT_CMD
	IF gCmd[IdxSkids].Write_P201_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[12].single := TRUE;
		gCmd[IdxSkids].Write_P201_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 14 - P201_STP_CMD
	IF gCmd[IdxSkids].Write_P201_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[13].single := TRUE;
		gCmd[IdxSkids].Write_P201_STP_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 15 - P201_HOA
	IF gCmd[IdxSkids].Write_P201_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[14].single := TRUE;
		gCmd[IdxSkids].Write_P201_HOA.Send := FALSE;
	END_IF;

	// AS Block 16 - P201_PPM
	IF gCmd[IdxSkids].Write_P201_PPM.Send THEN
		gCmd[IdxSkids].Write_P201_PPM.wP201_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P201_PPM.wP201_PPM);
		MasterConfig[IdxSkids].action_enable[15].single := TRUE;
		gCmd[IdxSkids].Write_P201_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 17 - P201_SP
	IF gCmd[IdxSkids].Write_P201_SP.Send THEN
		gCmd[IdxSkids].Write_P201_SP.wP201_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P201_SP.wP201_SP);
		MasterConfig[IdxSkids].action_enable[16].single := TRUE;
		gCmd[IdxSkids].Write_P201_SP.Send := FALSE;
	END_IF;
	
	// AS Block 18 - P202_STRT_CMD
	IF gCmd[IdxSkids].Write_P202_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[17].single := TRUE;
		gCmd[IdxSkids].Write_P202_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 19 - P202_STP_CMD
	IF gCmd[IdxSkids].Write_P202_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[18].single := TRUE;
		gCmd[IdxSkids].Write_P202_STP_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 20 - P202_HOA
	IF gCmd[IdxSkids].Write_P202_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[19].single := TRUE;
		gCmd[IdxSkids].Write_P202_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 21 - P202_PPM
	IF gCmd[IdxSkids].Write_P202_PPM.Send THEN
		gCmd[IdxSkids].Write_P202_PPM.wP202_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P202_PPM.wP202_PPM);
		MasterConfig[IdxSkids].action_enable[20].single := TRUE;
		gCmd[IdxSkids].Write_P202_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 22 - P202_SP
	IF gCmd[IdxSkids].Write_P202_SP.Send THEN
		gCmd[IdxSkids].Write_P202_SP.wP202_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P202_SP.wP202_SP);
		MasterConfig[IdxSkids].action_enable[21].single := TRUE;
		gCmd[IdxSkids].Write_P202_SP.Send := FALSE;
	END_IF;

	// AS Block 23 - P203_STRT_CMD
	IF gCmd[IdxSkids].Write_P203_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[22].single := TRUE;
		gCmd[IdxSkids].Write_P203_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 24 - P203_STP_CMD
	IF gCmd[IdxSkids].Write_P203_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[23].single := TRUE;
		gCmd[IdxSkids].Write_P203_STP_CMD.Send := FALSE;
	END_IF;	

	// AS Block 25 - P203_HOA
	IF gCmd[IdxSkids].Write_P203_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[24].single := TRUE;
		gCmd[IdxSkids].Write_P203_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 26 - P203_PPM
	IF gCmd[IdxSkids].Write_P203_PPM.Send THEN
		gCmd[IdxSkids].Write_P203_PPM.wP203_PPM_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P203_PPM.wP203_PPM);
		MasterConfig[IdxSkids].action_enable[25].single := TRUE;
		gCmd[IdxSkids].Write_P203_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 27 - P203_SP
	IF gCmd[IdxSkids].Write_P203_SP.Send THEN
		gCmd[IdxSkids].Write_P203_SP.wP203_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P203_SP.wP203_SP);
		MasterConfig[IdxSkids].action_enable[26].single := TRUE;
		gCmd[IdxSkids].Write_P203_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 28 - EFF_1
	IF gCmd[IdxSkids].Write_EFF_1.Send THEN
		gCmd[IdxSkids].Write_EFF_1.wEFF_1_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_EFF_1.wEFF_1);
		MasterConfig[IdxSkids].action_enable[27].single := TRUE;
		gCmd[IdxSkids].Write_EFF_1.Send := FALSE;
	END_IF;	
	
	// AS Block 29 - EFF_2
	IF gCmd[IdxSkids].Write_EFF_2.Send THEN
		gCmd[IdxSkids].Write_EFF_2.wEFF_2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_EFF_2.wEFF_2);
		MasterConfig[IdxSkids].action_enable[28].single := TRUE;
		gCmd[IdxSkids].Write_EFF_2.Send := FALSE;
	END_IF;		
	
	// AS Block 30 - NAOH_TO_H2O2
	IF gCmd[IdxSkids].Write_NAOH_TO_H2O2.Send THEN
		gCmd[IdxSkids].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2);
		MasterConfig[IdxSkids].action_enable[29].single := TRUE;
		gCmd[IdxSkids].Write_NAOH_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 31 - TRI_TO_H2O2
	IF gCmd[IdxSkids].Write_TRI_TO_H2O2.Send THEN
		gCmd[IdxSkids].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_TRI_TO_H2O2.wTRI_TO_H2O2);
		MasterConfig[IdxSkids].action_enable[30].single := TRUE;
		gCmd[IdxSkids].Write_TRI_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 32 - PMAX_HOA
	IF gCmd[IdxSkids].Write_PMAX_HOA.Send THEN
		MasterConfig[IdxSkids].action_enable[31].single := TRUE;
		gCmd[IdxSkids].Write_PMAX_HOA.Send := FALSE;
	END_IF;
	
	// AS Block 33 - PMAX_CONC
	IF gCmd[IdxSkids].Write_PMAX_CONC.Send THEN
		gCmd[IdxSkids].Write_PMAX_CONC.wPMAX_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_PMAX_CONC.wPMAX_CONC);
		MasterConfig[IdxSkids].action_enable[32].single := TRUE;
		gCmd[IdxSkids].Write_PMAX_CONC.Send := FALSE;
	END_IF;		
	
	// AS Block 34 - HP_CONC
	IF gCmd[IdxSkids].Write_HP_CONC.Send THEN
		gCmd[IdxSkids].Write_HP_CONC.wHP_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_HP_CONC.wHP_CONC);
		MasterConfig[IdxSkids].action_enable[33].single := TRUE;
		gCmd[IdxSkids].Write_HP_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 35 - NAOH_CONC
	IF gCmd[IdxSkids].Write_NAOH_CONC.Send THEN
		gCmd[IdxSkids].Write_NAOH_CONC.wNAOH_CONC_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_NAOH_CONC.wNAOH_CONC);
		MasterConfig[IdxSkids].action_enable[34].single := TRUE;
		gCmd[IdxSkids].Write_NAOH_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 36 - P101_STRT_CMD
	IF gCmd[IdxSkids].Write_P101_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[35].single := TRUE;
		gCmd[IdxSkids].Write_P101_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 37 - P101_STP_CMD
	IF gCmd[IdxSkids].Write_P101_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[36].single := TRUE;
		gCmd[IdxSkids].Write_P101_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 38 - P101_SP
	IF gCmd[IdxSkids].Write_P101_SP.Send THEN
		gCmd[IdxSkids].Write_P101_SP.wP101_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P101_SP.wP101_SP);
		MasterConfig[IdxSkids].action_enable[37].single := TRUE;
		gCmd[IdxSkids].Write_P101_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 39 - P102_STRT_CMD
	IF gCmd[IdxSkids].Write_P102_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[38].single := TRUE;
		gCmd[IdxSkids].Write_P102_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 40 - P102_STP_CMD
	IF gCmd[IdxSkids].Write_P102_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[39].single := TRUE;
		gCmd[IdxSkids].Write_P102_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 41 - P102_SP
	IF gCmd[IdxSkids].Write_P102_SP.Send THEN
		gCmd[IdxSkids].Write_P102_SP.wP102_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P102_SP.wP102_SP);
		MasterConfig[IdxSkids].action_enable[40].single := TRUE;
		gCmd[IdxSkids].Write_P102_SP.Send := FALSE;
	END_IF;	

	// AS Block 42 - P103_STRT_CMD
	IF gCmd[IdxSkids].Write_P103_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[41].single := TRUE;
		gCmd[IdxSkids].Write_P103_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 43 - P103_STP_CMD
	IF gCmd[IdxSkids].Write_P103_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[42].single := TRUE;
		gCmd[IdxSkids].Write_P103_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 44 - P103_SP
	IF gCmd[IdxSkids].Write_P103_SP.Send THEN
		gCmd[IdxSkids].Write_P103_SP.wP103_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P103_SP.wP103_SP);
		MasterConfig[IdxSkids].action_enable[43].single := TRUE;
		gCmd[IdxSkids].Write_P103_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 45 - P104_STRT_CMD
	IF gCmd[IdxSkids].Write_P104_STRT_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[44].single := TRUE;
		gCmd[IdxSkids].Write_P103_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 46 - P104_STP_CMD
	IF gCmd[IdxSkids].Write_P104_STP_CMD.Send THEN
		MasterConfig[IdxSkids].action_enable[45].single := TRUE;
		gCmd[IdxSkids].Write_P104_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 47 - P104_SP
	IF gCmd[IdxSkids].Write_P104_SP.Send THEN
		gCmd[IdxSkids].Write_P104_SP.wP104_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].Write_P104_SP.wP104_SP);
		MasterConfig[IdxSkids].action_enable[46].single := TRUE;
		gCmd[IdxSkids].Write_P104_SP.Send := FALSE;
	END_IF;	
	

END_ACTION
