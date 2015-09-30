test-locationUpdatingPackage
testPurgeV3
	| operationName dialogue  invoke invokeResult param operation |

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.	
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	self deny: subscriber isMobileStationNotReachable.

	operationName := 'purgeMSV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue
		at: 'imsi' put: self imsi;
		yourself.
	
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.
	self assert: invokeResult resultObject freezeTMSI = #null.
	self assert: subscriber vlrNumber isNil.
	self assert: subscriber mscNumber = '4567'.
	self assert: subscriber isMobileStationNotReachable.