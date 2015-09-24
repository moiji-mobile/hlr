barr-handling
testSendRoutingInfoV2NoCamel
	| operationName dialogue invoke  err_message  operation param |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	testEndPoint
		onDialogue: [:diag | self assert: false].

	operationName := 'sendRoutingInfoV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		yourself.

	invoke := dialogue
				requestTcInvokeNamed: operationName parameters: param
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage :par | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_message error originalBindingName = 'callBarred'.
	self assert: err_message parameter isNil.