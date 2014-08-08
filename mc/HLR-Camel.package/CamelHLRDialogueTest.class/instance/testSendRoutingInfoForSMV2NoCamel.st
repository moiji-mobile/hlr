barr-handling
testSendRoutingInfoForSMV2NoCamel
	| operationName dialogue invoke sriArg err_message |
	
	subscriber
		mscNumber: '123' byteArrayFromHex;
		vlrNumber: '456' byteArrayFromHex.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'sm-RP-PRI' put: false;
				at: 'serviceCentreAddress' put: '912343' byteArrayFromHex;
				yourself.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
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