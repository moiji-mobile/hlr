execution
provideRoutingInformation
	| result |
	
	result := invocation resultValue
		at: 'imsi' put: subscriber imsiAsTBCD;
		yourself.
	(result expandFieldNamed: 'locationInfoWithLMSI')
		at: 'networkNode-Number' put: subscriber mscNumber toE164.
	invocation returnResultLast: result.

	subscriber isMemoryAvailable ifFalse: [
		mwStatus at: 3 put: $1.
		self informServiceCentre].

	dialogue requestTcEnd: false.
	self signalSuccess: 'provided info'