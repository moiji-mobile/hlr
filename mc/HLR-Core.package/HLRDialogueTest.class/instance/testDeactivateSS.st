test-locationUpdatingPackage
testDeactivateSS
	| operationName dialogue  invoke invokeResult param invocations |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData callWaiting asByteArray hex;
		at: 'basicService' put: (ASN1Dictionary new
					at: 'teleservice' put: '10';
					yourself);
		yourself.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	operationName := 'deactivateSS'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.
	self assert: invocations = 2.