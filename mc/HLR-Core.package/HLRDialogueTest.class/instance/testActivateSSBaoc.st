test-supplementary-services
testActivateSSBaoc
	|  dialogue  invoke invokeResult param invocations operation mapPdu acn |
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	
	acn := self applicationContextOidForOperationNamed: 'networkFunctionalSsContext-v2'.
	operation := self rosOperationNamed: 'activateSS'.
	
	param := self activateSSParam: operation ssCode: SSData callWaiting asByteArray..
	mapPdu := self mapOpenDestination:subscriber imsi toE212 origination: '0815' toE164.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 5.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result ].
	dialogue
		applicationContext: acn;
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		userInformation: { mapPdu }.
		
	self deny: invokeResult isNil.
	self assert: invocations = 2.