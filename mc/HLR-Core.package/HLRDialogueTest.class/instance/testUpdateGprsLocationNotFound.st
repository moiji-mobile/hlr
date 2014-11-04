test-locationUpdatingPackage
testUpdateGprsLocationNotFound
	| operationName dialogue invoke invoked param err_message |
	invoked := 0.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint newDialogue.

	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	param := ASN1Dictionary new
				at: 'imsi' put: '121212313213213' byteArrayFromHex;
				at: 'sgsn-Number' put: '6123';
				at: 'sgsn-Address' put: 'AABBCCDD';
				at: 'sgsn-Capability' put: (ASN1Dictionary new
						at: 'gprsEnhancementsSupportIndicator' put: #null;
						yourself);
				yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: err_message parameter isNil.
	self assert: err_message error originalBindingName = 'unknownSubscriber'.
	self assert: invoked = 0.