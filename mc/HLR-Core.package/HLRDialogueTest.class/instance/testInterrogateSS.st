test-supplementary-services
testInterrogateSS
	| operationName dialogue  invoke invokeResult param |
	
	subscriber
		vlrNumber: '1234'.

	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData callWaiting asByteArray;
		yourself.

	operationName := 'interrogateSS'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.