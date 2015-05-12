tests-infoRetrievalPackage
testSendIMSIUpdateAddress
	| operationName dialogue  invoke invokeResultMessage |

	self deny: testHlr updateAddress.
	testHlr updateAddress: true.	

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

	"Verify the address of the transaction has changed"
	self assert: dialogue transaction remoteAddress parseGlobalTitle address equals: testHlr hlrNumber.