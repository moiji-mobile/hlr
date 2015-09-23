tests-infoRetrievalPackage
testSendRoutingInfoForSMV2UnreachableLowPrio
	| operationName dialogue  invoke err_message sriArg mwStatus  operation |


	subscriber
		mscNumber: '123';
		clearVlr.
	mwStatus := nil.

	self assert: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	sriArg := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: false;
		at: 'serviceCentreAddress' put: '912343' byteArrayFromHex;
		yourself.
		
	invoke := dialogue
				requestTcInvoke: operation
				parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false].

	dialogue onInvoke: [:invocation |
				mwStatus := invocation argument basicAt:  'mw-Status'].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"TODO.. make sure things return".
	self assert: (mwStatus includesBit: 'mnrf-Set').
	self assert: err_message error originalBindingName = 'absentSubscriberV2'.
	self assert: err_message parameter isNil.
	self assert: (subscriber messageWaitingSet anySatisfy: [:assoc | assoc value = '3234'])