as yet unclassified
finishForward: aSubscriber number: aMSISDN
	invocation returnResultLastUsing: [ :result | 
		result at: 'imsi' put: aSubscriber imsiAsTBCD.
		((result expandFieldNamed: 'extendedRoutingInfo')
			expandFieldNamed: 'forwardingData')
				at: 'forwardedToNumber' put: aMSISDN ].

	dialogue requestTcEnd: false.