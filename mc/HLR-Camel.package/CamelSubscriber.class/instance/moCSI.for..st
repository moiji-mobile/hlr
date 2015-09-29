capabilityHandling
moCSI: mocsi for: aHlr
	^ mocsi
		expandAt: 'sms-CAMEL-TDP-DataList' using: [ :list |
			list addUsing: [ :item | 
				item
					at: 'sms-TriggerDetectionPoint' put: 'sms-CollectedInfo';
					at: 'serviceKey' put: 0;
					at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164;
					at: 'defaultSMS-Handling' put: 'continueTransaction' ]];
		at: 'camelCapabilityHandling' put: 3;
		yourself