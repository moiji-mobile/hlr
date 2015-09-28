barr-handling
testSendRoutingInfoV3CamelV1
	| operationName dialogue invoke  err_message  operation param |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	testEndPoint
		onDialogue: [:diag | self assert: false].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'interrogationType' put: 'basicCall';
		at: 'gmsc-OrGsmSCF-Address' put: '1234' toE164;
		expandAt: 'camelInfo' using: [ :item | 
			item at: 'supportedCamelPhases' put: '0001' ];
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

	"This is camel phase 1. It lacks on-line charging so barr the call"
	self assert: err_message error originalBindingName = 'callBarred'.
	self assert: err_message parameter isNil.