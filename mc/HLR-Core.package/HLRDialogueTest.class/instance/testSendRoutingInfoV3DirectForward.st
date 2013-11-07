tests-infoRetrievalPackage
testSendRoutingInfoV3DirectForward
	| operationName dialogue  invoke invokeResult sriArg |
	
	"Test that direct forward will not ask anyone for the subscriber number"
	subscriber
		vlrNumber: '1234';
		mscNumber: '1234';
		forwardingMode: subscriber class forwardAlways;
		forwardingNumber: '678'.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				yourself.

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"Verify things"
	self assert: invokeResult extendedRoutingInfo forwardingData forwardedToNumber = subscriber forwardingNumberAsE164 asUppercase.