
(* FB parses a JSON string into a flat array of Name and Value Pairs, FOR LOOP COMPATIBLE *)FUNCTION_BLOCK HA_JSON_Parse

	IF Enable THEN
		IF NOT Internal.Enabled THEN
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			brsmemset(pPairs,0,(SIZEOF(Internal.Pair)*(MAX_JSON_PARSE_PAIR_IDX+1)));
			Internal.BufferLEN												:= brsstrlen(pBuffer);
			Internal.DepthArrayIdx[0]										:= -1;
			Internal.Enabled												:= TRUE;
		END_IF;
		IF Error OR Done THEN
			// Do Nothing, Enable must be toggled to parse again
		ELSE
			FOR Internal.i := 0 TO Internal.BufferLEN DO
				IF NOT Internal.InQuote THEN
					IF HA_Find_S(pBuffer+Internal.i,ADR('[')) >= 0 THEN													// New Array
						IF Internal.Depth <= MAX_JSON_PARSE_DEPTH_IDX THEN
							Internal.Depth 									:= Internal.Depth + 1;
							Internal.DepthIDs[Internal.Depth]				:= Internal.Pair.Name;
							IF Internal.DepthArrayIdx[Internal.Depth-1] >= 0 THEN
								Internal.Pair.Name							:= DINT_TO_STRING(Internal.DepthArrayIdx[Internal.Depth-1]);
								Internal.DepthArrayIdx[Internal.Depth-1] := Internal.DepthArrayIdx[Internal.Depth-1] + 1;
							END_IF;
							Internal.Pair.Value								:= '[';
							Internal.DepthIDs[Internal.Depth]				:= Internal.Pair.Name;
							Internal.DepthArrayIdx[Internal.Depth]			:= 0;
							Internal.Send									:= TRUE;
						ELSE
							Error											:= TRUE;
							EXIT;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR('{')) >= 0 THEN 												// New Struct
						IF Internal.Depth <= MAX_JSON_PARSE_DEPTH_IDX THEN
							Internal.Depth 									:= Internal.Depth + 1;
							IF Internal.DepthArrayIdx[Internal.Depth-1] >= 0 THEN
								Internal.Pair.Name							:= DINT_TO_STRING(Internal.DepthArrayIdx[Internal.Depth-1]);
								Internal.DepthIDs[Internal.Depth]			:= Internal.Pair.Name;
								Internal.DepthArrayIdx[Internal.Depth-1] 	:= Internal.DepthArrayIdx[Internal.Depth-1] + 1;
								Internal.DepthArrayIdx[Internal.Depth]		:= -1;
								Internal.Pair.Value							:= '{';
								Internal.Send								:= TRUE;
							ELSE
								Internal.DepthIDs[Internal.Depth]			:= Internal.Pair.Name;
								Internal.DepthArrayIdx[Internal.Depth]		:= -1;
								Internal.Pair.Value							:= '{';
								Internal.Send								:= TRUE;
							END_IF;
						ELSE
							Error											:= TRUE;
							EXIT;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR('"')) >= 0 THEN 												// New Double Quote
						Internal.InQuote									:= TRUE;
						Internal.QuoteIsDouble								:= TRUE;
						Internal.Marker										:= Internal.i+1;
						IF Internal.DepthArrayIdx[Internal.Depth] >= 0 THEN
							Internal.Pair.Name								:= DINT_TO_STRING(Internal.DepthArrayIdx[Internal.Depth]);
							Internal.DepthArrayIdx[Internal.Depth] 			:= Internal.DepthArrayIdx[Internal.Depth] + 1;
							Internal.InValue								:= TRUE;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR('$'')) >= 0 THEN 											// New Single Quote
						Internal.InQuote									:= TRUE;
						Internal.QuoteIsDouble								:= FALSE;
						Internal.Marker										:= Internal.i+1;
						IF Internal.DepthArrayIdx[Internal.Depth] >= 0 THEN
							Internal.Pair.Name								:= DINT_TO_STRING(Internal.DepthArrayIdx[Internal.Depth]);
							Internal.DepthArrayIdx[Internal.Depth] 			:= Internal.DepthArrayIdx[Internal.Depth] + 1;
							Internal.InValue								:= TRUE;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR(':')) >= 0 THEN		
						// Value is next
						Internal.InValue									:= TRUE;
						Internal.Marker										:= Internal.i+1;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR(']')) >= 0 THEN
						IF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-1);
								END_IF;		
								Internal.i 									:= Internal.i-1; 							// Go back one step to hit the bracket close again.
								Internal.Send								:= TRUE;		
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						ELSE
							Internal.DepthArrayIdx[Internal.Depth]			:= -1;
							Internal.Pair.Name								:= Internal.DepthIDs[Internal.Depth];
							Internal.DepthIDs[Internal.Depth]				:= '';
							Internal.Pair.Value								:= ']';
							Internal.Send									:= TRUE;
							IF Internal.Depth = 0 THEN
								Error										:= TRUE;
								EXIT;
							ELSE
								Internal.Depth								:= Internal.Depth - 1;
							END_IF;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR('}')) >= 0 THEN
						IF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-1);
								END_IF;			
								Internal.i 									:= Internal.i-1; 							// Go back one step to hit the bracket close again.
								Internal.Send								:= TRUE;	
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						ELSE
							Internal.DepthArrayIdx[Internal.Depth]			:= -1;
							Internal.Pair.Name								:= Internal.DepthIDs[Internal.Depth];
							Internal.DepthIDs[Internal.Depth]				:= '';
							Internal.Pair.Value								:= '}';
							Internal.Send									:= TRUE;
							IF Internal.Depth = 0 THEN
								Error										:= TRUE;
								EXIT;
							ELSE
								Internal.Depth								:= Internal.Depth - 1;
							END_IF;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR(',')) >= 0 THEN
						IF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							Internal.Send 									:= TRUE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-1);
								END_IF;				
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						END_IF;
					ELSIF HA_Find_S(pBuffer+Internal.i,ADR(' ')) >= 0 OR HA_Find_S(pBuffer+Internal.i,ADR('	')) >= 0 OR HA_Find_S(pBuffer+Internal.i,ADR('$r')) >= 0 OR HA_Find_S(pBuffer+Internal.i,ADR('$n')) >= 0 THEN //Whitespace	
						IF NOT Internal.InValueNonWhiteFound THEN
							Internal.Marker									:= Internal.i+1;
						ELSIF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							Internal.InValueNonWhiteFound					:= FALSE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-1);
								END_IF;				
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
							Internal.Send 									:= TRUE;
						END_IF;
					ELSIF Internal.InValue OR Internal.DepthArrayIdx[Internal.Depth] >= 0 THEN
						Internal.InValue									:= TRUE;
						Internal.InValueNonWhiteFound						:= TRUE;
					END_IF;
				ELSIF Internal.QuoteIsDouble THEN 																		//Inside Double Quotes
					IF HA_Find_S(pBuffer+Internal.i,ADR('"')) >= 0 THEN
						IF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							Internal.Send 									:= TRUE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),ADR('"'),1);
									brsmemcpy(ADR(Internal.Pair.Value)+1,pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
									brsmemcpy(ADR(Internal.Pair.Value)+1+(Internal.i-Internal.Marker),ADR('"'),1);
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),ADR('"'),1);
									brsmemcpy(ADR(Internal.Pair.Value)+1,pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-3);
									brsmemcpy(ADR(Internal.Pair.Value)+SIZEOF(Internal.Pair.Value)-1,ADR('"'),1);
								END_IF;	
							ELSIF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) = Internal.i THEN
								brsmemcpy(ADR(Internal.Pair.Value),ADR('""'),2);
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						ELSE
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Name) THEN
									brsmemcpy(ADR(Internal.Pair.Name),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Name),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Name)-1);
								END_IF;				
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						END_IF;		
						Internal.InQuote 									:= FALSE;	
						Internal.QuoteIsDouble 								:= FALSE;
					END_IF;	
				ELSE 																									//Inside Single Quotes
					IF HA_Find_S(pBuffer+Internal.i,ADR('$'')) >= 0 THEN	
						IF Internal.InValue THEN
							Internal.InValue								:= FALSE;
							Internal.Send 									:= TRUE;
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Value) THEN
									brsmemcpy(ADR(Internal.Pair.Value),ADR('$''),1);
									brsmemcpy(ADR(Internal.Pair.Value)+1,pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
									brsmemcpy(ADR(Internal.Pair.Value)+1+(Internal.i-Internal.Marker),ADR('$''),1);
								ELSE
									brsmemcpy(ADR(Internal.Pair.Value),ADR('$''),1);
									brsmemcpy(ADR(Internal.Pair.Value)+1,pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Value)-3);
									brsmemcpy(ADR(Internal.Pair.Value)+SIZEOF(Internal.Pair.Value)-1,ADR('$''),1);
								END_IF;	
							ELSIF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) = Internal.i THEN
								brsmemcpy(ADR(Internal.Pair.Value),ADR('$'$''),2);		
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						ELSE
							IF Internal.i <> 0 AND UDINT_TO_DINT(Internal.Marker) < Internal.i THEN
								IF (Internal.i - UDINT_TO_DINT(Internal.Marker)) < SIZEOF(Internal.Pair.Name) THEN
									brsmemcpy(ADR(Internal.Pair.Name),pBuffer+Internal.Marker,(Internal.i-Internal.Marker));
								ELSE
									brsmemcpy(ADR(Internal.Pair.Name),pBuffer+Internal.Marker,SIZEOF(Internal.Pair.Name)-1);
								END_IF;				
							ELSE
								Error										:= TRUE;
								EXIT;
							END_IF;
						END_IF;	
						Internal.InQuote 									:= FALSE;	
						Internal.QuoteIsDouble 								:= FALSE;	
					END_IF;
				END_IF;
				IF Internal.Send THEN
					Internal.Send											:= FALSE;
					IF Internal.Idx >= 0 AND Internal.Idx <= MAX_JSON_PARSE_PAIR_IDX THEN
						brsmemcpy(pPairs+Internal.Idx*SIZEOF(Internal.Pair),ADR(Internal.Pair),SIZEOF(Internal.Pair));
						brsmemset(ADR(Internal.Pair),0,SIZEOF(Internal.Pair));
						Internal.InQuote									:= FALSE;
						Internal.InValue									:= FALSE;	
						Internal.InValueNonWhiteFound						:= FALSE;	
						Internal.Marker										:= 0;
						Internal.Idx										:= Internal.Idx + 1;
					ELSE
						Error												:= TRUE;
						EXIT;
					END_IF;
				END_IF;
			END_FOR;
			IF NOT Error THEN
				Done														:= TRUE;
			END_IF;
		END_IF;
	ELSE
		Done																:= FALSE;
		Error																:= FALSE;
		brsmemset(ADR(Internal),0,SIZEOF(Internal));
	END_IF;

END_FUNCTION_BLOCK
