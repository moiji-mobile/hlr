tests-infoRetrievalPackage
testSendAuthenticationInfoV3
	| operationName dialogue invoke invokeResponse operation param |
	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  (self createAuthV3ParamsOn: param) class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResponse := result resultObject authenticationSetList tripletList ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).
		

	self assert: invokeResponse size = 4.