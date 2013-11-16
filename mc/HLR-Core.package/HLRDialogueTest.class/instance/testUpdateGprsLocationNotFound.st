test-locationUpdatingPackage
testUpdateGprsLocationNotFound
	| operationName dialogue invoke invoked param err_name err_data |
	invoked := 0.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint createDialogue.

	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	param := ASN1Dictionary new
				at: 'imsi' put: '121212313213213';
				at: 'sgsn-Number' put: '6123';
				at: 'sgsn-Address' put: 'AABBCCDD';
				at: 'sgsn-Capability' put: (ASN1Dictionary new
						at: 'gprsEnhancementsSupportIndicator' put: #null;
						yourself);
				yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err :par | err_name := err. err_data := par];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: err_data isNil.
	self assert: err_name originalBindingName = 'unknownSubscriber'.
	self assert: invoked = 0.