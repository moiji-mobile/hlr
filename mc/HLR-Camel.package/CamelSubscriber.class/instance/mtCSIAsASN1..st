as yet unclassified
mtCSIAsASN1: aHlr
	^ASN1Dictionary new
		at: 't-BcsmCamelTDPDataList' put: (ASN1Array new
			add: (ASN1Dictionary new
				at: 't-BcsmTriggerDetectionPoint' put: 'termAttemptAuthorized';
				at: 'serviceKey' put: 0;
				at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164;
				at: 'defaultCallHandling' put: 'releaseCall';
				yourself);
			yourself);
		at: 'camelCapabilityHandling' put: 2;
		yourself