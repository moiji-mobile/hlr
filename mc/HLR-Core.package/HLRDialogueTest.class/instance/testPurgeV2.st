test-locationUpdatingPackage
testPurgeV2
	| operationName dialogue  invoke invokeResult param |

	param := ASN1Dictionary new
		at: 'imsi' put: self imsi;
		at: 'vlr-Number' put: '1234' toE164
		yourself.

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	self deny: subscriber isMobileStationNotReachable.
	
	operationName := 'purgeMSV2'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
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