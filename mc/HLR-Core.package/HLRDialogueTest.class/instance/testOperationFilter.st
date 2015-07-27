tests-infoRetrievalPackage
testOperationFilter
	| operationName dialogue  invoke invokeResultMessage aborted |

	testHlr operationFilter: #('sendIMSI').

	aborted := false.
	operationName := 'sendIMSI'.
	dialogue := testEndPoint newDialogue.
	dialogue onUAbort: [
		aborted := true].
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
	self assert: invokeResultMessage resultObject = subscriber imsiAsTBCD.
	self deny: aborted.


	"Set a different filter"
	testHlr operationFilter: #('sendIMSIBla').
	dialogue := testEndPoint newDialogue.
	dialogue onUAbort: [
		aborted := true].
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  subscriber msisdn toE164
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).
	self assert: aborted