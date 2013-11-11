test-locationUpdatingPackage
testReadyForSMV2MemoryAvailable
	| operationName dialogue invoke res param |
	operationName := 'readyForSMV2'.
	dialogue := testEndPoint createDialogue.
	
	subscriber mobileStationNotPresent.
	self assert: subscriber mobileStationNotReachable.

	param := ASN1Dictionary new
				at: 'imsi' put: subscriber imsiAsTBCD;
				at: 'alertReason' put: 'memoryAvailable';
				yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res isNil.