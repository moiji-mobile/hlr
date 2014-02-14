tests-infoRetrievalPackage
testSendIMSINotFound
	| operationName dialogue  invoke err_message |
	

	operationName := 'sendIMSI'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  '999F'
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_message error originalBindingName = 'unknownSubscriber'.
	self assert: err_message parameter isNil.