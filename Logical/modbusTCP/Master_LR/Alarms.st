
ACTION Alarms_action: 
	
	IF gSkid_LR[IdxSkids_LR].AlarmsInitialized AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID <> 0 AND gUnit_LR[IdxSkids_LR] <> 0 THEN
	
		// AB1
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB1.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB1.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB1.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB1.0 := TRUE;
			END_IF;
		END_IF;
		
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB1.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB1.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB1.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB1.0 := TRUE;
			END_IF;
		END_IF;
	
		// AB2
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB2.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB2.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB2.15 := TRUE;
			END_IF
		END_IF;
		
		// AB3
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB3.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB3.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB3.12 := TRUE;
			END_IF
		END_IF;
		
		// AB4
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB4.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB4.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB4.15 := TRUE;
			END_IF
		END_IF;
		
		// AB5
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB5.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB5.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB5.12 := TRUE;
			END_IF
		END_IF;
		
		// AB6
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB6.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB6.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB6.15 := TRUE;
			END_IF
		END_IF;
		
		// AB7
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB7.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB7.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB7.12 := TRUE;
			END_IF
		END_IF;
		
		// AB8
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.0 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.1 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.2 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.3 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.4 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.5 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB8.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB8.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB8.13 := TRUE;
			END_IF
		END_IF;
		
		// AB9
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB9.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB9.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB9.12 := TRUE;
			END_IF
		END_IF;
		
		
		// AB10
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB10.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB10.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB10.13 := TRUE;
			END_IF
		END_IF;
		
		// AB11
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB11.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB11.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB11.12 := TRUE;
			END_IF
		END_IF;
		
		// AB12
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB12.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB12.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB12.15 := TRUE;
			END_IF
		END_IF;
		
		// AB13
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB13.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB13.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB13.12 := TRUE;
			END_IF
		END_IF;
		
		// AB14
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB14.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB14.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB14.15 := TRUE;
			END_IF
		END_IF;
		
		// AB15
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB15.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB15.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB15.12 := TRUE;
			END_IF
		END_IF;
		
		// AB16
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB16.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB16.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB16.15 := TRUE;
			END_IF
		END_IF;
		
		// AB17
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB17.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB17.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB17.12 := TRUE;
			END_IF
		END_IF;
		
		// AB18
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.12 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.13 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.13 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.13';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.13 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.14 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.14 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.14';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.14 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB18.15 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.15 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB18.15';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB18.15 := TRUE;
			END_IF
		END_IF;
		
		// AB19
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.0 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.0 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.0';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 2;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.0 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.1 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.1 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.1';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.1 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.2 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.2 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.2';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.2 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.3 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.3 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.3';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.3 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.4 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.4 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.4';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.4 := TRUE;
			END_IF
		END_IF;
	
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.5 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.5 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.5';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.5 := TRUE;
			END_IF
		END_IF;

		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.6 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.6 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.6';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.6 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.7 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.7 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.7';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.7 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.8 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.8 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.8';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.8 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.9 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.9 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.9';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.9 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.10 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.10 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.10';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.10 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.11 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.11 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.11';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.11 := TRUE;
			END_IF
		END_IF;
		IF gSkid_LR[IdxSkids_LR].Alarms.ALARM_AB19.12 AND gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.12 = FALSE THEN
			IF gSkid_LR[IdxSkids_LR].ErrorInfo.Text = '' THEN
				gSkid_LR[IdxSkids_LR].ErrorInfo.Text		:= 'ALARM_AB19.12';
				gSkid_LR[IdxSkids_LR].ErrorInfo.State		:= 'Warning';
				gSkid_LR[IdxSkids_LR].ErrorInfo.Severity	:= 1;
				gSkid_LR[IdxSkids_LR].Error := TRUE;
				gServices.Alarms.Internal.Alarms_State_LR[IdxSkids_LR].ALARM_AB19.12 := TRUE;
			END_IF
		END_IF;

	END_IF;

	(*********************************************************************Dont Touch This Code**********************************************************************)
	IF gSkid_LR[IdxSkids_LR].Error AND gSkid_LR[IdxSkids_LR].AlarmsInitialized AND gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID <> 0 AND gUnit_LR[IdxSkids_LR] <> 0 THEN
		CASE gSkid_LR[IdxSkids_LR].ErrorInfo.Severity OF
			1:
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT('Skid',gSkid_LR[IdxSkids_LR].tempAlarm.name);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT(gSkid_LR[IdxSkids_LR].tempAlarm.name,'Severity1');
				gSkid_LR[IdxSkids_LR].tempAlarm.allowMultiple		:= TRUE;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[0]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.State;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[1]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid_LR[IdxSkids_LR].tempAlarm), SIZEOF(gSkid_LR[IdxSkids_LR].tempAlarm));
			2:
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:=  UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT('Skid',gSkid_LR[IdxSkids_LR].tempAlarm.name);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT(gSkid_LR[IdxSkids_LR].tempAlarm.name,'Severity2');
				gSkid_LR[IdxSkids_LR].tempAlarm.allowMultiple		:= TRUE;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[0]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.State;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[1]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid_LR[IdxSkids_LR].tempAlarm), SIZEOF(gSkid_LR[IdxSkids_LR].tempAlarm));
			3:
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:=  UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT('Skid',gSkid_LR[IdxSkids_LR].tempAlarm.name);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT(gSkid_LR[IdxSkids_LR].tempAlarm.name,'Severity3');
				gSkid_LR[IdxSkids_LR].tempAlarm.allowMultiple		:= TRUE;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[0]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.State;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[1]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid_LR[IdxSkids_LR].tempAlarm), SIZEOF(gSkid_LR[IdxSkids_LR].tempAlarm));
			4:
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:=  UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT('Skid',gSkid_LR[IdxSkids_LR].tempAlarm.name);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT(gSkid_LR[IdxSkids_LR].tempAlarm.name,'Severity4');
				gSkid_LR[IdxSkids_LR].tempAlarm.allowMultiple		:= TRUE;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[0]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.State;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[1]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid_LR[IdxSkids_LR].tempAlarm), SIZEOF(gSkid_LR[IdxSkids_LR].tempAlarm));
			5:
		  
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:=  UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT('Skid',gSkid_LR[IdxSkids_LR].tempAlarm.name);
				gSkid_LR[IdxSkids_LR].tempAlarm.name				:= CONCAT(gSkid_LR[IdxSkids_LR].tempAlarm.name,'Severity5');
				gSkid_LR[IdxSkids_LR].tempAlarm.allowMultiple		:= TRUE;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[0]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.State;
				gSkid_LR[IdxSkids_LR].tempAlarm.addText[1]		:= gSkid_LR[IdxSkids_LR].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid_LR[IdxSkids_LR].tempAlarm), SIZEOF(gSkid_LR[IdxSkids_LR].tempAlarm));
		END_CASE
		
		gSkid_LR[IdxSkids_LR].Error := FALSE;
		
	END_IF
	
	brsmemset(ADR(gSkid_LR[IdxSkids_LR].ErrorInfo),0,SIZEOF(gSkid_LR[IdxSkids_LR].ErrorInfo));
	
	//Set Unit Number and Add Alarms
	IF (gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID <> 0 AND (gUnit_LR[IdxSkids_LR] <> gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID)) 
		OR (gUnit_LR[IdxSkids_LR] <> 0 AND gVis.Alarms.Active.FilterString_LR[IdxSkids_LR] = '') THEN
		
		gUnit_LR[IdxSkids_LR] := gSkid_LR[IdxSkids_LR].Pmax_General_Variables.UNIT_ID;
		
		gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
		gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
		
		gSkid_LR[IdxSkids_LR].i := 1;
		
		SkidNumberINT := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
		
		gVis.Alarms.Active.FilterString_LR[IdxSkids_LR] := CONCAT('[{"value":',SkidNumberINT);
		gVis.Alarms.Active.FilterString_LR[IdxSkids_LR] :=  CONCAT(gVis.Alarms.Active.FilterString_LR[IdxSkids_LR] ,',"conditionType":"==","columnPosition":1}]');

	END_IF;
	
	// Case for handling the alarm history
	CASE gServices.Alarms.Internal.StateExportHistory OF
		0:
			IF gServices.Alarms.In.ExportHistory THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY EXPORTED',FALSE);
				gServices.Alarms.In.ExportHistory 									:= FALSE;
				gServices.Alarms.Internal.MpAlarmXHistory_0.Export 				:= TRUE;
				gServices.Alarms.Internal.StateExportHistory 						:= 10;
			ELSIF gServices.Alarms.In.ClearHistory THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'HISTORY CLEARED',FALSE);
				gServices.Alarms.In.ClearHistory 									:= FALSE;
				MpAlarmXClearHistory(gAlarmXHistory);
			END_IF;
		10:
			IF gServices.Alarms.Internal.MpAlarmXHistory_0.CommandDone OR gServices.Alarms.Internal.MpAlarmXHistory_0.Error THEN
				gServices.Alarms.Internal.MpAlarmXHistory_0.Export 				:= FALSE;
				gServices.Alarms.Internal.StateExportHistory 						:= 0;
			END_IF;
	END_CASE;

	//	IF gMain.ErrorReset THEN
	//		gServices.Alarms.In.ResetAlarms 											:= TRUE;
	//	END_IF;
	
	// Case for handling the alarm resetting
	CASE gServices.Alarms.Internal.StateResetAlarms OF
		0:
			IF gServices.Alarms.In.ResetAlarms OR gVis.Global.ErrorReset THEN
				HA_AlarmX_Helper(gAlarmXCore,'',HA_ALARMX_ACTION_LOG_ONLY,'ACKNOWLEDGE ALL',FALSE);
				gServices.Alarms.In.ResetAlarms 									:= FALSE;
				gVis.Alarms.Active.UIConnect.AcknowledgeAll 							:= TRUE;
				gServices.Alarms.Internal.CTON_ResetDelay(IN := FALSE);
				gServices.Alarms.Internal.StateResetAlarms 						:= 10;
			END_IF;
		10:
			// give UI time to process the reset
			IF gServices.Alarms.Internal.CTON_ResetDelay.Q THEN
				gServices.Alarms.Internal.CTON_ResetDelay(IN := FALSE);
				gServices.Alarms.Internal.StateResetAlarms 						:= 0;
				gVis.Global.ErrorReset := FALSE;
			ELSE
				gServices.Alarms.Internal.CTON_ResetDelay(IN := TRUE, PT := T#250ms);
			END_IF;
	END_CASE;
	
	
	//Create Alarms
	CASE gSkid_LR[IdxSkids_LR].i OF 
		0: 
			//IDLE
		1: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('Severity1'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));							
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('Severity1'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR];
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 1;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;
			
		2: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('Severity2'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));							
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('Severity2'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR];
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 2;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;
				
		3: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('Severity3'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));							
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('Severity3'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR];
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 3;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;

		4: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('Severity4'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));							
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('Severity4'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR];
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 4;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;
		5: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('Severity5'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));							
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('Severity5'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR];
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 5;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;
												
		6: 
			gSkid_LR[IdxSkids_LR].AlarmName	 := UINT_TO_STRING(gUnit_LR[IdxSkids_LR]);
			gSkid_LR[IdxSkids_LR].AlarmName	 := CONCAT('Skid',gSkid_LR[IdxSkids_LR].AlarmName	);
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmName), ADR('CmdIgnored'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmName));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR(gSkid_LR[IdxSkids_LR].AlarmName), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid_LR[IdxSkids_LR].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid_LR[IdxSkids_LR].AlarmCfg.Message));
			gSkid_LR[IdxSkids_LR].AlarmCfg.Code													:= gUnit_LR[IdxSkids_LR] + 6;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Severity												:= 0;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid_LR[IdxSkids_LR].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save				:= TRUE;
		7:
			gSkid_LR[IdxSkids_LR].AlarmStartupDelay.IN := TRUE;
			
			IF 	gSkid_LR[IdxSkids_LR].AlarmStartupDelay.Q THEN
				gSkid_LR[IdxSkids_LR].AlarmsInitialized := TRUE;
			END_IF;
			
	END_CASE
	
	gSkid_LR[IdxSkids_LR].AlarmStartupDelay(PT := T#30s);
		
	gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.MpLink			:= ADR(gAlarmXCore);
	gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Enable			:= TRUE;
	gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Name				:= ADR(gSkid_LR[IdxSkids_LR].AlarmName);
	gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Configuration	:= ADR(gSkid_LR[IdxSkids_LR].AlarmCfg);
		
	IF gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.CommandDone THEN
		IF gSkid_LR[IdxSkids_LR].i < 7 THEN
			gSkid_LR[IdxSkids_LR].i := gSkid_LR[IdxSkids_LR].i + 1;
		ELSE
			//Do nothing
		END_IF;
		
		gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm.Save := FALSE;
	END_IF;
	
	gSkid_LR[IdxSkids_LR].MpAlarmXConfigAlarm();
	
END_ACTION
