barr-handling
testSendRoutingInfoForSMV2NoCamel
	| operationName dialogue invoke  err_message operation param |
	
	subscriber
		mscNumber: '123' byteArrayFromHex;
		vlrNumber: '456' byteArrayFromHex.

	self deny: subscriber isMobileStationNotReachable.
	self assert: subscriber messageWaitingSet isEmpty.

	operationName := 'sendRoutingInfoForSMV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'sm-RP-PRI' put: false;
		at: 'serviceCentreAddress' put: '912343' byteArrayFromHex;
		yourself.

	invoke := dialogue
				requestTcInvoke: operation 
				parameters: param
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:errorMessage :par | err_message := errorMessage ];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (dialogue applicationContextOidForOperationNamed: operationName).

	"TODO.. make sure things return"
	self assert: err_message error originalBindingName = 'callBarred'.
	self assert: err_message parameter isNil.