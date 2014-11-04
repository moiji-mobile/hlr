test-locationUpdatingPackage
testReadyForSMV3MemoryAvailable
	| operationName dialogue invoke res param |
	operationName := 'readyForSMV3'.
	dialogue := testEndPoint newDialogue.
	
	subscriber mobileStationNotPresent.
	self assert: subscriber isMobileStationNotReachable.

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