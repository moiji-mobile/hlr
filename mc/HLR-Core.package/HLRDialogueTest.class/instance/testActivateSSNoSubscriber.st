test-supplementary-services
testActivateSSNoSubscriber
	| operationName dialogue  invoke error param |
	
	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData callWaiting asByteArray;
		at: 'basicService' put: (ASN1Dictionary new
					at: 'teleservice' put: #[16r10];
					yourself);
		yourself.

	testEndPoint
		onDialogue: [:diag |
			self assert: false].

	operationName := 'activateSS'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 5.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | error := err];
		onReject: [self assert: false];
		onReturnLast: [:result |  self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)
		userInformation: (ASN1Array new 
			add: (
				ASN1Dictionary new
					at: 'map-open' put: (ASN1Dictionary new
						at: 'destinationReference' put: '666666666666' toE212;
						at: 'originationReference' put: '0815' toE164;
						yourself);
					at: 'oid' put: '0.4.0.0.1.1.1.1';
					yourself); 
			yourself).

	self deny: error isNil.
	self assert: error name equals: 'unexpectedDataValue'.