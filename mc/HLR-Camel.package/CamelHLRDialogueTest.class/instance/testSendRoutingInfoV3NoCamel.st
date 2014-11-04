barr-handling
testSendRoutingInfoV3NoCamel
	| operationName dialogue invoke sriArg err_message  |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'interrogationType' put: 'basicCall';
				at: 'gmsc-OrGsmSCF-Address' put: '123' toE164;
				yourself.

	testEndPoint
		onDialogue: [:diag | self assert: false].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage  | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_message error originalBindingName = 'callBarred'.
	self assert: err_message parameter isNil.