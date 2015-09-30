test-locationUpdatingPackage
testUpdateGprsLocationError
	| operationName dialogue invoke invoked param aborted operation |
	invoked := 0.
	aborted := false.
	operationName := 'updateGprsLocation'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'sgsn-Number' put: '9123';
		at: 'sgsn-Address' put: 'AABBCCDD';
		yourself.
	(param expandFieldNamed: 'sgsn-Capability')
		at: 'gprsEnhancementsSupportIndicator' put: nil.
		
	dialogue
		onInvoke: [ :insert |
			invoked  := invoked + 1.
			insert returnErrorNamed: 'unexpectedDataValue'.
			dialogue requestTcContinue];
		onUAbort: [aborted := true].

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
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