
ACTION Modbus_CMD_action: 
	
	IF gCmd[IdxSkids].WriteSkidID.Send THEN
		MasterConfig[IdxSkids].action_enable[20].single := TRUE;
		gCmd[IdxSkids].WriteSkidID.Send := FALSE;
	END_IF;
			
	IF gCmd[IdxSkids].WriteP101_SP.Send THEN
		gCmd[IdxSkids].WriteP101_SP.P101_SP_SWAPPED := IDEC_REAL_Conv(gCmd[IdxSkids].WriteP101_SP.P101_SP);
		MasterConfig[IdxSkids].action_enable[21].single := TRUE;
		gCmd[IdxSkids].WriteP101_SP.Send := FALSE;
	END_IF;

END_ACTION
