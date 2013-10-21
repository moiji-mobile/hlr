tests-infoRetrievalPackage
testSendAuthenticationInfoV2NotFound
	| operationName dialogue  invoke err |
	
	"Test that searching a subscriber failed and an error is returned."
	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  '12345678' class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:param | err := param];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: err isNil.
	self assert: err = 'TODO...'.