tests-infoRetrievalPackage
testSendAuthenticationInfoV2NotFound
	| operationName dialogue  invoke err_message |
	
	"Test that searching a subscriber failed and an error is returned."
	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  '12345678' class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny:  err_message error isNil.
	self assert: err_message error originalBindingName = 'unknownSubscriber'.
	self assert: err_message parameter unknownSubscriberDiagnostic = 'imsiUnknown'.