test-supplementary-services
testDeactivateSSBaoc
	|  dialogue  invoke invokeResult param invocations acn operation dialoguePortion |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	
	acn := self applicationContextOidForOperationNamed: 'networkFunctionalSsContext-v2'.
	operation := self rosOperationNamed: 'deactivateSS'.
	param := self activateSSParam: operation ssCode: SSData barrAllOutgoingCalls asByteArray.
	dialoguePortion := self mapOpenDestination:subscriber imsi toE212 origination: '0815' toE164.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		applicationContext: acn;
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		userInformation: {  dialoguePortion }.
		
	self deny: invokeResult isNil.
	self assert: invocations = 2.