execution
doUpdateSupplementaryService: ssCode
	"Special handling for some SS that includes several types at once..."
	ssCode = SSData allCallRestriction
		ifTrue: [^self deactivateAllCallRestriction].

	subscriber deactivateSupplementaryServiceForCode: ssCode.
	hlr database updateSubscriber: subscriber.
	
	self returnResult: ssCode