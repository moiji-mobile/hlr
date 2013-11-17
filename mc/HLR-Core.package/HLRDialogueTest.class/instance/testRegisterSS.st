test-supplementary-services
testRegisterSS
	| operationName dialogue  invoke invokeResult param invocations |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData callForwardingUnconditional asByteArray hex;
		at: 'basicService' put: (ASN1Dictionary new
					at: 'teleservice' put: '10';
					yourself);
		at: 'forwardedToNumber' put: '1234' toE164;
		yourself.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	operationName := 'registerSS'.
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
	self assert: (subscriber supplementaryServiceStateFor: SSData callForwardingUnconditional) forwardedToNumber = '1234'.