tests-infoRetrievalPackage
testSendRoutingInfoV2NoForward
	| operationName dialogue  invoke  err_message operation param |
	
	"Test that lack of vlrNumber/mscNumber/forwardingNumber will fail"
	subscriber
		vlrNumber: nil;
		mscNumber: nil.

	operationName := 'sendRoutingInfoV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'msisdn' put: subscriber msisdn toE164;
		yourself.
		
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters: param
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
	self assert: err_message parameter absentSubscriberReason = 'imsiDetach'.
	self assert: err_message error originalBindingName = 'absentSubscriber'.