test-locationUpdatingPackage
testReportSMDeliveryStatusV2AbsentSubscriber
	| operationName dialogue invoke res param |
	operationName := 'reportSM-DeliveryStatusV2'.
	dialogue := testEndPoint createDialogue.
	
	subscriber mobileStationNotPresent.
	self assert: subscriber isMobileStationNotReachable.

	param := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'serviceCentreAddress' put: '91abcd';
				at: 'sm-DeliveryOutcome' put: 'absentSubscriber';
				yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res isNil.
	self assert: subscriber isMobileStationNotReachable.