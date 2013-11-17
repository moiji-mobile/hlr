as yet unclassified
testSendRoutingInfoForSMV3NoCamel
	| operationName dialogue invoke sriArg err_name err_data |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'sm-RP-PRI' put: false;
				at: 'serviceCentreAddress' put: '912343';
				yourself.

	operationName := 'sendRoutingInfoForSMV3'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err :par | err_name := err. err_data := par];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_name originalBindingName = 'callBarred'.
	self assert: err_data isNil.