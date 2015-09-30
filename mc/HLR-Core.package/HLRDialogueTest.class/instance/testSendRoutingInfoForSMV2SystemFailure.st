tests-infoRetrievalPackage
testSendRoutingInfoForSMV2SystemFailure
	| operationName dialogue  invoke  sriArg errorResult operation |

	subscriber
		mscNumber: '123';
		vlrNumber: '456'.
	
	testHlr	database forceSystemFailure.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	sriArg := operation newArgumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: false;
		at: 'serviceCentreAddress' put: '912343';
		yourself.
		
	invoke := dialogue
				requestTcInvoke: operation 
				parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | errorResult := err];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).


	self deny: errorResult isNil.
	self assert: errorResult errorCode equals: 34.