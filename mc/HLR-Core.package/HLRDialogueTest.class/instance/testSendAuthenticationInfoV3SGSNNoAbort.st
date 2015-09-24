tests-infoRetrievalPackage
testSendAuthenticationInfoV3SGSNNoAbort
	| operationName dialogue invoke wasAborted operation param |
	wasAborted := false.
	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue.
	dialogue
		onUAbort: [wasAborted := true].
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  (self createAuthV3ParamsSGSN: param) class: 1 timeout: 500.
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