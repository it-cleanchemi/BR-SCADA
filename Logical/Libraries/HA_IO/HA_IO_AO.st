
(* Full Analog Output Handler*)
FUNCTION_BLOCK HA_IO_AO
//LOGICAL
	Signal.Logical						:= Logical;
	Signal.UnlimitedLogical				:= Logical;
	Signal.Vis.App						:= Logical;
	Internal.Temp						:= Logical;
//FORCING
	IF Forcing.On XOR Forcing.Off THEN	
		IF Forcing.Off THEN
			Internal.Temp				:= 0.0;
		ELSIF Forcing.On THEN
			Internal.Temp				:= Forcing.Value;
		END_IF;
	END_IF;
//LIMITING
	Signal.MaxExceeded					:= FALSE;
	IF Internal.Temp > Par.MaxValue THEN
		Signal.MaxExceeded				:= TRUE;
		Internal.Temp					:= Par.MaxValue;
	END_IF;
	Signal.MinExceeded					:= FALSE;
	IF Signal.Logical < Par.MinValue THEN
		Signal.MinExceeded				:= TRUE;
		Internal.Temp					:= Par.MinValue;
	END_IF;
//FILTERING
	Internal.Filter 					:= Par.Filter;
	IF Par.Filter < 0.0 THEN
		Internal.Filter 				:= 0.0;
	ELSIF Internal.Filter > 1.0 THEN
		Internal.Filter 				:= 0.99999999;
	END_IF;
	IF NOT Internal.InitFilter OR Internal.LastFilter <> Internal.Filter THEN
		Internal.InitFilter				:= TRUE;
		Internal.LastFilter 			:= Internal.Filter;
		Signal.Filtered 				:= Internal.Temp;
	ELSE
		Signal.Filtered 				:= Internal.Temp*(1.0-Internal.Filter) + Signal.Filtered*Internal.Filter;
	END_IF;
	IF Signal.Filtered > Par.MaxValue THEN
		Signal.Filtered 				:= Par.MaxValue;
	ELSIF Signal.Filtered < Par.MinValue THEN
		Signal.Filtered 				:= Par.MinValue;
	END_IF;
//IOMAPPING
	Signal.Vis.IO						:= Signal.Filtered;
	IF Par.M <> 0 THEN
		Signal.Vis.Raw		 			:= (Signal.Filtered-Par.B)/Par.M;
	ELSE
		Signal.Vis.Raw 					:= 0.0;
	END_IF;
	CASE VarType OF
		HA_IO_ANALOG_TYPE_INT: 
			Signal.IOMapping.VarINT		:= LREAL_TO_INT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_USINT:
			Signal.IOMapping.VarUSINT	:= LREAL_TO_USINT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_SINT:
			Signal.IOMapping.VarSINT	:= LREAL_TO_SINT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_UINT:
			Signal.IOMapping.VarUINT	:= LREAL_TO_UINT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_DINT:
			Signal.IOMapping.VarDINT	:= LREAL_TO_DINT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_UDINT:
			Signal.IOMapping.VarUDINT	:= LREAL_TO_UDINT(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_REAL:
			Signal.IOMapping.VarREAL	:= LREAL_TO_REAL(Signal.Vis.Raw);
		HA_IO_ANALOG_TYPE_LREAL:	
			Signal.IOMapping.VarLREAL	:= Signal.Vis.Raw;
	END_CASE

END_FUNCTION_BLOCK
