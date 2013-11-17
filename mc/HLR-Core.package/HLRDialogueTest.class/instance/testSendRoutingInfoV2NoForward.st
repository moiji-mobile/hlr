tests-infoRetrievalPackage
testSendRoutingInfoV2NoForward
	| operationName dialogue  invoke sriArg err_name err_data |
	
	"Test that lack of vlrNumber/mscNumber/forwardingNumber will fail"
	subscriber
		vlrNumber: nil;
		mscNumber: nil.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				yourself.

	operationName := 'sendRoutingInfoV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
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

	"Verify things have failed"
	self assert: err_data isNil.
	self assert: err_name originalBindingName = 'absentSubscriber'.