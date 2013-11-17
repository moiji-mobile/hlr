capabilityHandling
obcsmTDPCriteriaList: aHlr
	^ASN1Array new
		add: (ASN1Dictionary new
			at: 'o-BcsmTriggerDetectionPoint' put: 'collectedInfo';
			yourself);
		yourself
