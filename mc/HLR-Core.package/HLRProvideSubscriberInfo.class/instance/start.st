execution
start
	| parameters |
	
	parameters := ASN1Dictionary new
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'requestedInfo' put: (ASN1Dictionary new
			at: 'locationInformation' put: 1;
			at: 'subscriberState' put: 1;
			at: 'currentLocation' put: 1;
			at: 'imei' put: 1;
			yourself);
		yourself.

	dialogue := endPoint createDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	invoke := dialogue
		requestTcInvokeNamed: 'provideSubscriberInfo'
		parameters: parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self success: res];
		onError: [self failure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (self class applicationContextFor:  'provideSubscriberInfo')