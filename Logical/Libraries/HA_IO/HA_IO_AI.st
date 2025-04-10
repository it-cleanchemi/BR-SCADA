
(* Full Analog Input Handler*)
FUNCTION_BLOCK HA_IO_AI

	CASE VarType OF
		HA_IO_ANALOG_TYPE_INT:
		//LOGICAL
			Signal.IOMapping.VarINT					:= IOMapping.VarINT;
			Signal.Vis.Raw							:= INT_TO_LREAL(Signal.IOMapping.VarINT);
			Signal.Vis.IO							:= Par.M*INT_TO_LREAL(Signal.IOMapping.VarINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarINT			:= LREAL_TO_INT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarINT			:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_USINT:
		//LOGICAL
			Signal.IOMapping.VarUSINT				:= IOMapping.VarUSINT;
			Signal.Vis.Raw							:= USINT_TO_LREAL(Signal.IOMapping.VarUSINT);
			Signal.Vis.IO							:= Par.M*USINT_TO_LREAL(Signal.IOMapping.VarUSINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarUSINT		:= LREAL_TO_USINT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarUSINT		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_SINT:
		//LOGICAL
			Signal.IOMapping.VarSINT				:= IOMapping.VarSINT;
			Signal.Vis.Raw							:= SINT_TO_LREAL(Signal.IOMapping.VarSINT);
			Signal.Vis.IO							:= Par.M*SINT_TO_LREAL(Signal.IOMapping.VarSINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarSINT		:= LREAL_TO_SINT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarSINT		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_UINT:
		//LOGICAL
			Signal.IOMapping.VarUINT				:= IOMapping.VarUINT;
			Signal.Vis.Raw							:= UINT_TO_LREAL(Signal.IOMapping.VarUINT);
			Signal.Vis.IO							:= Par.M*UINT_TO_LREAL(Signal.IOMapping.VarUINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarUINT		:= LREAL_TO_UINT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarUINT		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_DINT:
		//LOGICAL
			Signal.IOMapping.VarDINT				:= IOMapping.VarDINT;
			Signal.Vis.Raw							:= DINT_TO_LREAL(Signal.IOMapping.VarDINT);
			Signal.Vis.IO							:= Par.M*DINT_TO_LREAL(Signal.IOMapping.VarDINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarDINT		:= LREAL_TO_DINT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarDINT		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_UDINT:
		//LOGICAL
			Signal.IOMapping.VarUDINT				:= IOMapping.VarUDINT;
			Signal.Vis.Raw							:= UDINT_TO_LREAL(Signal.IOMapping.VarUDINT);
			Signal.Vis.IO							:= Par.M*UDINT_TO_LREAL(Signal.IOMapping.VarUDINT)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarUDINT		:= LREAL_TO_UDINT(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarUDINT		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_REAL:
		//LOGICAL
			Signal.IOMapping.VarREAL				:= IOMapping.VarREAL;
			Signal.Vis.Raw							:= REAL_TO_LREAL(Signal.IOMapping.VarREAL);
			Signal.Vis.IO							:= Par.M*REAL_TO_LREAL(Signal.IOMapping.VarREAL)+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarREAL		:= LREAL_TO_REAL(Signal.Vis.Raw);
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarREAL		:= 0;
				END_IF;
			END_IF;
		HA_IO_ANALOG_TYPE_LREAL:
		//LOGICAL
			Signal.IOMapping.VarLREAL				:= IOMapping.VarLREAL;
			Signal.Vis.Raw							:= Signal.IOMapping.VarLREAL;
			Signal.Vis.IO							:= Par.M*Signal.IOMapping.VarLREAL+Par.B;
		//SIMULATION
			IF Sim.Active THEN
				Signal.Vis.IO						:= Sim.Logical;
				IF Par.M <> 0 THEN
					Signal.Vis.Raw					:= (Signal.Vis.IO-Par.B)/Par.M;
					Signal.IOMapping.VarLREAL		:= Signal.Vis.Raw;
				ELSE
					Signal.Vis.Raw					:= 0.0;
					Signal.IOMapping.VarLREAL		:= 0;
				END_IF;
			END_IF;
	END_CASE;		
	Signal.Logical									:= Signal.Vis.IO;
//FORCING
	IF Forcing.On XOR Forcing.Off THEN	
		IF Forcing.Off THEN
			Signal.Logical							:= 0.0;
		ELSIF Forcing.On THEN
			Signal.Logical							:= Forcing.Value;
		END_IF;
	END_IF;
//LIMITING
	Signal.UnlimitedLogical							:= Signal.Logical;
	Signal.MaxExceeded								:= FALSE;
	IF Signal.Logical > Par.MaxValue THEN
		Signal.MaxExceeded							:= TRUE;
		Signal.Logical								:= Par.MaxValue;
	END_IF;
	Signal.MinExceeded								:= FALSE;
	IF Signal.Logical < Par.MinValue THEN
		Signal.MinExceeded							:= TRUE;
		Signal.Logical								:= Par.MinValue;
	END_IF;
//FILTERING	
	Internal.Filter 								:= Par.Filter;
	IF Par.Filter < 0.0 THEN
		Internal.Filter 							:= 0.0;
	ELSIF Internal.Filter > 1.0 THEN	
		Internal.Filter 							:= 0.99999999;
	END_IF;
	IF NOT Internal.InitFilter OR Internal.LastFilter <> Internal.Filter THEN
		Internal.InitFilter							:= TRUE;
		Internal.LastFilter 						:= Internal.Filter;
		Signal.Filtered 							:= Signal.Logical;
	ELSE
		Signal.Filtered 							:= Signal.Logical*(1.0-Internal.Filter) + Signal.Filtered*Internal.Filter;
	END_IF;
	IF Signal.Filtered > Par.MaxValue THEN
		Signal.Filtered 							:= Par.MaxValue;
	ELSIF Signal.Filtered < Par.MinValue THEN
		Signal.Filtered 							:= Par.MinValue;
	END_IF;
	Signal.Vis.App									:= Signal.Filtered;
END_FUNCTION_BLOCK
