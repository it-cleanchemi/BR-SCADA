
(* Full Digital Input Handler*)
FUNCTION_BLOCK HA_IO_DI

//LOGICAL/INVERT
	Signal.IOMapping					:= IOMapping;
	Signal.InvertedIOMapping			:= NOT Signal.IOMapping;
	IF Par.InvertedIOMapping THEN
		Signal.Logical					:= Signal.InvertedIOMapping;
	ELSE
		Signal.Logical					:= Signal.IOMapping;
	END_IF;
//SIMULATION
	IF Sim.Active THEN
		Signal.Logical					:= Sim.Logical;
		Signal.IOMapping				:= Sim.Logical;
		Signal.InvertedIOMapping		:= NOT Sim.Logical;
	END_IF;
//VISUALIZATION
	IF Par.InvertedIOMapping THEN
		Signal.VisIOMapping				:= Signal.InvertedIOMapping;
	ELSE
		Signal.VisIOMapping				:= Signal.IOMapping;
	END_IF;
//DEBOUNCING
	IF Signal.Logical THEN
		Internal.CTON_DB_Off(IN := FALSE);
		IF Internal.CTON_DB_On.Q OR Par.FilterOnTime <= 0.0 THEN
			Signal.Filtered			:= TRUE;
		ELSE
			Internal.CTON_DB_On(IN := TRUE, PT := LREAL_TO_TIME(Par.FilterOnTime*1000.0));
		END_IF;
	ELSE
		Internal.CTON_DB_On(IN := FALSE);
		IF Internal.CTON_DB_Off.Q OR Par.FilterOffTime <= 0.0 THEN
			Signal.Filtered			:= FALSE;
		ELSE
			Internal.CTON_DB_Off(IN := TRUE, PT := LREAL_TO_TIME(Par.FilterOffTime*1000.0));
		END_IF;
	END_IF;
//FORCING
	IF Forcing.On XOR Forcing.Off THEN	
		IF Forcing.Off THEN
			Signal.Logical				:= FALSE;
			Signal.Filtered			:= FALSE;
		ELSIF Forcing.On THEN	
			Signal.Logical				:= TRUE;
			Signal.Filtered			:= TRUE;
		END_IF;
	END_IF;
//EDGES
	Signal.EdgeNegLogical				:= FALSE;
	IF Internal.StatusLogical AND NOT Signal.Logical THEN
		Signal.EdgeNegLogical			:= TRUE;
	END_IF;
	Signal.EdgePosLogical				:= FALSE;
	IF NOT Internal.StatusLogical AND Signal.Logical THEN
		Signal.EdgePosLogical			:= TRUE;
	END_IF;
	Internal.StatusLogical 				:= Signal.Logical;

	Signal.EdgeNegFiltered				:= FALSE;
	IF Internal.StatusFiltered AND NOT Signal.Filtered THEN
		Signal.EdgeNegFiltered			:= TRUE;
	END_IF;
	Signal.EdgePosFiltered				:= FALSE;
	IF NOT Internal.StatusFiltered AND Signal.Filtered THEN
		Signal.EdgePosFiltered			:= TRUE;
	END_IF;
	Internal.StatusFiltered 			:= Signal.Filtered;

//This is needed as a workaround for an event bug that wouldnt show IO status colors if IO was active at start of Vis
	Signal.VisRefresher					:= FALSE;

END_FUNCTION_BLOCK
