
ACTION Vis_Main_LR: 
	
	FOR IdxSkids_LR := 0 TO MAX_SKIDS_LR DO
		
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

		IF gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101 = 0 AND gSkid_LR[IdxSkids_LR].Sensor_Variables.XV101_ENABLE = 1 THEN
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
