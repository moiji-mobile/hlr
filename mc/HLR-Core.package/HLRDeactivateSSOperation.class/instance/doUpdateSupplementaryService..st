execution
doUpdateSupplementaryService: ssCode
	subscriber deactivateSupplementaryServiceForCode: ssCode.
	hlr database updateSubscriber: subscriber.
	
	self returnResult: ssCode