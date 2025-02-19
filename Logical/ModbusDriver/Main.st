
PROGRAM _INIT
	

	gModbusDriver[0].BlockSend := TRUE;

	 
END_PROGRAM

PROGRAM _CYCLIC
		
	IF gModbusDriver[IdxModbusBlocks].BlockRecieved THEN
		gModbusDriver[IdxModbusBlocks].BlockSend := FALSE;
		ModbusDelay_TON[IdxModbusBlocks].IN := TRUE;
	ELSIF NOT ModbusDelay_TON[IdxModbusBlocks].IN THEN
		gModbusDriver[IdxModbusBlocks].BlockSend := TRUE;
	END_IF;
	
	IF IdxModbusBlocks < MAX_MODBUS_BLOCKS AND ModbusDelay_TON[IdxModbusBlocks].Q THEN
		IdxModbusBlocks := IdxModbusBlocks + 1;
		ModbusDelay_TON[IdxModbusBlocks].IN := FALSE;
	ELSIF  ModbusDelay_TON[IdxModbusBlocks].Q THEN
		ModbusDelay_TON[IdxModbusBlocks].IN := FALSE;
		IdxModbusBlocks := 0;
	END_IF;
	

	ModbusDelay_TON[IdxModbusBlocks](PT := T#10ms);

	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

