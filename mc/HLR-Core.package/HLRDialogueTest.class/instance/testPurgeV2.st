test-locationUpdatingPackage
testPurgeV2
	| operationName dialogue  invoke invokeResult param |

	param := ASN1Dictionary new
		at: 'imsi' put: self imsi;
		yourself.
	
	operationName := 'purgeMSV2'.
	dialogue := testEndPoint createDialogue.
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