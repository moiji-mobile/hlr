test-supplementary-services
testAuthenticationFailure
	| operationName dialogue  invoke invokeResult param  |

	param := ASN1Dictionary new
		at: 'imsi' put: '2324234' toTBCD;
		at: 'failureCause' put: 'wrongUserResponse';
		yourself.

	operationName := 'authenticationFailureReport'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 5.
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