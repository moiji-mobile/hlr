tests-infoRetrievalPackage
testSendRoutingInfoForSMV3UnreachableLowPrio
	| operationName dialogue  invoke sriArg mwStatus err_name err_data  |
	
	subscriber
		mscNumber: '123';
		clearVlr.
	mwStatus := nil.

	self assert: subscriber isMobileStationNotReachable.
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
		onError: [:err :param | err_name := err. err_data := param];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument mw_Status].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self assert: err_name originalBindingName = 'absentSubscriberSM'.
	self assert: err_data isNil.
	self assert: mwStatus = '0100'.
	self assert: (subscriber messageWaitingSet includes: '3234')