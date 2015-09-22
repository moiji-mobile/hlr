test-locationUpdatingPackage
testReadyForSMV3
	| operationName dialogue invoke res param operation |
	operationName := 'readyForSMV3'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation argumentValue 
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'alertReason' put: 'ms-Present';
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
	self deny: subscriber isMobileStationNotReachable.