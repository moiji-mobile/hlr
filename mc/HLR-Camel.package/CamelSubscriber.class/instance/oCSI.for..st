capabilityHandling
oCSI: acsi for: aHlr
	^ acsi
		expandAt: 'o-BcsmCamelTDPDataList' using: [ :dataList | 
			dataList addUsing: [ :item | 
				item
					at: 'o-BcsmTriggerDetectionPoint' put: 'collectedInfo';
					at: 'serviceKey' put: 110;
					at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164;
					at: 'defaultCallHandling' put: 'releaseCall' ]];
		at: 'camelCapabilityHandling' put: 3;
		yourself