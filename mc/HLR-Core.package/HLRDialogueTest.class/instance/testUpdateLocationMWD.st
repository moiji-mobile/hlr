test-locationUpdatingPackage
testUpdateLocationMWD
	| operationName dialogue invoke res receivedAlert |
	operationName := 'updateLocation'.
	
	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				receivedAlert := true.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].
	
	dialogue := testEndPoint newDialogue.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	subscriber addToMessageWaitingList: '2342' gateway: self localAddr.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createUpdateLocationParams class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:param | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: '0.4.0.0.1.0.1.3' asAsn1Oid.

	self assert: res.
	self deny: subscriber isMobileStationNotReachable.
	self assert: receivedAlert.
	self assert: subscriber messageWaitingSet isEmpty.