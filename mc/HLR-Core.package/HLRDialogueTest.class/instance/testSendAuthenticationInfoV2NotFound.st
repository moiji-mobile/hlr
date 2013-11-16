tests-infoRetrievalPackage
testSendAuthenticationInfoV2NotFound
	| operationName dialogue  invoke err_data err_name |
	
	"Test that searching a subscriber failed and an error is returned."
	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  '12345678' class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:name :err | err_name := name. err_data := err];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny:  err_name isNil.
	self assert: err_name originalBindingName = 'unknownSubscriber'.
	self assert: err_data isNil.