test-supplementary-services
testInterrogateSS
	| operationName dialogue  invoke invokeResult param operation dialoguePortion |
	
	subscriber
		vlrNumber: '1234'.

	operationName := 'interrogateSS'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue
		ss_Code: SSData callWaiting asByteArray.
	dialoguePortion := self mapOpenDestination:  subscriber imsi toE212 origination: '0815' toE164.
	
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)
		userInformation: { dialoguePortion }.
		
	self deny: invokeResult isNil.