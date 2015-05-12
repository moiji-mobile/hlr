tests-infoRetrievalPackage
testSendRoutingInfoForSMV3UnreachableHighPrio
	| operationName dialogue  invoke invokeError sriArg mwStatus  |
	
	subscriber
		mscNumber: '123';
		clearVlr.
	mwStatus := nil.

	self assert: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdn toE164;
				at: 'sm-RP-PRI' put: true;
				at: 'serviceCentreAddress' put: '912343' byteArrayFromHex;
				yourself.

	operationName := 'sendRoutingInfoForSMV3'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | invokeError := err];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument mw_Status].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return"
	self deny: invokeError isNil.
	self assert: invokeError name equals: 'absentSubscriberSM'.
	self assert: (mwStatus includesBit: 'mnrf-Set').
	self deny: (mwStatus includesBit: 'mcef-Set').
	self assert: (subscriber messageWaitingSet anySatisfy: [:assoc |  assoc value asString= '3234'])