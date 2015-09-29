capabilityHandling
obcsmTDPCriteriaList: list for: aHlr
	^ list addUsing: [ :item | 
		item
			at: 'o-BcsmTriggerDetectionPoint' put: 'collectedInfo' ]