tests-infoRetrievalPackage
testSendAuthenticationInfoV3Milenage
	| operationName dialogue invoke invokeResponse |

	subscriber credentials: (SubscriberMilenageCredentials new
		sqn: 16rFFFFFFFFFFE0;
		opc: (ByteArray new: 16);
		ki: (ByteArray new: 16);
		yourself).
	self assert: subscriber credentials assembleSqn equals: 16rFFFFFFFFFFE0.

	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createAuthV3Params class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResponse := result resultObject authenticationSetList quintupletList ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).
		

	self assert: invokeResponse size = 1.
	self assert: subscriber credentials seq equals: 0.
	self assert: subscriber credentials ind equals: 0.
	self assert: subscriber credentials assembleSqn equals: 0.

	subscriber credentials incrementSeq.
	self assert: subscriber credentials seq equals: 1.
	self assert: subscriber credentials ind equals: 0.
	self assert: subscriber credentials assembleSqn equals: 32.	