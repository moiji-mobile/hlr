as yet unclassified
finishWithRoute: aSubscriber number: aMSRN
	invocation returnResultLastUsing: [ :result | 
		result
			at: 'imsi' put: aSubscriber imsiAsTBCD.
		(result expandFieldNamed: 'routingInfo')
				at: 'roamingNumber' put: aMSRN ].
	dialogue requestTcEnd: false.
	self signalSuccess: aMSRN