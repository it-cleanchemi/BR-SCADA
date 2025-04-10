
// This function only supports a single USB flash drive, additional will be ignored.
// When connected the USB can be accessed using Dev Name 'USB_DEVICE'

FUNCTION_BLOCK HA_Dir_USB_Connect
			   
	IF enable = FALSE OR reset THEN
		Internal.State											:= USB_CONNECT_RESET;
	END_IF;

	CASE Internal.State OF
		USB_CONNECT_RESET:
			status												:= 65534;
			brsmemset(ADR(Internal),0,SIZEOF(Internal));
			connected											:= FALSE;
			Internal.State										:= USB_CONNECT_IDLE;
		USB_CONNECT_IDLE:
			status												:= 65534;
			IF enable THEN
				status											:= 65535;
				Internal.State									:= USB_CONNECT_GET_LIST_CMD;
			END_IF;
		USB_CONNECT_GET_LIST_CMD:
			status												:= 65535;
			Internal.UsbNodeListGet_0.enable 					:= TRUE;
			Internal.UsbNodeListGet_0.pBuffer 					:= ADR(Internal.NodeList);
			Internal.UsbNodeListGet_0.bufferSize 				:= SIZEOF(Internal.NodeList);
			Internal.UsbNodeListGet_0.filterInterfaceClass 		:= 8; // FIND ONLY USB FLASH DRIVES
			Internal.UsbNodeListGet_0.filterInterfaceSubClass 	:= 6; // FIND ONLY USB FLASH DRIVES
			Internal.State 										:= USB_CONNECT_GET_LIST_WAIT;
		USB_CONNECT_GET_LIST_WAIT:
			status												:= 65535;
			IF Internal.UsbNodeListGet_0.status = 0 THEN
				Internal.UsbNodeListGet_0.enable 				:= FALSE;
				Internal.State 									:= USB_CONNECT_GET_NODE_CMD;
			ELSIF Internal.UsbNodeListGet_0.status <> ERR_FUB_BUSY AND Internal.UsbNodeListGet_0.status <> ERR_FUB_ENABLE_FALSE THEN
				IF Internal.UsbNodeListGet_0.status <> asusbERR_USB_NOTFOUND THEN
					Internal.UsbNodeListGet_0.enable 			:= FALSE;
					status										:= Internal.UsbNodeListGet_0.status;
					Internal.State 								:= USB_CONNECT_ERROR;
				ELSE
					Internal.UsbNodeListGet_0.enable 			:= FALSE;
					Internal.State 								:= USB_CONNECT_DELAY;
				END_IF;
			END_IF;
		USB_CONNECT_GET_NODE_CMD:
			status												:= 65535;
			Internal.UsbNodeGet_0.enable 						:= TRUE;
			Internal.UsbNodeGet_0.pBuffer 						:= ADR(Internal.Node);
			Internal.UsbNodeGet_0.bufferSize 					:= SIZEOF(Internal.Node);
			Internal.UsbNodeGet_0.nodeId 						:= Internal.NodeList;
			Internal.State 										:= USB_CONNECT_GET_NODE_WAIT;
		USB_CONNECT_GET_NODE_WAIT:
			status												:= 65535;
			IF Internal.UsbNodeGet_0.status = 0 THEN
				Internal.UsbNodeGet_0.enable 					:= FALSE;
				brsmemset(ADR(Internal.ParString),0,SIZEOF(Internal.ParString));
				brsstrcat(ADR(Internal.ParString),ADR('/DEVICE='));	
				brsstrcat(ADR(Internal.ParString), ADR(Internal.Node.ifName));
				Internal.State 									:= USB_CONNECT_DEVLINK_CMD;
			ELSIF Internal.UsbNodeGet_0.status <> ERR_FUB_BUSY AND Internal.UsbNodeGet_0.status <> ERR_FUB_ENABLE_FALSE THEN
				IF Internal.UsbNodeGet_0.status <> asusbERR_USB_NOTFOUND THEN
					Internal.UsbNodeGet_0.enable 				:= FALSE;
					status										:= Internal.UsbNodeGet_0.status;
					Internal.State 								:= USB_CONNECT_ERROR;
				ELSE
					Internal.UsbNodeGet_0.enable 				:= FALSE;
					Internal.State 								:= USB_CONNECT_DELAY;
				END_IF;
			END_IF;
		USB_CONNECT_DEVLINK_CMD:
			status												:= 65535;
			Internal.DevLink_0.enable 							:= TRUE;
			Internal.DevLink_0.pDevice 							:= ADR('USB_DEVICE');
			Internal.DevLink_0.pParam 							:= ADR(Internal.ParString);
			Internal.State 										:= USB_CONNECT_DEVLINK_WAIT;
		USB_CONNECT_DEVLINK_WAIT:
			status												:= 65535;
			IF Internal.DevLink_0.status = 0 THEN
				Internal.DevLink_0.enable 						:= FALSE;
				Internal.Handle									:= Internal.DevLink_0.handle;
				connected										:= FALSE;
				Internal.State 									:= USB_CONNECT_CHECK_CONNECTED;
			ELSIF Internal.DevLink_0.status <> ERR_FUB_BUSY AND Internal.DevLink_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.DevLink_0.enable 						:= FALSE;
				Internal.State 									:= USB_CONNECT_DEVUNLINK_CMD;
			END_IF;
		USB_CONNECT_CHECK_CONNECTED:
			status												:= 65535;
			Internal.UsbMsDeviceReady_0.enable					:= TRUE;
			Internal.UsbMsDeviceReady_0.pIfName					:= ADR(Internal.Node.ifName);
			Internal.State 										:= USB_CONNECT_CONNECTED;
		USB_CONNECT_CONNECTED:
			status												:= 65535;
			IF Internal.UsbMsDeviceReady_0.status = 0 THEN
				connected										:= TRUE;
				Internal.UsbMsDeviceReady_0.enable 				:= FALSE;
				Internal.State 									:= USB_CONNECT_CHECK_CONNECTED;
			ELSIF Internal.UsbMsDeviceReady_0.status <> ERR_FUB_BUSY AND Internal.UsbMsDeviceReady_0.status <> ERR_FUB_ENABLE_FALSE THEN
				Internal.UsbMsDeviceReady_0.enable 				:= FALSE;
				Internal.State 									:= USB_CONNECT_DEVUNLINK_CMD;
			END_IF;
		USB_CONNECT_DEVUNLINK_CMD:
			status												:= 65535;
			Internal.DevUnlink_0.enable 						:= TRUE;
			Internal.DevUnlink_0.handle 						:= Internal.Handle;
			Internal.State 										:= USB_CONNECT_DEVUNLINK_WAIT;
		USB_CONNECT_DEVUNLINK_WAIT:
			status												:= 65535;
			IF Internal.DevUnlink_0.status = 0 OR (Internal.DevUnlink_0.status <> ERR_FUB_BUSY AND Internal.DevUnlink_0.status <> ERR_FUB_ENABLE_FALSE) THEN
				Internal.DevUnlink_0.enable 					:= FALSE;
				Internal.State 									:= USB_CONNECT_DELAY;
			END_IF;
		USB_CONNECT_DELAY:
			status												:= 65535;
			IF Internal.CTON_Delay.Q OR refresh THEN
				refresh 										:= FALSE;
				Internal.CTON_Delay(IN := FALSE);
				Internal.State 									:= USB_CONNECT_GET_LIST_CMD;
			ELSE
				Internal.CTON_Delay(IN := TRUE, PT := REAL_TO_TIME(delay*1000.0));
			END_IF;
 		USB_CONNECT_ERROR:
			connected 											:= FALSE;
	END_CASE;

	Internal.UsbNodeListGet_0();
	Internal.UsbNodeGet_0();
	Internal.DevLink_0();
	Internal.UsbMsDeviceReady_0();
	Internal.DevUnlink_0();

	IF connected THEN
		status													:= 0;
	END_IF;

END_FUNCTION_BLOCK
