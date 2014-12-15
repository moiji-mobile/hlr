execution
start
	| parameters |

	parameters := ASN1Dictionary new
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'requestedInfo' put: (ASN1Dictionary new
			at: 'locationInformation' put: nil asAsn1Value;
			at: 'subscriberState' put: nil asAsn1Value;
			at: 'currentLocation' put: nil asAsn1Value;
			at: 'imei' put: nil asAsn1Value;
			yourself);
		yourself.

	dialogue := dialogueHandler newDialogue.
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
		applicationContextName: (dialogue asn1Model applicationContextOidForOperationNamed:  'provideSubscriberInfo')