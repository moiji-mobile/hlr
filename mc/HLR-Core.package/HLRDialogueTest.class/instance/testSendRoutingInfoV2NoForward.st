tests-infoRetrievalPackage
testSendRoutingInfoV2NoForward
	| operationName dialogue  invoke sriArg err_message |
	
	"Test that lack of vlrNumber/mscNumber/forwardingNumber will fail"
	subscriber
		vlrNumber: nil;
		mscNumber: nil.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				yourself.

	operationName := 'sendRoutingInfoV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
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

	"Verify things have failed"
	self assert: err_message parameter isNil.
	self assert: err_message error originalBindingName = 'absentSubscriber'.