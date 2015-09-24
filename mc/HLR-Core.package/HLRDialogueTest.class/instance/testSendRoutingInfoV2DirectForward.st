tests-infoRetrievalPackage
testSendRoutingInfoV2DirectForward
	| operationName dialogue  invoke invokeResultMessage  operation param |
	
	"Test that direct forward will not ask anyone for the subscriber number"
	subscriber
		vlrNumber: '1234';
		mscNumber: '1234';
		enableDirectForwardingTo: '678' toE164.

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
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResultMessage := result ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"Verify things"
	self assert: invokeResultMessage resultObject routingInfo forwardingData forwardedToNumber fromE164 = '678'.