test-locationUpdatingPackage
testUpdateGprsLocationNotFound
	| operationName dialogue invoke invoked param err_message operation |
	invoked := 0.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: '121212313213213' byteArrayFromHex;
		at: 'sgsn-Number' put: '6123';
		at: 'sgsn-Address' put: 'AABBCCDD';
		yourself.
	(param expandFieldNamed: 'sgsn-Capability')
		at: 'gprsEnhancementsSupportIndicator' put: nil.
		
	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: err_message parameter unknownSubscriberDiagnostic = 'imsiUnknown'.
	self assert: err_message error originalBindingName = 'unknownSubscriber'.
	self assert: invoked = 0.