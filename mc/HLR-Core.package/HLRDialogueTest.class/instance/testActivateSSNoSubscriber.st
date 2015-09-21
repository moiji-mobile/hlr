test-supplementary-services
testActivateSSNoSubscriber
	|  dialogue  invoke error param acn operation dialoguePortion |
	
	acn := self applicationContextNamed: 'networkFunctionalSsContext-v2'.
	operation := self rosOperationNamed: 'activateSS'.
	
	param := self activateSSParam: operation ssCode: SSData callWaiting asByteArray.
	dialoguePortion := self mapOpenDestination: '666666666666' toE212 origination: '0815' toE164.
	
	testEndPoint
		onDialogue: [:diag |
			self assert: false].

	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 5.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | error := err];
		onReject: [self assert: false];
		onReturnLast: [:result |  self assert: false].
	dialogue
		applicationContext: acn;
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		userInformation: { dialoguePortion }.

	self deny: error isNil.
	self assert: error name equals: 'unexpectedDataValue'.