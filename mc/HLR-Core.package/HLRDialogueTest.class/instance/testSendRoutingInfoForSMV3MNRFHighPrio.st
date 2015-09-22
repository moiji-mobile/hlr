tests-infoRetrievalPackage
testSendRoutingInfoForSMV3MNRFHighPrio
	| operationName dialogue  invoke invokeResultMessage sriArg mwStatus  operation |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456';
		memoryCapcacityExceeded;
		mobileStationNotPresent.
	invokeResultMessage := 23.
	mwStatus := nil.

	self assert: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	sriArg := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: false;
		at: 'serviceCentreAddress' put: '912343';
		yourself.
	invoke := dialogue
				requestTcInvoke: operation parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResultMessage := result ].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument mw_Status].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self deny: invokeResultMessage result isNil.
	self assert: (mwStatus includesBit: 'sc-AddressNotIncluded').
	self assert: (mwStatus includesBit: 'mnrf-Set').
	self assert: (mwStatus includesBit: 'mcef-Set').
	self assert: subscriber messageWaitingSet isEmpty