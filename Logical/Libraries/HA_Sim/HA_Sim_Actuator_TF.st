
FUNCTION_BLOCK HA_Sim_Actuator_TF

	IF Enable THEN
		IF NOT Internal.Active OR (Internal.Active AND (Internal.OldNaturalFreq <> NaturalFreq OR Internal.OldDampingRatio <> DampingRatio OR Internal.OldFullStrokeValue <> FullStrokeValue)) THEN
			Internal.MTBasicsTransferFcn_0.Numerator[0] 	:= FullStrokeValue*NaturalFreq**2;
			Internal.MTBasicsTransferFcn_0.Denominator[0] 	:= NaturalFreq**2;
			Internal.MTBasicsTransferFcn_0.Denominator[1] 	:= 2*DampingRatio*NaturalFreq;
			Internal.MTBasicsTransferFcn_0.Denominator[2] 	:= 1;
			Internal.OldNaturalFreq							:= NaturalFreq;
			Internal.OldDampingRatio						:= DampingRatio;
			Internal.OldFullStrokeValue						:= FullStrokeValue;
			IF Internal.Active THEN
				Internal.MTBasicsTransferFcn_0.Update		:= TRUE;
			END_IF;
			Internal.Active 								:= TRUE;
		END_IF;

		IF Actuate THEN
			Internal.MTBasicsTransferFcn_0.In				:= 1.0;
		ELSE
			Internal.MTBasicsTransferFcn_0.In				:= 0.0;
		END_IF;

		Position 											:= Internal.MTBasicsTransferFcn_0.Out;
		IF ClampValueToEnds THEN
			IF Internal.MTBasicsTransferFcn_0.Out > FullStrokeValue THEN
				Position 									:= FullStrokeValue;
			ELSIF Internal.MTBasicsTransferFcn_0.Out < 0 THEN
				Position 									:= 0.0;
			END_IF;
		END_IF;

		AtFalsePosition										:= ABS(Position) <= FeedbackTol;
		AtTruePosition										:= ABS(Position-FullStrokeValue) <= FeedbackTol;
		Internal.MTBasicsTransferFcn_0.Enable				:= TRUE;		
	ELSE
		Position 											:= 0.0;
		AtFalsePosition 									:= FALSE;
		AtTruePosition 										:= FALSE;
		Internal.Active 									:= FALSE;
		Internal.MTBasicsTransferFcn_0.Enable				:= FALSE;
		Internal.MTBasicsTransferFcn_0.In					:= 0.0;
		Internal.OldNaturalFreq								:= 0.0;
		Internal.OldDampingRatio							:= 0.0;
		Internal.OldFullStrokeValue							:= 0.0;
	END_IF;

	Internal.MTBasicsTransferFcn_0();
	Internal.MTBasicsTransferFcn_0.Update 					:= FALSE;
	Error 													:= Internal.MTBasicsTransferFcn_0.Error;

END_FUNCTION_BLOCK
