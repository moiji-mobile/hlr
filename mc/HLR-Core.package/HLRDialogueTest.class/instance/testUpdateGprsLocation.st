test-locationUpdatingPackage
testUpdateGprsLocation
	| operationName dialogue invoke res invoked param |
	invoked := 0.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint createDialogue.

	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	param := ASN1Dictionary new
				at: 'imsi' put: subscriber imsiAsTBCD;
				at: 'sgsn-Number' put: '6123';
				at: 'sgsn-Address' put: 'AABBCCDD';
				at: 'sgsn-Capability' put: (ASN1Dictionary new
						at: 'gprsEnhancementsSupportIndicator' put: #null;
						yourself);
				yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res.
	self assert: invoked = 1.