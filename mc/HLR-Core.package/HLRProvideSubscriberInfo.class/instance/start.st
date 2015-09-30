execution
start
	| parameters operation |

	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	operation := dialogue rosOperationNamed: 'provideSubscriberInfo'.
	parameters := operation newArgumentValue
		at: 'imsi' put: subscriber imsiAsTBCD;
		yourself.
		
	(parameters expandFieldNamed: 'requestedInfo') 
			at: 'locationInformation' put: nil ;
			at: 'subscriberState' put: nil;
			at: 'currentLocation' put: nil;
			at: 'imei' put: nil.

	invoke := dialogue
		requestTcInvoke: operation
		parameters: parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self signalSuccess: res];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue asn1Model applicationContextOidForOperationNamed:  'provideSubscriberInfo')