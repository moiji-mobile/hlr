test-locationUpdatingPackage
testUpdateGprsLocationError
	| operationName dialogue invoke invoked param aborted |
	invoked := 0.
	aborted := false.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint createDialogue.

	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnError: 'unexpectedDataValue' with: nil.
			dialogue requestTcContinue];
		onUAbort: [aborted := true].

	param := ASN1Dictionary new
				at: 'imsi' put: subscriber imsiAsTBCD;
				at: 'sgsn-Number' put: '9123';
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
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: invoked = 1.
	self assert: aborted.