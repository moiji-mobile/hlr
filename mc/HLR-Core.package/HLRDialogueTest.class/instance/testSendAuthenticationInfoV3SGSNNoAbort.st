tests-infoRetrievalPackage
testSendAuthenticationInfoV3SGSNNoAbort
	| operationName dialogue invoke wasAborted |
	wasAborted := false.
	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint newDialogue.
	dialogue
		onUAbort: [wasAborted := true].
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createAuthV3ParamsSGSN class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).
		

	self deny: wasAborted.