
{REDUND_ERROR} FUNCTION HA_Array_PeekTop : INT (*Peeks at the top index of an array without removing it*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		sizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
	VAR
		emptyData : ARRAY[0..HA_ARRAY_MAXELEMENTSIZE] OF USINT;
		i : UDINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_AddTop : INT (*Adds the first index of an array*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		SizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_AddBottom : BOOL (*Removes the last index of an array*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		SizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_PeekBtm : INT (*Copies the last index in an array to the output without removing it*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		sizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
	VAR
		emptyData : ARRAY[0..HA_ARRAY_MAXELEMENTSIZE] OF USINT;
		i : DINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_Pop : INT (*Pops the top index out of the array into out variable*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		sizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
	VAR
		emptyData : ARRAY[0..HA_ARRAY_MAXELEMENTSIZE] OF USINT;
		i : UDINT;
		nextSpot : UDINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_Dequeue : INT (*Dequeues the last index in an array to the output*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		sizeBuffer : UDINT;
		pElement : UDINT;
		SizeElement : UDINT;
	END_VAR
	VAR
		emptyData : ARRAY[0..HA_ARRAY_MAXELEMENTSIZE] OF USINT;
		i : DINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION HA_Array_Pack : INT (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pBuffer : UDINT;
		sizeBuffer : UDINT;
		SizeElement : UDINT;
	END_VAR
	VAR
		emptyData : ARRAY[0..HA_ARRAY_MAXELEMENTSIZE] OF USINT;
		i : UDINT;
		dataFound : UDINT;
	END_VAR
END_FUNCTION
