as yet unclassified
handleNotReachableHighPriority
	"The subscriber is not reachable for sure"
	mwStatus at: 2 put: $1.

	"Now 'ACK' the request.. do that with the old msc-Number?"
	invocation returnResultLast: (ASN1Dictionary new
					at: 'imsi' put: subscriber imsiAsTBCD;
					at: 'locationInfoWithLMSI' put: (ASN1Dictionary new
							at: 'networkNode-Number' put: subscriber mscNumberAsE164;
							yourself);
					yourself).

	(subscriber messageWaitingListContains: smscAddr gateway: dialogue transaction remoteAddress)
		ifFalse: [
			mwStatus at: 1 put: $1.
			subscriber isMemoryAvailable ifFalse: [mwStatus at: 3 put: $1]].

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	self informServiceCentre.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'high-priority'