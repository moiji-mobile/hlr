execution
doUpdateSupplementaryService: ssCode
	subscriber activateSupplementaryServiceForCode: ssCode.
	hlr database updateSubscriber: subscriber.
	
	self returnResult: ssCode.