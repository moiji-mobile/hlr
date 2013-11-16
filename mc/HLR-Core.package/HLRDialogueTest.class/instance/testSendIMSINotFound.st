tests-infoRetrievalPackage
testSendIMSINotFound
	| operationName dialogue  invoke err_name err_data |
	

	operationName := 'sendIMSI'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  '999F'
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err :param | err_name := err. err_data := param];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_name originalBindingName = 'unknownSubscriber'.
	self assert: err_data isNil.