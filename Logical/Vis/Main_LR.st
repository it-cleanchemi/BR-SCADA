
ACTION Vis_Main_LR: 
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
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

		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 1;
		ELSE
			gSkid_LR[IdxSkids_LR].VisBool.XV101_OPP := 0;
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
