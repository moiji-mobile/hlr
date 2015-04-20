tests-infoRetrievalPackage
testSendRoutingInfoV3DirectForward
	| operationName dialogue  invoke invokeResultMessage sriArg |
	
	"Test that direct forward will not ask anyone for the subscriber number"
	subscriber
		vlrNumber: '1234';
		mscNumber: '1234';
		enableDirectForwardingTo: '678' toE164.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'interrogationType' put: 'basicCall';
				at: 'gmsc-OrGsmSCF-Address' put: '123' toE164;
				yourself.

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
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
	self assert: invokeResultMessage resultObject extendedRoutingInfo forwardingData forwardedToNumber fromE164 = '678'.