barr-handling
testSendRoutingInfoV3CamelV1
	| operationName dialogue invoke sriArg err_name err_param |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'interrogationType' put: 'basicCall';
				at: 'gmsc-OrGsmSCF-Address' put: '1234' toE164;
				at: 'camelInfo' put: (ASN1Dictionary new
					at: 'supportedCamelPhases' put: '100000';
					yourself);
				yourself.

	testEndPoint
		onDialogue: [:diag | self assert: false].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err :par | err_name := err. err_param := par];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"This is camel phase 1. It lacks on-line charging so barr the call"
	self assert: err_name originalBindingName = 'callBarred'.
	self assert: err_param isNil.