tests-infoRetrievalPackage
testSendRoutingInfoForSMV2
	| operationName dialogue  invoke invokeResultMessage sriArg operation |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
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
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: invokeResultMessage resultObject imsi = subscriber imsiAsTBCD.
	self assert: subscriber messageWaitingSet isEmpty.