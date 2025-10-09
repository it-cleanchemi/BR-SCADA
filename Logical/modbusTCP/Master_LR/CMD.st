
ACTION Modbus_CMD_action: 
	
	// --------------------------------------------------------------------
	// Variable Write Commands
	// --------------------------------------------------------------------	

	
	// AS Block 12 - UNIT_ID
	IF gCMD_LR[IdxSkids_LR].Write_UNIT_ID.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[11].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_UNIT_ID.Send := FALSE;
	END_IF;
	
	// AS Block 13 - P201_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P201_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[12].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 14 - P201_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P201_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[13].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_STP_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 15 - P201_HOA
	IF gCMD_LR[IdxSkids_LR].Write_P201_HOA.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_HOA.wP201_HOA := STRING_TO_UINT(gCMD_LR[IdxSkids_LR].Write_P201_HOA.wP201_HOA_String);
		MasterConfig_LR[IdxSkids_LR].action_enable[14].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_HOA.Send := FALSE;
	ELSIF NOT gVis.Main.Out.DialogOpen THEN
		gCMD_LR[IdxSkids_LR].Write_P201_HOA.wP201_HOA_String := UINT_TO_STRING(gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA);
	END_IF;

	// AS Block 16 - P201_PPM
	IF gCMD_LR[IdxSkids_LR].Write_P201_PPM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_PPM.wP201_PPM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P201_PPM.wP201_PPM);
		MasterConfig_LR[IdxSkids_LR].action_enable[15].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 17 - P201_SP
	IF gCMD_LR[IdxSkids_LR].Write_P201_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_SP.wP201_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P201_SP.wP201_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[16].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_SP.Send := FALSE;
	END_IF;
	
	// AS Block 18 - P202_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P202_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[17].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 19 - P202_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P202_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[18].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_STP_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 20 - P202_HOA
	IF gCMD_LR[IdxSkids_LR].Write_P202_HOA.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_HOA.wP202_HOA := STRING_TO_UINT(gCMD_LR[IdxSkids_LR].Write_P202_HOA.wP202_HOA_String);
		MasterConfig_LR[IdxSkids_LR].action_enable[19].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_HOA.Send := FALSE;
	ELSIF NOT gVis.Main.Out.DialogOpen THEN
		gCMD_LR[IdxSkids_LR].Write_P202_HOA.wP202_HOA_String := UINT_TO_STRING(gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA);
	END_IF;
	
	// AS Block 21 - P202_PPM
	IF gCMD_LR[IdxSkids_LR].Write_P202_PPM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_PPM.wP202_PPM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P202_PPM.wP202_PPM);
		MasterConfig_LR[IdxSkids_LR].action_enable[20].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 22 - P202_SP
	IF gCMD_LR[IdxSkids_LR].Write_P202_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_SP.wP202_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P202_SP.wP202_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[21].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_SP.Send := FALSE;
	END_IF;

	// AS Block 23 - P203_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P203_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[22].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 24 - P203_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P203_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[23].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_STP_CMD.Send := FALSE;
	END_IF;	

	// AS Block 25 - P203_HOA
	IF gCMD_LR[IdxSkids_LR].Write_P203_HOA.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_HOA.wP203_HOA := STRING_TO_UINT(gCMD_LR[IdxSkids_LR].Write_P203_HOA.wP203_HOA_String);
		MasterConfig_LR[IdxSkids_LR].action_enable[24].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_HOA.Send := FALSE;
	ELSIF NOT gVis.Main.Out.DialogOpen THEN
		gCMD_LR[IdxSkids_LR].Write_P203_HOA.wP203_HOA_String := UINT_TO_STRING(gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA);
	END_IF;
	
	// AS Block 26 - P203_PPM
	IF gCMD_LR[IdxSkids_LR].Write_P203_PPM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_PPM.wP203_PPM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P203_PPM.wP203_PPM);
		MasterConfig_LR[IdxSkids_LR].action_enable[25].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_PPM.Send := FALSE;
	END_IF;
	
	// AS Block 27 - P203_SP
	IF gCMD_LR[IdxSkids_LR].Write_P203_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_SP.wP203_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P203_SP.wP203_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[26].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 28 - EFF_1
	IF gCMD_LR[IdxSkids_LR].Write_EFF_1.Send THEN
		gCMD_LR[IdxSkids_LR].Write_EFF_1.wEFF_1_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_EFF_1.wEFF_1);
		MasterConfig_LR[IdxSkids_LR].action_enable[27].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_EFF_1.Send := FALSE;
	END_IF;	
	
	// AS Block 29 - EFF_2
	IF gCMD_LR[IdxSkids_LR].Write_EFF_2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_EFF_2.wEFF_2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_EFF_2.wEFF_2);
		MasterConfig_LR[IdxSkids_LR].action_enable[28].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_EFF_2.Send := FALSE;
	END_IF;		
	
	// AS Block 30 - NAOH_TO_H2O2
	IF gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2);
		MasterConfig_LR[IdxSkids_LR].action_enable[29].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 31 - TRI_TO_H2O2
	IF gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.wTRI_TO_H2O2);
		MasterConfig_LR[IdxSkids_LR].action_enable[30].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 32 - PMAX_HOA
	IF gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.Send THEN
		gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.wPMAX_HOA := STRING_TO_UINT(gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.wPMAX_HOA_String);
		MasterConfig_LR[IdxSkids_LR].action_enable[31].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.Send := FALSE;
	ELSIF NOT gVis.Main.Out.DialogOpen THEN
		gCMD_LR[IdxSkids_LR].Write_PMAX_HOA.wPMAX_HOA_String := UINT_TO_STRING(gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA);
	END_IF;
	
	// AS Block 33 - PMAX_CONC
	IF gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.Send THEN
		gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.wPMAX_CONC_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.wPMAX_CONC);
		MasterConfig_LR[IdxSkids_LR].action_enable[32].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.Send := FALSE;
	END_IF;		
	
	// AS Block 34 - HP_CONC
	IF gCMD_LR[IdxSkids_LR].Write_HP_CONC.Send THEN
		gCMD_LR[IdxSkids_LR].Write_HP_CONC.wHP_CONC_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_HP_CONC.wHP_CONC);
		MasterConfig_LR[IdxSkids_LR].action_enable[33].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_HP_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 35 - NAOH_CONC
	IF gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.Send THEN
		gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.wNAOH_CONC_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.wNAOH_CONC);
		MasterConfig_LR[IdxSkids_LR].action_enable[34].single := TRUE;
		MasterConfig_LR[IdxSkids_LR].action_enable[71].single := TRUE; // Send Recalculation Command
		gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 36 - P101_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P101_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[35].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 37 - P101_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P101_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[36].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 38 - P101_SP
	IF gCMD_LR[IdxSkids_LR].Write_P101_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P101_SP.wP101_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P101_SP.wP101_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[37].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 39 - P102_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P102_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[38].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 40 - P102_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P102_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[39].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 41 - P102_SP
	IF gCMD_LR[IdxSkids_LR].Write_P102_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P102_SP.wP102_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P102_SP.wP102_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[40].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_SP.Send := FALSE;
	END_IF;	

	// AS Block 42 - P103_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P103_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[41].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 43 - P103_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P103_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[42].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 44 - P103_SP
	IF gCMD_LR[IdxSkids_LR].Write_P103_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P103_SP.wP103_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P103_SP.wP103_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[43].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 45 - P104_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P104_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[44].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 46 - P104_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P104_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[45].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_STP_CMD.Send := FALSE;
	END_IF;	
	
	// AS Block 47 - P104_SP
	IF gCMD_LR[IdxSkids_LR].Write_P104_SP.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P104_SP.wP104_SP_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P104_SP.wP104_SP);
		MasterConfig_LR[IdxSkids_LR].action_enable[46].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_SP.Send := FALSE;
	END_IF;	
	
	// AS Block 48 is a READ block
	
	// AS Block 49 - LOCK_CMD
	IF gCMD_LR[IdxSkids_LR].Write_LOCK_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[48].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_LOCK_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 50 - UNLOCK_CMD
	IF gCMD_LR[IdxSkids_LR].Write_UNLOCK_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[49].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_UNLOCK_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 51 - FI301_SIM_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI301_SIM_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[50].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI301_SIM_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 52 - FI301_MEA_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI301_MEA_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[51].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI301_MEA_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 53 - FI301_SIM
	IF gCMD_LR[IdxSkids_LR].Write_FI301_SIM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_FI301_SIM.wFI301_SIM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_FI301_SIM.wFI301_SIM);
		MasterConfig_LR[IdxSkids_LR].action_enable[52].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI301_SIM.Send := FALSE;
	END_IF;
	
	// AS Block 54 - FI302_SIM_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI302_SIM_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[53].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI302_SIM_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 55 - FI302_MEA_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI302_MEA_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[54].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI302_MEA_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 56 - FI302_SIM
	IF gCMD_LR[IdxSkids_LR].Write_FI302_SIM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_FI302_SIM.wFI302_SIM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_FI302_SIM.wFI302_SIM);
		MasterConfig_LR[IdxSkids_LR].action_enable[55].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI302_SIM.Send := FALSE;
	END_IF;
	
	// AS Block 57 - FI303_SIM_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI303_SIM_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[56].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI303_SIM_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 58 - FI303_MEA_CMD
	IF gCMD_LR[IdxSkids_LR].Write_FI303_MEA_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[57].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI303_MEA_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 59 - FI303_SIM
	IF gCMD_LR[IdxSkids_LR].Write_FI303_SIM.Send THEN
		gCMD_LR[IdxSkids_LR].Write_FI303_SIM.wFI303_SIM_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_FI303_SIM.wFI303_SIM);
		MasterConfig_LR[IdxSkids_LR].action_enable[58].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_FI303_SIM.Send := FALSE;
	END_IF;
	
	// AS Block 60 - UNIT_ACK - RESET OF CONDITION PERFORMED IN MAIN.ST ALARMS RESET 
	IF gVis.Main.In.AckAllAlarms_Skid_LR[IdxSkids_LR] THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[59].single := TRUE;
	END_IF;
	
	// AS Block 61 IS THE TEXT READ INT BLOCK

	
	// AS Block 62 - XV101_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV101_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[61].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV101_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 63 - XV102_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV102_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[62].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV102_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 64 - XV103_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV103_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[63].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV103_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 65 - XV104_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV104_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[64].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV104_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 66 - XV201_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV201_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[65].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV201_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 67 - XV202_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV202_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[66].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV202_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 68 - XV203_OPEN_CMD
	IF gCMD_LR[IdxSkids_LR].Write_XV203_OPEN_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[67].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_XV203_OPEN_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 69 - AS_USER
	IF gCMD_LR[IdxSkids_LR].Write_AS_USER.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[68].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_AS_USER.Send := FALSE;
	END_IF;
	
	// AS Block 70 - AS_ACCESS
	IF gCMD_LR[IdxSkids_LR].Write_AS_ACCESS.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[69].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_AS_ACCESS.Send := FALSE;
	END_IF;
	
	// AS Block 71 - TOTALIZER_RESET
	IF gCMD_LR[IdxSkids_LR].Write_TOTALIZER_RESET.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[70].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_TOTALIZER_RESET.Send := FALSE;
	END_IF;
	
	// AS Block 72 - RECALC_CMD - Sends With Changes to Settings Above
	
	// AS Block 73 - ESTOP
	IF gCMD_LR[IdxSkids_LR].Write_ESTOP.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[72].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_ESTOP.Send := FALSE;
	END_IF;
	

	
	///////////////////////////////////////////
	
	
	// AS Block 74 - P101_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[73].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 75 - P101_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P101_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P101_GAIN.wP101_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P101_GAIN.wP101_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[74].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 76 - P101_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P101_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P101_STEPADJ.wP101_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P101_STEPADJ.wP101_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[75].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 77 - P101_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P101_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P101_TOTALADJ.wP101_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P101_TOTALADJ.wP101_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[76].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P101_TOTALADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 78 - P102_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[77].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 79 - P102_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[78].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 80 - P102_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P102_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P102_GAIN.wP102_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P102_GAIN.wP102_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[79].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 81 - P102_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P102_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P102_STEPADJ.wP102_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P102_STEPADJ.wP102_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[80].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 82 - P102_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P102_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P102_TOTALADJ.wP102_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P102_TOTALADJ.wP102_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[81].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P102_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 83 - P103_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[82].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 84 - P103_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[83].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 85 - P103_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P103_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P103_GAIN.wP103_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P103_GAIN.wP103_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[84].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 86 - P103_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P103_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P103_STEPADJ.wP103_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P103_STEPADJ.wP103_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[85].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 87 - P103_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P103_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P103_TOTALADJ.wP103_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P103_TOTALADJ.wP103_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[86].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P103_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 88 - P104_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[87].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 89 - P104_AUTOCAL_PV
	IF gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[88].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.Send := FALSE;
	END_IF;
	
	// AS Block 90 - P104_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[89].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 91 - P104_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P104_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P104_GAIN.wP104_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P104_GAIN.wP104_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[90].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 92 - P104_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P104_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P104_STEPADJ.wP104_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P104_STEPADJ.wP104_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[91].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 93 - P104_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P104_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P104_TOTALADJ.wP104_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P104_TOTALADJ.wP104_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[92].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P104_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 94 - P201_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[93].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 95 - P201_AUTOCAL_PV
	IF gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[94].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.Send := FALSE;
	END_IF;
	
	// AS Block 96 - P201_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[95].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 97 - P201_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P201_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_GAIN.wP201_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P201_GAIN.wP201_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[96].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 98 - P201_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P201_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_STEPADJ.wP201_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P201_STEPADJ.wP201_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[97].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 99 - P201_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P201_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P201_TOTALADJ.wP201_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P201_TOTALADJ.wP201_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[98].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P201_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 100 - P202_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[99].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 101 - P202_AUTOCAL_PV
	IF gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[100].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.Send := FALSE;
	END_IF;
	
	// AS Block 102 - P202_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[101].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 103 - P202_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P202_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_GAIN.wP202_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P202_GAIN.wP202_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[102].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 104 - P202_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P202_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_STEPADJ.wP202_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P202_STEPADJ.wP202_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[103].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 105 - P202_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P202_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P202_TOTALADJ.wP202_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P202_TOTALADJ.wP202_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[104].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P202_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 106 - P203_AUTOCAL
	IF gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[105].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.Send := FALSE;
	END_IF;
	
	// AS Block 107 - P203_AUTOCAL_PV
	IF gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[106].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.Send := FALSE;
	END_IF;
	
	// AS Block 108 - P203_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[107].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.Send := FALSE;
	END_IF;
	
	// AS Block 109 - P203_GAIN
	IF gCMD_LR[IdxSkids_LR].Write_P203_GAIN.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_GAIN.wP203_GAIN_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P203_GAIN.wP203_GAIN);
		MasterConfig_LR[IdxSkids_LR].action_enable[108].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_GAIN.Send := FALSE;
	END_IF;	
	
	// AS Block 110 - P203_STEPADJ
	IF gCMD_LR[IdxSkids_LR].Write_P203_STEPADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_STEPADJ.wP203_STEPADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P203_STEPADJ.wP203_STEPADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[109].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_STEPADJ.Send := FALSE;
	END_IF;	
	
	// AS Block 111 - P203_TOTALADJ
	IF gCMD_LR[IdxSkids_LR].Write_P203_TOTALADJ.Send THEN
		gCMD_LR[IdxSkids_LR].Write_P203_TOTALADJ.wP203_TOTALADJ_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_P203_TOTALADJ.wP203_TOTALADJ);
		MasterConfig_LR[IdxSkids_LR].action_enable[110].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_P203_TOTALADJ.Send := FALSE;
	END_IF;
	
	// AS Block 112 - P203_AUTOFLO_ADPT
	IF gCMD_LR[IdxSkids_LR].Write_USERADMIN_RESET.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[111].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_USERADMIN_RESET.Send := FALSE;
	END_IF;
	
	// AS Block 113 - ROSTER1_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[112].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.Send := FALSE;
	END_IF;
	
	// AS Block 114 - ROSTER2_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[113].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.Send := FALSE;
	END_IF;
	
	// AS Block 115 - ROSTER3_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[114].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.Send := FALSE;
	END_IF;
	
	// AS Block 116 - ROSTER4_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[115].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.Send := FALSE;
	END_IF;
	
	// AS Block 117 - ROSTER5_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[116].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.Send := FALSE;
	END_IF;
	
	// AS Block 118 - ROSTER6_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[117].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.Send := FALSE;
	END_IF;
	
	// AS Block 119 - ROSTER7_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[118].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.Send := FALSE;
	END_IF;
	
	// AS Block 120 - ROSTER8_PHONE
	IF gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[119].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.Send := FALSE;
	END_IF;
	
	
	

	
	

	
END_ACTION
