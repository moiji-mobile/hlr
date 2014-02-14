tests-infoRetrievalPackage
testSendRoutingInfoForSMV2UnreachableLowPrio
	| operationName dialogue  invoke err_message sriArg mwStatus  |
	
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

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument mw_Status].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return".
	self assert: (mwStatus includesBit: 'mnrf-Set').
	self assert: err_message error originalBindingName = 'absentSubscriberV2'.
	self assert: err_message parameter isNil.
	self assert: (subscriber messageWaitingSet anySatisfy: [:assoc | assoc value = '3234'])