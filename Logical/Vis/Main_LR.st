
ACTION Vis_Main_LR: 
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		//DEFAULT SETTINGS PAGE-----------------------------------------------------------------------------------------------
		IF gSkid_LR[IdxSkids_LR].VisBool.EMAIL_LASTDAY THEN
			gCMD_LR[IdxSkids_LR].Write_EMAIL_DATA.wEMAIL_DATA := 1;
			gCMD_LR[IdxSkids_LR].Write_EMAIL_DATA.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.EMAIL_LASTDAY := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.EMAIL_LASTWEEK THEN
			gCMD_LR[IdxSkids_LR].Write_EMAIL_DATA.wEMAIL_DATA := 2;
			gCMD_LR[IdxSkids_LR].Write_EMAIL_DATA.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.EMAIL_LASTWEEK := FALSE;
		END_IF;
		
		//ALARM CONFIG-----------------------------------------------------------------------------------------------
		
				//ALARM/TEXT ENABLE
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE.1 = 1 THEN
			gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ALARM_ENABLE := 'ENABLED';
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_ON_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_OFF_EN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ALARM_ENABLE := 'DISABLED';
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_ON_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_OFF_EN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE.6 = 1 THEN
			gSkid_LR[IdxSkids_LR].AlarmConfig.AC_TXT_ENABLE := 'ENABLED';
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_ON_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_OFF_EN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].AlarmConfig.AC_TXT_ENABLE := 'DISABLED';
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_ON_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_OFF_EN := 0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_ON THEN
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE := gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE.1 := 1;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE := gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE.1 := 0;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.AC_ALARM_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_ON THEN
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE := gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE.6 := 1;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE := gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ENABLE;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.wAC_ENABLE.6 := 0;
			gCMD_LR[IdxSkids_LR].Write_AC_ENABLE.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.AC_TXT_OFF := FALSE;
		END_IF;
		
		
			//READ AND CORRECT THRESHOLD VALUE
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT = '%SP' THEN
			gSkid_LR[IdxSkids_LR].VisNum.AC_THRESHOLD_CORRECTED := 100 * gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD;
		ELSE
			gSkid_LR[IdxSkids_LR].VisNum.AC_THRESHOLD_CORRECTED := gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD;
		END_IF;
		
			//CORRECT AND WRITE THRESHOLD VALUE
		IF gSkid_LR[IdxSkids_LR].VisBool.AC_THRESHOLD_SEND THEN
			IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT = '%SP' THEN
				gCMD_LR[IdxSkids_LR].Write_AC_THRESHOLD.wAC_THRESHOLD := gSkid_LR[IdxSkids_LR].VisNum.wAC_THRESHOLD_CORRECTED / 100;
			ELSE
				gCMD_LR[IdxSkids_LR].Write_AC_THRESHOLD.wAC_THRESHOLD := gSkid_LR[IdxSkids_LR].VisNum.wAC_THRESHOLD_CORRECTED;
			END_IF;
			gCMD_LR[IdxSkids_LR].Write_AC_THRESHOLD.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.AC_THRESHOLD_SEND := FALSE;
		END_IF;
		
			//THRESHOLD HIDE
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].VisBool.AC_THRESHOLD_VIS := FALSE;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.AC_THRESHOLD_VIS := TRUE;
		END_IF;
		
			//ACTION TEXT
		CASE gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION OF
			0:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := ' ';
			1:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := 'FULL SHUTDOWN';
			16:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := 'PRODUCTION SHUTDOWN';
			2:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := 'P201 SHUTDOWN';
			4:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := 'P202 SHUTDOWN';
			8:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_TEXT := 'P203 SHUTDOWN';
		END_CASE;
		
			//ACTION HIDE
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].VisBool.AC_ACTION_VIS := FALSE;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.AC_ACTION_VIS := TRUE;
		END_IF;
		
		//ENABLE HIDE
		IF gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].VisBool.AC_ENABLE_VIS := FALSE;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.AC_ENABLE_VIS := TRUE;
		END_IF;
		
		
		//ALARM CONFIG WRITE ADDRESSES
		gSkid_LR[IdxSkids_LR].AlarmConfig.wAC_DELAY_ADDR := (10 * gSkid_LR[IdxSkids_LR].AlarmConfig.AC_OFFSET) + 30001;
		gSkid_LR[IdxSkids_LR].AlarmConfig.wAC_ENABLE_ADDR := (10 * gSkid_LR[IdxSkids_LR].AlarmConfig.AC_OFFSET) + 30000;
		gSkid_LR[IdxSkids_LR].AlarmConfig.wAC_ACTION_ADDR := (10 * gSkid_LR[IdxSkids_LR].AlarmConfig.AC_OFFSET) + 30007;
		gSkid_LR[IdxSkids_LR].AlarmConfig.wAC_THRESHOLD_ADDR := (10 * gSkid_LR[IdxSkids_LR].AlarmConfig.AC_OFFSET) + 30002;
		
			//INDIVIDUAL ALARM CASE STATEMENTS
		CASE gSkid_LR[IdxSkids_LR].AlarmConfig.AC_OFFSET OF
			117:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-101 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			118:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-101 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			119:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-101 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			120:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-101 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			121:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-101 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			122:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-101 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			123:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-101 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			124:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-101 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;	
			125:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-101 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			126:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-101 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			127:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-101 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			128:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-101 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			129:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-101 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			130:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-101 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			131:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-101 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			132:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-101 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			133:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-101 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			134:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			135:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			136:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			137:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			138:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			139:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			140:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			141:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			142:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			143:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			144:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			145:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-101 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			146:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			147:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			148:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			149:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-102 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			150:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-102 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			151:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-102 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			152:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-102 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			153:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-102 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			154:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-102 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			155:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-102 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			156:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-102 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			157:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-102 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			158:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-102 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			159:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-102 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			160:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-102 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			161:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-102 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			162:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-102 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			163:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-102 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			164:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-102 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			165:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-102 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			166:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			167:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			168:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			169:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			170:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			171:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			172:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			173:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			174:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			175:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			176:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			177:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-102 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			178:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			179:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			180:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			181:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-103 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			182:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-103 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			183:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-103 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			184:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-103 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			185:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-103 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			186:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-103 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			187:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-103 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			188:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-103 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			189:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-103 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			190:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-103 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			191:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-103 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			192:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-103 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			193:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-103 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			194:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-103 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			195:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-103 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			196:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-103 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			197:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-103 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			198:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			199:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			200:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			201:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			202:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			203:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			204:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			205:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			206:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			207:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			208:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			209:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-103 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			210:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			211:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			212:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			213:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-104 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			214:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-104 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			215:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-104 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			216:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-104 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			217:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-104 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			218:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-104 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			219:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-104 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			220:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-104 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			221:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-104 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			222:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-104 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			223:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-104 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			224:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-104 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			225:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-104 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			226:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-104 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			227:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-104 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			228:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-104 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			229:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-104 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			230:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			231:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			232:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			233:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			234:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			235:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			236:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			237:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			238:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			239:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			240:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			241:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-104 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			242:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			243:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			244:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
				
				
				
				
				
				
			501:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			502:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			503:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			504:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			505:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			506:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			507:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			508:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			509:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			510:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			511:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			512:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			513:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			514:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			515:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			516:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			517:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-201 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			518:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-201 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			519:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-201 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			520:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-201 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			521:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-201 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			522:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-201 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			523:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-201 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			524:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-201 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			525:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-201 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			526:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-201 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			527:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-201 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			528:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-201 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			529:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-201 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			530:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-201 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			531:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-201 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			532:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-201 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
				
				
				
				
				
			
			549:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-202 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			550:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-202 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			551:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-202 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			552:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-202 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			553:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-202 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			554:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-202 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			555:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-202 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			556:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-202 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			557:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-202 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			558:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-202 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			559:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-202 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			560:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-202 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			561:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-202 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			562:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-202 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			563:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-202 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			564:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-202 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			565:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-202 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			566:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			567:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			568:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			569:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			570:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			571:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			572:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			573:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			574:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			575:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			576:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			577:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-202 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			578:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			579:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			580:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			581:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-203 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			582:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-203 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			583:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-203 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			584:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-203 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			585:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-203 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			586:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-203 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			587:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-203 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			588:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-203 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			589:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-203 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			590:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-203 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			591:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-203 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			592:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-203 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			593:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-203 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			594:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-203 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			595:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-203 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			596:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-203 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			597:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-203 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			598:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 LOCAL STOP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			599:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 MAX OUTPUT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			600:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 COMMUNICATION ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			601:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 OVER PRESSURE';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			602:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 ALARM (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			603:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 BACK PRESSURE LOW';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			604:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 GAS IN PUMP HEAD';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			605:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 CAVITATION';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			606:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 WARNING (OTHER)';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			607:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 FAULT';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			608:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 RUN FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			609:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'P-203 SPEED FEEDBACK ERROR';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			610:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			611:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			612:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;	
			613:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-204 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			614:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-204 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			615:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-204 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			616:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'FI-204 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			617:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-204 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			618:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-204 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			619:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-204 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			620:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '%SP';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PFI-204 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
				
			621:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-204 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			622:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-204 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			623:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-204 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			624:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PI-204 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
			625:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-204 LL';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			626:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-204 L';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			627:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-204 HH';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			628:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := 'PSIG';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'PPI-204 H';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
			629:
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := TRUE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'LS-204 LL - CANNOT MODIFY';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := TRUE;
		
				
				
				
				
				
			ELSE
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_UNIT := '';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_THRESHOLD_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_ACTION_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_DESCRIPTION := 'ALARM DOES NOT EXIST';
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_LR_ENABLE := FALSE;
				gSkid_LR[IdxSkids_LR].AlarmConfig.AC_HR_ENABLE := FALSE;
		END_CASE;
				
				
				
				
				
				
				
				
				
				
				
		
		//MODE STATUS-----------------------------------------------------------------------------------------------------------------------
		
		CASE gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_STATUS OF
			0:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'SYSTEM OFF';
			1:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'SYSTEM READY';
			2:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'PRIMING PMAX';
			3:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'PMAX PRIMED';
			4:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'BATCH PAUSE';
			5:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'MANUAL MODE';
			6:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'SYSTEM ON';
			7:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'EMPTYING BT';
			8:
				gSkid_LR[IdxSkids_LR].Status.PMAX_STATUS := 'P103 SPILL';
		END_CASE;
		
		CASE gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA OF
			0:
				gSkid_LR[IdxSkids_LR].Status.PMAX_HOA := 'OFF';
			1:
				gSkid_LR[IdxSkids_LR].Status.PMAX_HOA := 'ENABLED';
			2:
				gSkid_LR[IdxSkids_LR].Status.PMAX_HOA := 'MANUAL';
		END_CASE;
		
		CASE gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA OF
			0:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'OFF';
			1:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 301';
			2:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 302';
			3:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 301+302';
			4:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 303';
			5:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 301+303';
			6:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 302+303';
			7:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'FM 301+302+303';
			8:
				gSkid_LR[IdxSkids_LR].Status.P201_STATUS := 'MANUAL';
		END_CASE;
		
		CASE gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA OF
			0:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'OFF';
			1:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 301';
			2:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 302';
			3:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 301+302';
			4:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 303';
			5:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 301+303';
			6:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 302+303';
			7:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'FM 301+302+303';
			8:
				gSkid_LR[IdxSkids_LR].Status.P202_STATUS := 'MANUAL';
		END_CASE;
		
		CASE gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA OF
			0:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'OFF';
			1:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 301';
			2:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 302';
			3:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 301+302';
			4:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 303';
			5:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 301+303';
			6:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 302+303';
			7:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'FM 301+302+303';
			8:
				gSkid_LR[IdxSkids_LR].Status.P203_STATUS := 'MANUAL';
		END_CASE;
			
			
		//SUMMARY TILES----------------------------------------------------------------------------------------------------------------------------------------------------------
		gVis.Process.Out.SummaryTiles[IdxSkids_LR].UnitNumber := UINT_TO_STRING(gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID);
		
		gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Gauge := 100 * gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101 / (2 * gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP);
		gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Gauge := 100 * gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102 / (2 * gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP);
		gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Gauge := 100 * (gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_PI / 50);
		
		gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined := gSkid_LR[IdxSkids_LR].Sensor_Variables.FI301 + gSkid_LR[IdxSkids_LR].Sensor_Variables.FI302 + 
			gSkid_LR[IdxSkids_LR].Sensor_Variables.FI303;
		
		
		//P201 INDICATOR
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 0 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P201_Indicator := 'GREY';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P201_Indicator := 'GREEN';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 3 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P201_Indicator := 'GREEN';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P201_Indicator := 'RED';
		END_IF;
		
		
		//P202 INDICATOR
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_XS = 0 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P202_Indicator := 'GREY';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_XS = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P202_Indicator := 'GREEN';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_XS = 3 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P202_Indicator := 'GREEN';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P202_Indicator := 'RED';
		END_IF;
		
		//P203 INDICATOR
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_XS = 0 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P203_Indicator := 'GREY';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_XS = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P203_Indicator := 'GREEN';
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_XS = 3 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_PI < 125 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_PV - gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_SP) / gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_SP)) < 20 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P203_Indicator := 'GREEN';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].P203_Indicator := 'RED';
		END_IF;
	
		
		//UNIT INDICATOR
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_STATUS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined < 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].UNIT_Indicator := 'GREY';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_STATUS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined >= 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].UNIT_Indicator := 'RED';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].UNIT_Indicator := 'GREEN';
		END_IF;
		
		
		//GEN INDICATOR
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_XS = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_XS = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_XS = 1 AND 
			gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_XS = 1 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'GREEN';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_XS = 3 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_XS = 3 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_XS = 3 AND 
			gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_XS = 3 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'GREEN';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_XS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined >= 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'RED';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_XS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined >= 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'RED';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_XS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined >= 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'RED';
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_XS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined >= 2 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'RED';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator := 'GREY';
		END_IF;
		
		//CD101 INDICATOR
		IF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP)) < 20 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Indicator := 'GREEN';
		ELSIF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP)) >= 20 AND 
				ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP)) < 50 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Indicator := 'BLUE';
		ELSIF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP)) >= 50	AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Indicator := 'RED';
//		ELSIF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_STATUS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined < 2 THEN
//			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Indicator := 'GREY';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD101_Indicator := 'GREY';
		END_IF;
		
		//CD102 INDICATOR
		IF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP)) < 20 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Indicator := 'GREEN';
		ELSIF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP)) >= 20 AND 
			ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP)) < 50 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Indicator := 'BLUE';
		ELSIF ABS(100 * ((gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102 - gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP) / gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP)) >= 50 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].GEN_Indicator = 'GREEN' THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Indicator := 'RED';			
//		ELSIF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_STATUS = 0 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].FI_PlantFlowCombined < 2 THEN
//			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Indicator := 'GREY';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].CD102_Indicator := 'GREY';
		END_IF;
		
		//PRESSURE MIX INDICATOR
		IF gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Gauge < 50 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Indicator := 'GREEN';
		ELSIF gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Gauge >= 50 AND gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Gauge < 100 THEN
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Indicator := 'BLUE';
		ELSE
			gVis.Process.Out.SummaryTiles[IdxSkids_LR].PI101_Indicator := 'RED';
		END_IF;
		
		
		//ROSTER---------------------------------------------------------------------------------------------------------------------------------------------
		//ROSTER WRITE
		FOR IndxNumber := 0 TO 4 DO
			//ROSTER 1
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.wPHONE_INPUT1_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input1)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.wPHONE_INPUT1_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.wPHONE_INPUT1_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.wPHONE_INPUT1_ARRAY[IndxNumber]);
			//ROSTER 2
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.wPHONE_INPUT2_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input2)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.wPHONE_INPUT2_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.wPHONE_INPUT2_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.wPHONE_INPUT2_ARRAY[IndxNumber]);
			//ROSTER 3
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.wPHONE_INPUT3_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input3)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.wPHONE_INPUT3_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.wPHONE_INPUT3_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.wPHONE_INPUT3_ARRAY[IndxNumber]);
			//ROSTER 4
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.wPHONE_INPUT4_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input4)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.wPHONE_INPUT4_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.wPHONE_INPUT4_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.wPHONE_INPUT4_ARRAY[IndxNumber]);
			//ROSTER 5
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.wPHONE_INPUT5_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input5)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.wPHONE_INPUT5_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.wPHONE_INPUT5_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.wPHONE_INPUT5_ARRAY[IndxNumber]);
			//ROSTER 6
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.wPHONE_INPUT6_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input6)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.wPHONE_INPUT6_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.wPHONE_INPUT6_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.wPHONE_INPUT6_ARRAY[IndxNumber]);
			//ROSTER 7
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.wPHONE_INPUT7_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input7)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.wPHONE_INPUT7_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.wPHONE_INPUT7_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.wPHONE_INPUT7_ARRAY[IndxNumber]);
			//ROSTER 8
			brsmemcpy(ADR(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.wPHONE_INPUT8_ARRAY[IndxNumber]),ADR(gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input8)+(IndxNumber*2),SIZEOF(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.wPHONE_INPUT8_ARRAY[IndxNumber]));
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.wPHONE_INPUT8_ARRAY[IndxNumber] := swapUINT(gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.wPHONE_INPUT8_ARRAY[IndxNumber]);
		END_FOR;
		//ROSTER ENABLE
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact1_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.wENABLE_ROSTER1 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.wENABLE_ROSTER1 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER1_DISABLE := FALSE;
		END_IF;
		
		
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact2_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.wENABLE_ROSTER2 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.wENABLE_ROSTER2 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER2_DISABLE := FALSE;
		END_IF;
		
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact3_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.wENABLE_ROSTER3 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.wENABLE_ROSTER3 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER3_DISABLE := FALSE;
		END_IF;
		
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact4_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.wENABLE_ROSTER4 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.wENABLE_ROSTER4 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER4_DISABLE := FALSE;
		END_IF;
		
	
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact5_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.wENABLE_ROSTER5 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.wENABLE_ROSTER5 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER5_DISABLE := FALSE;
		END_IF;
		
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact6_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.wENABLE_ROSTER6 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.wENABLE_ROSTER6 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER6_DISABLE := FALSE;
		END_IF;
		
		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact7_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.wENABLE_ROSTER7 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.wENABLE_ROSTER7 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER7_DISABLE := FALSE;
		END_IF;

		
		IF gSkid_LR[IdxSkids_LR].RosterContact.Contact8_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_EN := 0;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_DIS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_EN := 1;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_DIS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_ENABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.wENABLE_ROSTER8 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_ENABLE := FALSE;
		END_IF;
			
		IF gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_DISABLE THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.wENABLE_ROSTER8 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.ROSTER8_DISABLE := FALSE;
		END_IF;
		
		//ROSTER1 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER1 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact1_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER1 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.wENABLE_ROSTER1 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact1_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input1 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read1 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.wENABLE_ROSTER1 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER1.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 := 0;
		END_IF;
		
		//ROSTER1 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER1 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact1_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT1.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER1 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step1 := 0;
		END_IF;
		
		
		
		
		//ROSTER2 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER2 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact2_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER2 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.wENABLE_ROSTER2 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact2_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input2 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read2 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.wENABLE_ROSTER2 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER2.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 := 0;
		END_IF;
		
		//ROSTER2 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER2 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact2_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT2.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER2 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step2 := 0;
		END_IF;
		
		
		
		//ROSTER3 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER3 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact3_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER3 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.wENABLE_ROSTER3 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact3_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input3 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read3 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.wENABLE_ROSTER3 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER3.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 := 0;
		END_IF;
		
		//ROSTER3 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER3 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact3_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT3.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER3 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step3 := 0;
		END_IF;
		
		
		
		//ROSTER4 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER4 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact4_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER4 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.wENABLE_ROSTER4 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact4_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input4 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read4 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.wENABLE_ROSTER4 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER4.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 := 0;
		END_IF;
		
		//ROSTER4 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER4 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact4_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT4.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER4 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step4 := 0;
		END_IF;
		
		
		
		
		//ROSTER5 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER5 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact5_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER5 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.wENABLE_ROSTER5 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact5_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input5 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read5 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.wENABLE_ROSTER5 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER5.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 := 0;
		END_IF;
		
		//ROSTER5 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER5 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact5_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT5.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER5 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step5 := 0;
		END_IF;
		
		
		
		//ROSTER6 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER6 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact6_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER6 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.wENABLE_ROSTER6 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact6_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input6 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read6 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.wENABLE_ROSTER6 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER6.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 := 0;
		END_IF;
		
		//ROSTER6 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER6 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact6_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT6.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER6 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step6 := 0;
		END_IF;
		
		
		
		//ROSTER7 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER7 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact7_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER7 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.wENABLE_ROSTER7 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact7_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input7 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read7 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.wENABLE_ROSTER7 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER7.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 := 0;
		END_IF;
		
		//ROSTER7 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER7 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact7_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT7.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER7 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step7 := 0;
		END_IF;
		
		
		
		//ROSTER8 PHONE NUMBER SEND WITH PLC CYCLING FOR ENABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 = 0 AND gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER8 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact8_ENABLE = TRUE THEN
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 := 10;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER8 := FALSE;
		END_IF;
		
		//STEP 10: DISABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 = 10 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.wENABLE_ROSTER8 := 0;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Contact8_ENABLE = FALSE THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 := 20;
			END_IF;
		END_IF;
		
		//STEP 20: SEND NUMBER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 = 20 THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.Send := TRUE;
			IF gSkid_LR[IdxSkids_LR].RosterContact.Phone_Input8 = gSkid_LR[IdxSkids_LR].RosterContact.Phone_Read8 THEN
				gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 := 30;
			END_IF;
		END_IF;
		
		//STEP 30: ENABLE ROSTER
		IF gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 = 30 THEN
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.wENABLE_ROSTER8 := 1;
			gCMD_LR[IdxSkids_LR].Write_ENABLE_ROSTER8.Send := TRUE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 := 0;
		END_IF;
		
		//ROSTER8 PHONE NUMBER SEND FOR DISABLED CONDITION
		IF gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER8 = TRUE AND gSkid_LR[IdxSkids_LR].RosterContact.Contact8_ENABLE = FALSE THEN
			gCMD_LR[IdxSkids_LR].Write_PHONE_INPUT8.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.SEND_ROSTER8 := FALSE;
			gSkid_LR[IdxSkids_LR].RosterContact.Write_Step8 := 0;
		END_IF;

	
		
		//AUTOCAL-----------------------------------------------------------------------------------------------------------------------------
		//AUTOCAL P101
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P101_GAIN := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P101_GAIN.wP101_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P101_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P101_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P101_STEPADJ.wP101_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P101_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P101_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P101_TOTALADJ.wP101_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P101_TOTALADJ_IN / 100;
		
		//AUTOCAL P102
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF_EN :=1;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P102_GAIN := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P102_GAIN.wP102_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P102_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P102_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P102_STEPADJ.wP102_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P102_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P102_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P102_TOTALADJ.wP102_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P102_TOTALADJ_IN / 100;
		
		//AUTOCAL P103
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF_EN :=1;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P103_GAIN := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P103_GAIN.wP103_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P103_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P103_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P103_STEPADJ.wP103_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P103_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P103_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P103_TOTALADJ.wP103_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P103_TOTALADJ_IN / 100;
		
		//AUTOCAL P104
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF_EN :=1;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_AUTOCAL_PV = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_FIT_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_PFIT_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_FIT_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_PFIT_EN :=1;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P104_GAIN := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P104_GAIN.wP104_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P104_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P104_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P104_STEPADJ.wP104_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P104_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P104_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P104_TOTALADJ.wP104_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P104_TOTALADJ_IN / 100;
		
		//AUTOCAL P201
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF_EN :=1;
		END_IF;
		

		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_AUTOCAL_PV = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_FIT_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_PFIT_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_FIT_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_PFIT_EN :=1;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P201_GAIN := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P201_GAIN.wP201_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P201_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P201_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P201_STEPADJ.wP201_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P201_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P201_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P201_TOTALADJ.wP201_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P201_TOTALADJ_IN / 100;
		
		//AUTOCAL P202
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF_EN :=1;
		END_IF;
		

		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_AUTOCAL_PV = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_FIT_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_PFIT_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_FIT_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_PFIT_EN :=1;
		END_IF;
		
		gSkid_LR[IdxSkids_LR].VisNum.P202_GAIN := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P202_GAIN.wP202_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P202_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P202_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P202_STEPADJ.wP202_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P202_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P202_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P202_TOTALADJ.wP202_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P202_TOTALADJ_IN / 100;
		
		//AUTOCAL P203
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOCAL = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=0;
		END_IF;
		
		
		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOCAL = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF_EN :=0;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOADAPT = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF_EN :=1;
		ELSIF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOCAL = 0 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOADAPT = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF_EN :=1;
		END_IF;
		

		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_AUTOCAL_PV = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_FIT_EN :=1;
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_PFIT_EN :=0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_FIT_EN :=0;
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_PFIT_EN :=1;
		END_IF;
				
		gSkid_LR[IdxSkids_LR].VisNum.P203_GAIN := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_GAIN;
		gCMD_LR[IdxSkids_LR].Write_P203_GAIN.wP203_GAIN := gSkid_LR[IdxSkids_LR].VisNum.P203_GAIN_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P203_STEPADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_STEPADJ;
		gCMD_LR[IdxSkids_LR].Write_P203_STEPADJ.wP203_STEPADJ := gSkid_LR[IdxSkids_LR].VisNum.P203_STEPADJ_IN / 100;
		
		gSkid_LR[IdxSkids_LR].VisNum.P203_TOTALADJ := 100 * gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_TOTALADJ;
		gCMD_LR[IdxSkids_LR].Write_P203_TOTALADJ.wP203_TOTALADJ := gSkid_LR[IdxSkids_LR].VisNum.P203_TOTALADJ_IN / 100;
		
		// AutoCal 1 = Off, 2 = On
		IF gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.wP101_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.wP101_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P101_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P101_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.wP102_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.wP102_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.wP103_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.wP103_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.wP104_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.wP104_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.wP201_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.wP201_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.wP202_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.wP202_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOCAL_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.wP203_AUTOCAL := 2;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.wP203_AUTOCAL := 1;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOCAL_OFF := FALSE;
		END_IF;
		
		// AutoFLOW 1 = Off, 2 = On
		IF gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.wP102_P102_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.wP102_P102_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P102_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P102_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.wP103_P103_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.wP103_P103_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P103_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P103_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.wP104_P104_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.wP104_P104_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.wP201_P201_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.wP201_P201_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.wP202_P202_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.wP202_P202_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.wP203_P203_AUTOFLO_ADPT := 2;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_ON := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.wP203_P203_AUTOFLO_ADPT := 1;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOFLO_ADPT.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_AUTOFLOW_OFF := FALSE;
		END_IF;
		
		// Autocal PV 1 = FIT, 2 = PFIT
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_PV_FIT THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.wP104_AUTOCAL_PV := 1;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_FIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P104_PV_PFIT THEN
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.wP104_AUTOCAL_PV := 2;
			gCMD_LR[IdxSkids_LR].Write_P104_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P104_PV_PFIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_PV_FIT THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.wP201_AUTOCAL_PV := 1;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_FIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P201_PV_PFIT THEN
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.wP201_AUTOCAL_PV := 2;
			gCMD_LR[IdxSkids_LR].Write_P201_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P201_PV_PFIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_PV_FIT THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.wP202_AUTOCAL_PV := 1;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_FIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P202_PV_PFIT THEN
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.wP202_AUTOCAL_PV := 2;
			gCMD_LR[IdxSkids_LR].Write_P202_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P202_PV_PFIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_PV_FIT THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.wP203_AUTOCAL_PV := 1;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_FIT := FALSE;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].VisBool.P203_PV_PFIT THEN
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.wP203_AUTOCAL_PV := 2;
			gCMD_LR[IdxSkids_LR].Write_P203_AUTOCAL_PV.Send := TRUE;
			gSkid_LR[IdxSkids_LR].VisBool.P203_PV_PFIT := FALSE;
		END_IF;
		
		
		
		gSkid_LR[IdxSkids_LR].BufferTank.LI200P := (gSkid_LR[IdxSkids_LR].BufferTank.LI200 / BT_VOLUME)*100;
		
		gSkid_LR[IdxSkids_LR].VisBool.CD101_TARGETHI := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP + 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD101_TARGETLO := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD101_SP - 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD102_TARGETHI := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP + 40;
		gSkid_LR[IdxSkids_LR].VisBool.CD102_TARGETLO := gSkid_LR[IdxSkids_LR].Sensor_Variables.CD102_SP - 40;
		
		// VISIBILITY TRIGGER SETTING
		
		IF gSkid_LR[IdxSkids_LR].BufferTank.LSHH200 > LSHH200_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.LSHH200 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.LSHH200 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_LS > P102_LS_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_LS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_LS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_LS > P103_LS_TRIGGER THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_LS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_LS := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_LR[IdxSkids_LR].VisBool.PMAX_MANUAL := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.PMAX_MANUAL := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 0 OR gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_PPM := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_PPM := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_SP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_SP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_SP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_SP := 0;
		END_IF;
		
		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_ENABLE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_ENABLE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_ALARM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_WARN > 0 AND gSkid_LR[IdxSkids_LR].VisBool.P201_DME = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ALARM > 0 AND gSkid_LR[IdxSkids_LR].VisBool.P201_DME = 0  THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_ALARM := 0;
		END_IF;		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_ALARM := 0;
		END_IF;		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_WARN > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_WARN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_WARN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ALARM > 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_ALARM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_ALARM := 0;
		END_IF;	
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P201_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P202_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_ADJ = 1 AND gSkid_LR[IdxSkids_LR].VisBool.P203_PPM = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_APPM := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_APPM := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI301_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI302_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI303_MODE = 0 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI301_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI301_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI302_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI302_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.FI303_MODE = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.FI303_MODE := 0;
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 0 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 2 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101_ERROR := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101_ERROR := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 1 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV102 = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.XV102_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV102_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV102_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV102 = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_102.XV102_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV102 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV102 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV103 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV103_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV103_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV104 = 0 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_104.XV104_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV104_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV104_OPP := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV104 = 1 AND gSkid_LR[IdxSkids_LR].Pmax_Pump_104.XV104_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV104 := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV104 := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV201 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV201_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV201_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV202 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV202_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV202_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV203 = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV203_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV203_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_PTYPE_OPP := 0;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_PTYPE_OPP := 1;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.PMAX_HOA = 2 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P101_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P102_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P103_MODE := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P104_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P101_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P102_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P103_MODE := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P104_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_General_Variables.SCREEN_LOCK = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_HOA = 8 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_MODE := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_MODE := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Heartbeat.SYSTEM_OFFLINE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.IOSTATUS := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.IOSTATUS := 0;
		END_IF;
		
		
		
		
		
		//P101 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P101_DMEYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P101_DMEYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_101.P101_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P101_DMEGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P101_DMEGREEN := 0;
		END_IF;
		
		//P102 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_102.P102_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P102_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P102_DDAGREEN := 0;
		END_IF;
		
		//P103 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_103.P103_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P103_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P103_DDAGREEN := 0;
		END_IF;
		
		//P104 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Pmax_Pump_104.P104_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P104_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P104_DDAGREEN := 0;
		END_IF;
		
		
		//P201 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDA := 1;
			gSkid_LR[IdxSkids_LR].VisBool.P201_DME := 0;	
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDA := 0;
			gSkid_LR[IdxSkids_LR].VisBool.P201_DME := 1;
		END_IF;
		

		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEGREEN := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DMEYELLOW := 0;
		END_IF;
		
		
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 1 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_XS = 3 AND gSkid_LR[IdxSkids_LR].Dosing_Pump_201.P201_PTYPE = 0 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P201_DDAGREEN := 0;
		END_IF;
		
		//P202 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_202.P202_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P202_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P202_DDAGREEN := 0;
		END_IF;
		
		//P203 Pump Graphic Vis
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_XS = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_DDAYELLOW := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_DDAYELLOW := 0;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Dosing_Pump_203.P203_XS = 3 THEN
			gSkid_LR[IdxSkids_LR].VisBool.P203_DDAGREEN := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.P203_DDAGREEN := 0;
		END_IF;
		
		
		
		
		
		
		
		
		
		
		
		
		
	END_FOR;

END_ACTION
