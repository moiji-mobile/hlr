tests-infoRetrievalPackage
testSendIMSI
	| operationName dialogue  invoke invokeResultMessage |
	

	operationName := 'sendIMSI'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  subscriber msisdn toE164
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
	self assert: invokeResultMessage resultObject = subscriber imsiAsTBCD.

	"Check that the GT of the HLR has not been updated"
	self assert: dialogue transaction remoteAddress parseGlobalTitle isNil.