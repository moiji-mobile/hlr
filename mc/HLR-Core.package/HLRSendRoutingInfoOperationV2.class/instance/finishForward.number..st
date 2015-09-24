as yet unclassified
finishForward: aSubscriber number: aMSISDN
	invocation returnResultLastUsing: [ :result | 
		result at: 'imsi' put: aSubscriber imsiAsTBCD.
		((result expandFieldNamed: 'routingInfo')
			expandFieldNamed: 'forwardingData') 
				at: 'forwardedToNumber' put: aMSISDN ].
	dialogue requestTcEnd: false.
	self signalSuccess: aMSISDN