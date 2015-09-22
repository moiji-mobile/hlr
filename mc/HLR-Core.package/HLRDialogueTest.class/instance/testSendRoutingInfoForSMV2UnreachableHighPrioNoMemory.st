tests-infoRetrievalPackage
testSendRoutingInfoForSMV2UnreachableHighPrioNoMemory
	| operationName dialogue  invoke invokeError sriArg mwStatus  operation |
	
	subscriber
		mscNumber: '123';
		memoryCapcacityExceeded;
		clearVlr.
	mwStatus := nil.

	self assert: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	sriArg := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: true;
		at: 'serviceCentreAddress' put: '912343' byteArrayFromHex;
		yourself.
		
	invoke := dialogue
				requestTcInvoke: operation
				parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | invokeError := err];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument mw_Status].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self deny: invokeError isNil.
	self assert: invokeError name equals: 'absentSubscriberV2'.
	self assert: (mwStatus includesBit: 'mnrf-Set').
	self deny: (mwStatus includesBit: 'mcef-Set').
	self assert: (subscriber messageWaitingSet anySatisfy: [:assoc |  assoc value asString= '3234'])