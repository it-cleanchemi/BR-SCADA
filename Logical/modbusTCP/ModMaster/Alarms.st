
ACTION Alarms_action: 
	
	// AB1
	IF gSkid[IdxSkids].Alarms.ALARM_AB1.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB1.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB1.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB1.0 := TRUE;
		END_IF;
	END_IF;
	
	// AB2
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.0 := TRUE;
		END_IF
	END_IF;
	
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.1 := TRUE;
		END_IF
	END_IF;
	
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.2 := TRUE;
		END_IF
	END_IF;
	
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.3 := TRUE;
		END_IF
	END_IF;
	
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.4 := TRUE;
		END_IF
	END_IF;
	
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P102.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P103.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P104.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P201.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P202.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.0 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.1 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.2 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.3 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.4 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.5 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.6 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.7 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.8 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.9 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.10 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.11 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.12 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.13 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.14 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_P203.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.15 := TRUE;
		END_IF
	END_IF;
	IF gSkid[IdxSkids].Alarms.ALARM_AB2.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB2.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB2.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB2.15 := TRUE;
		END_IF
	END_IF;

	// AB3
	IF gSkid[IdxSkids].Alarms.ALARM_AB3.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB3.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB3.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB3.15 := TRUE;
		END_IF
	END_IF;

	// AB4
	IF gSkid[IdxSkids].Alarms.ALARM_AB4.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB4.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB4.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB4.15 := TRUE;
		END_IF
	END_IF;

	// AB5
	IF gSkid[IdxSkids].Alarms.ALARM_AB5.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB5.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB5.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB5.15 := TRUE;
		END_IF
	END_IF;

	// AB6
	IF gSkid[IdxSkids].Alarms.ALARM_AB6.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB6.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB6.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB6.15 := TRUE;
		END_IF
	END_IF;

	// AB7
	IF gSkid[IdxSkids].Alarms.ALARM_AB7.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB7.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB7.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB7.15 := TRUE;
		END_IF
	END_IF;

	// AB8
	IF gSkid[IdxSkids].Alarms.ALARM_AB8.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_AB8.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_AB8.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_AB8.13 := TRUE;
		END_IF
	END_IF;

	// P102
	IF gSkid[IdxSkids].Alarms.ALARM_P102.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P102.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P102.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P102.15 := TRUE;
		END_IF
	END_IF;

	// P103
	IF gSkid[IdxSkids].Alarms.ALARM_P103.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P103.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P103.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P103.15 := TRUE;
		END_IF
	END_IF;

	// P104
	IF gSkid[IdxSkids].Alarms.ALARM_P104.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P104.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P104.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P104.15 := TRUE;
		END_IF
	END_IF;

	// P201
	IF gSkid[IdxSkids].Alarms.ALARM_P201.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P201.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P201.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P201.15 := TRUE;
		END_IF
	END_IF;

	// P202
	IF gSkid[IdxSkids].Alarms.ALARM_P202.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P202.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P202.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P202.15 := TRUE;
		END_IF
	END_IF;

	// P203
	IF gSkid[IdxSkids].Alarms.ALARM_P203.0 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.0 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.0';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.0 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.1 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.1 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.1';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.1 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.2 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.2 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.2';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.2 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.3 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.3 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.3';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.3 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.4 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.4 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.4';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.4 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.5 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.5 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.5';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.5 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.6 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.6 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.6';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.6 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.7 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.7 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.7';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.7 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.8 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.8 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.8';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.8 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.9 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.9 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.9';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.9 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.10 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.10 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.10';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.10 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.11 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.11 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.11';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.11 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.12 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.12 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.12';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.12 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.13 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.13 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.13';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.13 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.14 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.14 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.14';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.14 := TRUE;
		END_IF
	END_IF;

	IF gSkid[IdxSkids].Alarms.ALARM_P203.15 AND gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.15 = FALSE THEN
		IF gSkid[IdxSkids].ErrorInfo.Text = '' THEN
			gSkid[IdxSkids].ErrorInfo.Text		:= 'ALARM_P203.15';
			gSkid[IdxSkids].ErrorInfo.State		:= 'Warning';
			gSkid[IdxSkids].ErrorInfo.Severity	:= 2;
			gSkid[IdxSkids].Error := TRUE;
			gServices.Alarms.Internal.Alarms_State[IdxSkids].ALARM_P203.15 := TRUE;
		END_IF
	END_IF;


	(*********************************************************************Dont Touch This Code**********************************************************************)
	IF gSkid[IdxSkids].Error THEN
		CASE gSkid[IdxSkids].ErrorInfo.Severity OF
			1:
				gSkid[IdxSkids].tempAlarm.name				:= UINT_TO_STRING(gUnit[IdxSkids]);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity1');
				gSkid[IdxSkids].tempAlarm.allowMultiple		:= TRUE;
				gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
				gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
			2:
				gSkid[IdxSkids].tempAlarm.name				:=  UINT_TO_STRING(gUnit[IdxSkids]);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity2');
				gSkid[IdxSkids].tempAlarm.allowMultiple		:= TRUE;
				gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
				gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
			3:
				gSkid[IdxSkids].tempAlarm.name				:=  UINT_TO_STRING(gUnit[IdxSkids]);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity3');
				gSkid[IdxSkids].tempAlarm.allowMultiple		:= TRUE;
				gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
				gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
			4:
				gSkid[IdxSkids].tempAlarm.name				:=  UINT_TO_STRING(gUnit[IdxSkids]);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity4');
				gSkid[IdxSkids].tempAlarm.allowMultiple		:= TRUE;
				gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
				gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
			5:
		  
				gSkid[IdxSkids].tempAlarm.name				:=  UINT_TO_STRING(gUnit[IdxSkids]);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT('Skid',gSkid[IdxSkids].tempAlarm.name);
				gSkid[IdxSkids].tempAlarm.name				:= CONCAT(gSkid[IdxSkids].tempAlarm.name,'Severity5');
				gSkid[IdxSkids].tempAlarm.allowMultiple		:= TRUE;
				gSkid[IdxSkids].tempAlarm.addText[0]		:= gSkid[IdxSkids].ErrorInfo.State;
				gSkid[IdxSkids].tempAlarm.addText[1]		:= gSkid[IdxSkids].ErrorInfo.Text;
					
				HA_Array_AddTop(ADR(gServices.Alarms.In.AlarmList), SIZEOF(gServices.Alarms.In.AlarmList), ADR(gSkid[IdxSkids].tempAlarm), SIZEOF(gSkid[IdxSkids].tempAlarm));
		END_CASE
		
		gSkid[IdxSkids].Error := FALSE;
		
	END_IF
	
	brsmemset(ADR(gSkid[IdxSkids].ErrorInfo),0,SIZEOF(gSkid[IdxSkids].ErrorInfo));
	
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
	
	
	gServices.Alarms.Out.BufferInfo.Address	:= ADR(gServices.Alarms.In.AlarmList);
	gServices.Alarms.Out.BufferInfo.Size		:= SIZEOF(gServices.Alarms.In.AlarmList);

	gServices.Alarms.Internal.HA_AlarmXCore_0(MpLink := gAlarmXCore, enable := TRUE, pBuffer := ADR(gServices.Alarms.In.AlarmList), pOutputData := ADR(gAlarmAddData));
	gServices.Alarms.Internal.MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms.Internal.MpAlarmXListUI_0(MpLink := ADR(gAlarmXCore), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.Active.UIConnect));
	gServices.Alarms.Internal.MpAlarmXHistory_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset);
	gServices.Alarms.Internal.MpAlarmXHistoryUI_0(MpLink := ADR(gAlarmXHistory), Enable := TRUE, ErrorReset := gErrorReset, UIConnect := ADR(gVis.Alarms.History.UIConnect));
	gServices.Alarms.Internal.MpAlarmXHistory_0.DeviceName 						:= ADR(gServices.DeviceName);
	
	//Create Alarms
	CASE gSkid[IdxSkids].i OF 
		0: 
			//IDLE
		1: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('Severity1'), SIZEOF(gSkid[IdxSkids].AlarmName));							
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('Severity1'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids];
			gSkid[IdxSkids].AlarmCfg.Severity												:= 1;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;
			
		2: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('Severity2'), SIZEOF(gSkid[IdxSkids].AlarmName));							
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('Severity2'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids];
			gSkid[IdxSkids].AlarmCfg.Severity												:= 2;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;
				
		3: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('Severity3'), SIZEOF(gSkid[IdxSkids].AlarmName));							
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('Severity3'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids];
			gSkid[IdxSkids].AlarmCfg.Severity												:= 3;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;

		4: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('Severity4'), SIZEOF(gSkid[IdxSkids].AlarmName));							
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('Severity4'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids];
			gSkid[IdxSkids].AlarmCfg.Severity												:= 4;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;
		5: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('Severity5'), SIZEOF(gSkid[IdxSkids].AlarmName));							
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('Severity5'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids];
			gSkid[IdxSkids].AlarmCfg.Severity												:= 5;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;
												
		6: 
			gSkid[IdxSkids].AlarmName	 := UINT_TO_STRING(gUnit[IdxSkids]);
			gSkid[IdxSkids].AlarmName	 := CONCAT('Skid',gSkid[IdxSkids].AlarmName	);
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmName), ADR('CmdIgnored'), SIZEOF(gSkid[IdxSkids].AlarmName));
			gSkid[IdxSkids].AlarmCfg.Message												:= '{$$IAT/Alarm.';
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR(gSkid[IdxSkids].AlarmName), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			HA_brsstrcat(ADR(gSkid[IdxSkids].AlarmCfg.Message), ADR('}'), SIZEOF(gSkid[IdxSkids].AlarmCfg.Message));
			gSkid[IdxSkids].AlarmCfg.Code													:= gUnit[IdxSkids] + 6;
			gSkid[IdxSkids].AlarmCfg.Severity												:= 0;
			gSkid[IdxSkids].AlarmCfg.Behavior.AutoReset									:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
			gSkid[IdxSkids].AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.AcknowledgedToUnacknowledged := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.ActiveToInactive := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.InactiveToActive := TRUE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.Reactivation := FALSE;
			gSkid[IdxSkids].AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged := FALSE;
			gSkid[IdxSkids].MpAlarmXConfigAlarm.Save				:= TRUE;

	END_CASE
		
	gSkid[IdxSkids].MpAlarmXConfigAlarm.MpLink			:= ADR(gAlarmXCore);
	gSkid[IdxSkids].MpAlarmXConfigAlarm.Enable			:= TRUE;
	gSkid[IdxSkids].MpAlarmXConfigAlarm.Name				:= ADR(gSkid[IdxSkids].AlarmName);
	gSkid[IdxSkids].MpAlarmXConfigAlarm.Configuration	:= ADR(gSkid[IdxSkids].AlarmCfg);
		
	IF gSkid[IdxSkids].MpAlarmXConfigAlarm.CommandDone THEN
		IF gSkid[IdxSkids].i < 7 THEN
			gSkid[IdxSkids].i := gSkid[IdxSkids].i + 1;
		ELSE
			//Do nothing
		END_IF;
		
		gSkid[IdxSkids].MpAlarmXConfigAlarm.Save := FALSE;
	END_IF;
	
	gSkid[IdxSkids].MpAlarmXConfigAlarm();
	
END_ACTION
