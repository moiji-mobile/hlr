tests-infoRetrievalPackage
testSendAuthenticationInfoV2
	| operationName dialogue  invoke |
	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self imsi class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [ self halt ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)