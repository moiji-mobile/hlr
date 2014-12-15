test-locationUpdatingPackage
testUpdateGprsLocationWithCancelLocation
	| operationName dialogue invoke res invoked param receivedCancel |
	invoked := 0.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint newDialogue.

	subscriber
		sgsnNumber: '91555555'.

	receivedCancel := false.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				receivedCancel := true.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].

	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	param := ASN1Dictionary new
				at: 'imsi' put: subscriber imsiAsTBCD;
				at: 'sgsn-Number' put: '9123' byteArrayFromHex;
				at: 'sgsn-Address' put: 'AABBCCDD';
				at: 'sgsn-Capability' put: (ASN1Dictionary new
						at: 'gprsEnhancementsSupportIndicator' put: nil asAsn1Value;
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
	self assert: subscriber sgsnNumber = '32'.
	self assert: receivedCancel.