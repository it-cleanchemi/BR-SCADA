
(* Takes Value Pairs and packs into a JSON String *)
FUNCTION_BLOCK HA_JSON_PairsToJSON
	IF Enable THEN
		IF NOT Internal.Enabled THEN
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			brsmemset(pBuffer,0,BufferSIZEOF);
			HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
			Internal.DepthArrayIdx[0]										:= -1;
			Internal.Enabled												:= TRUE;
		END_IF;
		IF Error OR Done THEN
			// Do Nothing, Enable must be toggled to parse again
		ELSE
			FOR Internal.i := 0 TO MAX_JSON_PARSE_PAIR_IDX DO
				brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
				IF Internal.Pair.Name = '' AND Internal.Pair.Value = '' THEN
					HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
					Done													:= TRUE;
					EXIT;
				ELSIF Internal.i = MAX_JSON_PARSE_PAIR_IDX AND Internal.Pair.Value <> '}' THEN
					Error													:= TRUE;
					EXIT;
				ELSE
					IF Internal.Pair.Value = '{' THEN
						IF Internal.Depth <= MAX_JSON_PARSE_DEPTH_IDX THEN
							Internal.Depth 									:= Internal.Depth + 1;
							Internal.DepthArrayIdx[Internal.Depth]			:= -1;
							IF Internal.DepthArrayIdx[Internal.Depth-1] >= 0 OR Internal.i = 0 THEN
								HA_brsstrcat(pBuffer,ADR('{'),BufferSIZEOF);
							ELSE
								HA_brsstrcat(pBuffer,ADR('"'),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR(Internal.Pair.Name),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR('": {'),BufferSIZEOF);
							END_IF;
							IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
								IF Internal.Pair.Value <> '}' THEN // Check next element to detect empty object condition
									HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
									FOR Internal.j := 0 TO (Internal.Depth-1)*2+1 DO
										HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
									END_FOR;
								END_IF;
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
							END_IF;
						ELSE
							Error											:= TRUE;
							EXIT;
						END_IF;
					ELSIF Internal.Pair.Value = '}' THEN
						Internal.DepthArrayIdx[Internal.Depth]			:= -1;
						IF Internal.Depth = 0 THEN
							Error										:= TRUE;
							EXIT;
						ELSE
							Internal.Depth								:= Internal.Depth - 1;
						END_IF;
						HA_brsstrcat(pBuffer,ADR('}'),BufferSIZEOF);
						IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
							brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
							IF Internal.Pair.Value = '' AND Internal.Pair.Value = '' THEN

							ELSIF Internal.Pair.Value <> ']' AND Internal.Pair.Value <> '}' THEN
								HA_brsstrcat(pBuffer,ADR(','),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
								FOR Internal.j := 0 TO (Internal.Depth-1)*2+1 DO
									HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
								END_FOR;
							ELSE
								HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
								IF Internal.Depth >= 2 THEN
									FOR Internal.j := 0 TO (Internal.Depth-2)*2+1 DO
										HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
									END_FOR;
								END_IF;
							END_IF;
							brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
						END_IF;
					ELSIF Internal.Pair.Value = '[' THEN
						IF Internal.Depth <= MAX_JSON_PARSE_DEPTH_IDX THEN
							Internal.Depth 									:= Internal.Depth + 1;
							Internal.DepthArrayIdx[Internal.Depth]			:= 0;
							IF Internal.DepthArrayIdx[Internal.Depth-1] >= 0 OR Internal.i = 0 THEN
								HA_brsstrcat(pBuffer,ADR('['),BufferSIZEOF);
							ELSE
								HA_brsstrcat(pBuffer,ADR('"'),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR(Internal.Pair.Name),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR('": ['),BufferSIZEOF);
							END_IF;
							IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
								IF Internal.Pair.Value = '[' OR Internal.Pair.Value = '{' THEN
									HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
									IF Internal.Depth >= 1 THEN
										FOR Internal.j := 0 TO (Internal.Depth-1)*2+1 DO
											HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
										END_FOR;
									END_IF;
								END_IF;
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
							END_IF;
						ELSE
							Error											:= TRUE;
							EXIT;
						END_IF;
					ELSIF Internal.Pair.Value = ']' THEN
						Internal.DepthArrayIdx[Internal.Depth]			:= -1;
						IF Internal.Depth = 0 THEN
							Error										:= TRUE;
							EXIT;
						ELSE
							Internal.Depth								:= Internal.Depth - 1;
						END_IF;
						HA_brsstrcat(pBuffer,ADR(']'),BufferSIZEOF);
						IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
							brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
							IF Internal.Pair.Value = '' AND Internal.Pair.Value = '' THEN

							ELSIF Internal.Pair.Value <> ']' AND Internal.Pair.Value <> '}' THEN
								HA_brsstrcat(pBuffer,ADR(','),BufferSIZEOF);
								HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
								FOR Internal.j := 0 TO (Internal.Depth-1)*2+1 DO
									HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
								END_FOR;
							ELSE
								HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
								IF Internal.Depth >= 2 THEN
									FOR Internal.j := 0 TO (Internal.Depth-2)*2+1 DO
										HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
									END_FOR;
								END_IF;
							END_IF;
							brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
						END_IF;
					ELSE
						IF Internal.DepthArrayIdx[Internal.Depth] >= 0 THEN
							HA_brsstrcat(pBuffer,ADR(Internal.Pair.Value),BufferSIZEOF);
							IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
								IF Internal.Pair.Value <> ']' AND Internal.Pair.Value <> '}' THEN
									HA_brsstrcat(pBuffer,ADR(', '),BufferSIZEOF);
								END_IF;
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
							END_IF;
						ELSE
							HA_brsstrcat(pBuffer,ADR('"'),BufferSIZEOF);
							HA_brsstrcat(pBuffer,ADR(Internal.Pair.Name),BufferSIZEOF);
							HA_brsstrcat(pBuffer,ADR('": '),BufferSIZEOF);
							HA_brsstrcat(pBuffer,ADR(Internal.Pair.Value),BufferSIZEOF);
							IF Internal.i <> MAX_JSON_PARSE_PAIR_IDX THEN
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*(Internal.i+1),SIZEOF(Internal.Pair));
								IF Internal.Pair.Value <> ']' AND Internal.Pair.Value <> '}' THEN
									HA_brsstrcat(pBuffer,ADR(','),BufferSIZEOF);
									HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
									FOR Internal.j := 0 TO (Internal.Depth-1)*2+1 DO
										HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
									END_FOR;
								ELSE
									HA_brsstrcat(pBuffer,ADR('$r$n'),BufferSIZEOF);
									IF Internal.Depth >= 2 THEN
										FOR Internal.j := 0 TO (Internal.Depth-2)*2+1 DO
											HA_brsstrcat(pBuffer,ADR(' '),BufferSIZEOF);
										END_FOR;
									END_IF;
								END_IF;
								brsmemcpy(ADR(Internal.Pair),pPairs+SIZEOF(Internal.Pair)*Internal.i,SIZEOF(Internal.Pair));
							END_IF;
						END_IF;
					END_IF;
				END_IF;
			END_FOR;
		END_IF;
	ELSE
		Done																:= FALSE;
		Error																:= FALSE;
		brsmemset(ADR(Internal),0,SIZEOF(Internal));
	END_IF;

END_FUNCTION_BLOCK
