as yet unclassified
handleNotReachableHighPriority
	"The subscriber is not reachable for sure"
	| result |
	mwStatus at: 2 put: $1.

	"Now 'ACK' the request.. do that with the old msc-Number?"
	result := invocation newResultValue
		at: 'imsi' put: subscriber imsiAsTBCD;
		yourself.
	(result expandFieldNamed: 'locationInfoWithLMSI' )
		at: 'networkNode-Number' put: subscriber mscNumber toE164.
		
	invocation returnResultLast: result.

	(subscriber messageWaitingListContains: smscAddr gateway: dialogue transaction remoteAddress)
		ifFalse: [
			mwStatus at: 1 put: $1.
			subscriber isMemoryAvailable ifFalse: [mwStatus at: 3 put: $1]].

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	self informServiceCentre.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'high-priority'