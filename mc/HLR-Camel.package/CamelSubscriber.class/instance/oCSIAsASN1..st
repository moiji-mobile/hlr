capabilityHandling
oCSIAsASN1: aHlr
	^ASN1Dictionary new
		at: 'o-BcsmCamelTDPDataList' put: (ASN1Array new
			add: (ASN1Dictionary new
				at: 'o-BcsmTriggerDetectionPoint' put: 'collectedInfo';
				at: 'serviceKey' put: 110;
				at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164;
				at: 'defaultCallHandling' put: 'releaseCall';
				yourself);
			yourself);
		at: 'camelCapabilityHandling' put: 3;
		yourself