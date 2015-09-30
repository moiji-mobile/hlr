test-locationUpdatingPackage
testRestoreData
	| operationName dialogue  invoke invoked invokeResult param operation |
	
	invoked := 0.

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	
	operationName := 'restoreData'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: subscriber imsiAsTBCD;
		yourself.

	"We expect insertSubscriberData. Continue for now"
	dialogue
		onInvoke: [ :insert |
			invoked := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: invoked = 2.
	self assert: invokeResult.