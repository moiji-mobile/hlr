tests-infoRetrievalPackage
testNonHLROperation
	| operationName dialogue abort invoke |
	

	operationName := 'sendIdentificationV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  #[1 2 3 4]
				class: 1 timeout: 500.
	dialogue
		onPAbort: [self assert: false];
		onUAbort: [:info | abort := info].
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: abort isNil.
	self assert: abort message reason u_abortCause dialogueAbort abort_source equals: 0.