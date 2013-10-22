execution
start
	| parameters |
	
	parameters := ASN1Dictionary new
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'msc-Number' put: subscriber mscNumberAsE164;
		yourself.

	dialogue := endPoint createDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	invoke := dialogue
		requestTcInvokeNamed: 'provideRoamingNumberV2'
		parameters: parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self success: res];
		onError: [self failure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (self class applicationContextFor: 'provideRoamingNumberV2')