tests-infoRetrievalPackage
testSendRoutingInfoV3
	| operationName dialogue  invoke invokeResult sriArg |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				yourself.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocation returnResultLast: (ASN1Dictionary new
						at: 'roamingNumber' put: '10123';
						yourself).
				diag requestTcEnd: false]].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: invokeResult extendedRoutingInfo roamingNumber = '10123'.