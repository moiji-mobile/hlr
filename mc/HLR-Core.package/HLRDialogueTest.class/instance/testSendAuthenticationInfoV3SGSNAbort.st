tests-infoRetrievalPackage
testSendAuthenticationInfoV3SGSNAbort
	| operationName dialogue invoke wasAborted |
	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint createDialogue.
	dialogue
		onUAbort: [wasAborted := true].
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createAuthV3ParamsSGSN class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).
		

	self assert: wasAborted.