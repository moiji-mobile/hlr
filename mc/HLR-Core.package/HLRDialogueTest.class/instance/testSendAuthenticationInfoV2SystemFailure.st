tests-infoRetrievalPackage
testSendAuthenticationInfoV2SystemFailure
	| operationName dialogue  invoke errorResult |

	testHlr database forceSystemFailure.	

	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self imsi class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | errorResult := err];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: errorResult isNil.
	self assert: errorResult errorCode equals: 34.