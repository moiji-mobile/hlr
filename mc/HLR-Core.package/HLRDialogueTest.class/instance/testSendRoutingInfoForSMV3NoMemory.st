tests-infoRetrievalPackage
testSendRoutingInfoForSMV3NoMemory
	| operationName dialogue  invoke invokeResultMessage param informInvoke operation |
	
	subscriber
		memoryCapcacityExceeded;
		mscNumber: '123';
		vlrNumber: '456'.

	self deny: subscriber isMobileStationNotReachable.
	self deny: subscriber isMemoryAvailable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: false;
		at: 'serviceCentreAddress' put: '912343';
		yourself.
		
	dialogue onInvoke: [:inv | informInvoke := inv ].
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  param
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

	"TODO.. make sure things return"
	self assert: invokeResultMessage resultObject imsi = subscriber imsiAsTBCD.
	self assert: subscriber messageWaitingSet isEmpty.
	self deny: informInvoke isNil.
	self assert: informInvoke operationName equals: 'informServiceCentreV3'.
	self assert: ((informInvoke argument privAt: 'mw-Status') includesBit: 'mcef-Set').