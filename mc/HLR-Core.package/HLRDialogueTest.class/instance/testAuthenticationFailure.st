test-supplementary-services
testAuthenticationFailure
	| operationName dialogue  invoke invokeResult param  operation |

	dialogue := testEndPoint newDialogue.
	operationName := 'authenticationFailureReport'.
	operation := dialogue rosOperationNamed: operationName.
	
	param := operation newArgumentValue
		imsi:  '2324234' toTBCD;
		failureCause: 'wrongUserResponse'.
	
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 5.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result |  invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.