test-locationUpdatingPackage
testUpdateLocationMWDError
	| operationName dialogue invoke res receivedAlert |
	operationName := 'updateLocation'.
	
	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				receivedAlert := true.
				invocation returnError: nil.
				diag requestTcEnd: false]].
	
	dialogue := testEndPoint createDialogue.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	subscriber addToMessageWaitingList: '2342'.

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
	self deny: subscriber isMobileStationNotReachable.
	self assert: receivedAlert.
	self deny: subscriber messageWaitingSet isEmpty.