tests-infoRetrievalPackage
testSendIMSI
	| operationName dialogue  invoke invokeResultMessage |
	

	operationName := 'sendIMSI'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  subscriber msisdnAsE164
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResultMessage := result ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: invokeResultMessage result = subscriber imsiAsTBCD asUppercase.