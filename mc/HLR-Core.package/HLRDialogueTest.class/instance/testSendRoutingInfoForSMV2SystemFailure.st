tests-infoRetrievalPackage
testSendRoutingInfoForSMV2SystemFailure
	| operationName dialogue  invoke  sriArg errorResult |

	subscriber
		mscNumber: '123';
		vlrNumber: '456'.
	
	testHlr	database forceSystemFailure.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdn toE164;
				at: 'sm-RP-PRI' put: false;
				at: 'serviceCentreAddress' put: '912343';
				yourself.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
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