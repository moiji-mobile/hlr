capabilityHandling
moCSIAsASN1: aHlr
	^ASN1Dictionary new
		at: 'sms-CAMEL-TDP-DataList' put: (ASN1Array new
			add: (ASN1Dictionary new
				at: 'sms-TriggerDetectionPoint' put: 'sms-CollectedInfo';
				at: 'serviceKey' put: 0;
				at: 'gsmSCF-Address' put: aHlr gsmSCFAddress toE164;
				at: 'defaultSMS-Handling' put: 'continueTransaction';
				yourself);
			yourself);
		at: 'camelCapabilityHandling' put: 3;
		yourself