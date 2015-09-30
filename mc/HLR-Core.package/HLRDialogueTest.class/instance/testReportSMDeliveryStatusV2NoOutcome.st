test-locationUpdatingPackage
testReportSMDeliveryStatusV2NoOutcome
	| operationName dialogue invoke res param operation |
	operationName := 'reportSM-DeliveryStatusV2'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'serviceCentreAddress' put: '91abcd';
		yourself.

	subscriber mobileStationNotPresent.
	self assert: subscriber isMobileStationNotReachable.

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res.
	self assert: subscriber isMobileStationNotReachable.