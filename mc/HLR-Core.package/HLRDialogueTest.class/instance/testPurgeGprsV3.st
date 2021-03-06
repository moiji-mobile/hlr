test-locationUpdatingPackage
testPurgeGprsV3
	| operationName dialogue  invoke invokeResult param operation |

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.	
	subscriber sgsnNumber: '8901'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	self deny: subscriber sgsnNumber isNil.

	operationName := 'purgeMSV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: self imsi;
		at: 'sgsn-Number' put: '919810' asByteArray;
		yourself.

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localSGSNAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	self assert: subscriber sgsnNumber isNil.