test-locationUpdatingPackage
testReadyForSMV2MemoryAvailable
	| operationName dialogue invoke res param operation |
	operationName := 'readyForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue 
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'alertReason' put: 'memoryAvailable';
		yourself.
	
	subscriber mobileStationNotPresent.
	self assert: subscriber isMobileStationNotReachable.

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
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