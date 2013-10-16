test-locationUpdatingPackage
testUpdateLocation
	| operationName dialogue invoke |
	operationName := 'updateLocation'.
	dialogue := testEndPoint createDialogue.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createUpdateLocationParams class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [ self halt ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)