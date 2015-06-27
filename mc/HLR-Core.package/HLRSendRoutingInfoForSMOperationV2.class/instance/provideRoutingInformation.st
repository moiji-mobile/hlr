execution
provideRoutingInformation
	invocation returnResultLast: (ASN1Dictionary new
					at: 'imsi' put: subscriber imsiAsTBCD;
					at: 'locationInfoWithLMSI' put: (ASN1Dictionary new
							at: 'networkNode-Number' put: subscriber mscNumber toE164;
							yourself);
					yourself).

	subscriber isMemoryAvailable ifFalse: [
		mwStatus at: 3 put: $1.
		self informServiceCentre].

	dialogue requestTcEnd: false.
	self signalSuccess: 'provided info'