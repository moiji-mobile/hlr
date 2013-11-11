test-locationUpdatingPackage
testReadyForSMV2
	| operationName dialogue invoke res param |
	operationName := 'readyForSMV2'.
	dialogue := testEndPoint createDialogue.
	
	subscriber mobileStationNotPresent.
	self assert: subscriber isMobileStationNotReachable.

	param := ASN1Dictionary new
				at: 'imsi' put: subscriber imsiAsTBCD;
				at: 'alertReason' put: 'ms-Present';
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
	self deny: subscriber isMobileStationNotReachable.