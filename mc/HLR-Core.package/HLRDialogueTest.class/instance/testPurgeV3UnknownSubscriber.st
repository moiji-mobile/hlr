test-locationUpdatingPackage
testPurgeV3UnknownSubscriber
	| operationName dialogue  invoke error param operation |

	operationName := 'purgeMSV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: '55555555555' toTBCD;
		yourself.
	
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [:err | error := err];
		onReject: [self assert: false];
		onReturnLast: [:result | self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: error isNil.
	self assert: error name equals: 'unknownSubscriber'.