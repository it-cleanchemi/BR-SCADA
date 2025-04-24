
(* Adds the HA default module alarms to the given alarmxcore *)
FUNCTION_BLOCK HA_AlarmX_CfgModule

	WHILE internal.i < HA_MODULE_MAX_ALARM + 1 DO
	
		CASE internal.i OF 
		
			0: 
				internal.AlarmName														:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('UnhandledCmd'), SIZEOF(internal.AlarmName));
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR(internal.AlarmName), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 4;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;
			
			1: 
				internal.AlarmName															:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('Severity1'), SIZEOF(internal.AlarmName));							
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('Severity1'), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 1;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;
			
			2: 
				internal.AlarmName															:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('Severity2'), SIZEOF(internal.AlarmName));							
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('Severity2'), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 2;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;
				
			3: 
				internal.AlarmName															:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('Severity3'), SIZEOF(internal.AlarmName));							
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('Severity3'), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 3;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;

			4: 
				internal.AlarmName															:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('Severity4'), SIZEOF(internal.AlarmName));							
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('Severity4'), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 4;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;

			5: 
				internal.AlarmName															:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('Severity5'), SIZEOF(internal.AlarmName));							
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('Severity5'), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix;
				internal.AlarmCfg.Severity												:= 5;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;
												
			6: 
				internal.AlarmName														:= Prefix;
				HA_brsstrcat(ADR(internal.AlarmName), ADR('CmdIgnored'), SIZEOF(internal.AlarmName));
				internal.AlarmCfg.Message												:= '{$$IAT/Alarm.';
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR(internal.AlarmName), SIZEOF(internal.AlarmCfg.Message));
				HA_brsstrcat(ADR(internal.AlarmCfg.Message), ADR('}'), SIZEOF(internal.AlarmCfg.Message));
				internal.AlarmCfg.Code													:= CodePrefix + 6;
				internal.AlarmCfg.Severity												:= 0;
				internal.AlarmCfg.Behavior.AutoReset									:= TRUE;
				internal.AlarmCfg.Behavior.Acknowledge 									:= mpALARMX_ACK_REQ;
				internal.AlarmCfg.Behavior.MultipleInstances 							:= TRUE;
				internal.AlarmCfg.Behavior.ReactionUntilAcknowledged					:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.InactiveToActive 				:= TRUE;
				internal.AlarmCfg.Behavior.HistoryReport.UnacknowledgedToAcknowledged	:= TRUE;

		END_CASE
		
		internal.MpAlarmXConfigAlarm_0.MpLink			:= MpLink;
		internal.MpAlarmXConfigAlarm_0.Enable			:= TRUE;
		internal.MpAlarmXConfigAlarm_0.Name				:= ADR(internal.AlarmName);
		internal.MpAlarmXConfigAlarm_0.Configuration	:= ADR(internal.AlarmCfg);
		internal.MpAlarmXConfigAlarm_0.Save				:= TRUE;
		
		IF internal.MpAlarmXConfigAlarm_0.CommandDone THEN
			internal.i := internal.i + 1;
			internal.MpAlarmXConfigAlarm_0.Save := FALSE;
		ELSIF internal.MpAlarmXConfigAlarm_0.Error THEN
			Error	:= TRUE;
			RETURN;
		END_IF;
		
		internal.MpAlarmXConfigAlarm_0();
	END_WHILE
	
	
END_FUNCTION_BLOCK
