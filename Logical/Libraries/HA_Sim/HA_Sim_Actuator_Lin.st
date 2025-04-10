
FUNCTION_BLOCK HA_Sim_Actuator_Lin

	IF Enable THEN
		IF NOT Internal.Active OR (Internal.Active AND (Internal.OldTimeNeg <> TimeNeg OR Internal.OldTimePos <> TimePos)) THEN
			IF TimeNeg <= 0 THEN
				Internal.MTBasicsLimiter_0.MaxNegSlewRate	:= 0;
			ELSE
				Internal.MTBasicsLimiter_0.MaxNegSlewRate	:= 1.0/TimeNeg;
			END_IF;
			IF TimePos <= 0 THEN
				Internal.MTBasicsLimiter_0.MaxPosSlewRate	:= 0;
			ELSE
				Internal.MTBasicsLimiter_0.MaxPosSlewRate	:= 1.0/TimePos;
			END_IF;
			Internal.OldTimeNeg 							:= TimeNeg;
			Internal.OldTimePos 							:= TimePos;
			IF Internal.Active THEN
				Internal.MTBasicsLimiter_0.Update			:= TRUE;
			END_IF;
			Internal.Active 								:= TRUE;
		END_IF;

		IF Actuate THEN
			Internal.MTBasicsLimiter_0.In					:= 1.0;
		ELSE
			Internal.MTBasicsLimiter_0.In					:= 0.0;
		END_IF;

		Position 											:= Internal.MTBasicsLimiter_0.Out*FullStrokeValue;

		AtFalsePosition										:= ABS(Position) <= FeedbackTol;
		AtTruePosition										:= ABS(Position-FullStrokeValue) <= FeedbackTol;
		Internal.MTBasicsLimiter_0.Enable					:= TRUE;		
	ELSE
		Position 											:= 0.0;
		AtFalsePosition 									:= FALSE;
		AtTruePosition 										:= FALSE;
		Internal.Active 									:= FALSE;
		Internal.MTBasicsLimiter_0.Enable					:= FALSE;
		Internal.MTBasicsLimiter_0.In						:= 0.0;
		Internal.OldTimeNeg									:= 0.0;
		Internal.OldTimePos									:= 0.0;
	END_IF;

	Internal.MTBasicsLimiter_0();
	Internal.MTBasicsLimiter_0.Update 						:= FALSE;
	Error 													:= Internal.MTBasicsLimiter_0.Error;

END_FUNCTION_BLOCK
