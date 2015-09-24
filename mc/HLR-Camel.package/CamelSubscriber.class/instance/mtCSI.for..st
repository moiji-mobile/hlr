as yet unclassified
mtCSI: tcsi for: aHlr
	^ tcsi 
		expandAt: 't-BcsmCamelTDPDataList' using: [ :list |
			list addUsing: [ :item | 
				item 
					at: 't-BcsmTriggerDetectionPoint' put: 'termAttemptAuthorized';
					at: 'serviceKey' put: 0;
					at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164;
					at: 'defaultCallHandling' put: 'releaseCall' ] ];
		at: 'camelCapabilityHandling' put: 2;
		yourself