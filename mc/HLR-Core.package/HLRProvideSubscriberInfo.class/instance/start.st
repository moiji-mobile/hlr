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

	dialogue := dialogueHandler  createDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	invoke := dialogue
		requestTcInvokeNamed: 'provideSubscriberInfo'
		parameters: parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self signalSuccess: res];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (self class applicationContextFor:  'provideSubscriberInfo')