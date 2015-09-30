test-locationUpdatingPackage
testPurgeV2
	| operationName dialogue  invoke invokeResult param operation |

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	self deny: subscriber isMobileStationNotReachable.
	
	operationName := 'purgeMSV2'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: self imsi;
		at: 'vlr-Number' put: '1234' toE164;
		yourself.
		
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: invokeResult.
	self assert: subscriber vlrNumber isNil.
	self assert: subscriber mscNumber = '4567'.
	self assert: subscriber isMobileStationNotReachable.