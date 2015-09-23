as yet unclassified
handleNotReachableLowPriority
	| gateway |
	"This is still a mess. I think we need to report the old msc-Number"
	gateway := dialogue transaction remoteAddress.
	hlr database addMessageWaitingEntryFor: subscriber serviceCentre: smscAddr gateway: gateway.

	"Return absentSubscriberV2 with waiting list information"
	self returnError.

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	mwStatus at: 2 put: $1.
	self informServiceCentre.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'low-priority'.