
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
		gCMD_LR[IdxSkids_LR].Write_EFF_1.Send := FALSE;
	END_IF;	
	
	// AS Block 29 - EFF_2
	IF gCMD_LR[IdxSkids_LR].Write_EFF_2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_EFF_2.wEFF_2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_EFF_2.wEFF_2);
		MasterConfig_LR[IdxSkids_LR].action_enable[28].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_EFF_2.Send := FALSE;
	END_IF;		
	
	// AS Block 30 - NAOH_TO_H2O2
	IF gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.wNAOH_TO_H2O2);
		MasterConfig_LR[IdxSkids_LR].action_enable[29].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_NAOH_TO_H2O2.Send := FALSE;
	END_IF;	
	
	// AS Block 31 - TRI_TO_H2O2
	IF gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.Send THEN
		gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.wTRI_TO_H2O2_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_TRI_TO_H2O2.wTRI_TO_H2O2);
		MasterConfig_LR[IdxSkids_LR].action_enable[30].single := TRUE;
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
		gCMD_LR[IdxSkids_LR].Write_PMAX_CONC.Send := FALSE;
	END_IF;		
	
	// AS Block 34 - HP_CONC
	IF gCMD_LR[IdxSkids_LR].Write_HP_CONC.Send THEN
		gCMD_LR[IdxSkids_LR].Write_HP_CONC.wHP_CONC_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_HP_CONC.wHP_CONC);
		MasterConfig_LR[IdxSkids_LR].action_enable[33].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_HP_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 35 - NAOH_CONC
	IF gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.Send THEN
		gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.wNAOH_CONC_SWAPPED := IDEC_REAL_Conv(gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.wNAOH_CONC);
		MasterConfig_LR[IdxSkids_LR].action_enable[34].single := TRUE;
		gCMD_LR[IdxSkids_LR].Write_NAOH_CONC.Send := FALSE;
	END_IF;	
	
	// AS Block 36 - P101_STRT_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P101_STRT_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[35].single := TRUE;
		//gCMD_LR[IdxSkids_LR].Write_P101_STRT_CMD.Send := FALSE;
	END_IF;
	
	// AS Block 37 - P101_STP_CMD
	IF gCMD_LR[IdxSkids_LR].Write_P101_STP_CMD.Send THEN
		MasterConfig_LR[IdxSkids_LR].action_enable[36].single := TRUE;
		//gCMD_LR[IdxSkids_LR].Write_P101_STP_CMD.Send := FALSE;
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
	IF gVis.Main.In.AckAllAlarms_Skid[IdxSkids_LR] THEN
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
	

	

	
END_ACTION
