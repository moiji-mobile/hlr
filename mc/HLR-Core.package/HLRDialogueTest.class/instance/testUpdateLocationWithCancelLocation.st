test-locationUpdatingPackage
testUpdateLocationWithCancelLocation
	| operationName dialogue invoke res receivedCancel |
	operationName := 'updateLocation'.
	dialogue := testEndPoint createDialogue.
	
	receivedCancel := false.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				receivedCancel := true.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].

	subscriber
		vlrNumber: '91111111';
		mscNumber:  '91222222'.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createUpdateLocationParams class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:param | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res.
	self assert: receivedCancel.
	self deny: subscriber isMobileStationNotReachable.