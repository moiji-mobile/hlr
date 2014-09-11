as yet unclassified
handleNotReachableHighPriority
	"This is still a mess. I think we need to report the old msc-Number"
	subscriber addToMessageWaitingList: smscAddr gateway: dialogue transaction remoteAddress.
	hlr database updateSubscriber: subscriber.

	"Now 'ACK' the request.. do that with the old msc-Number?"
	invocation returnResultLast: nil.

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	mwStatus at: 2 put: $1.
	self informServiceCentre.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'high-priority'