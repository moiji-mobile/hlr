as yet unclassified
handleNotReachableLowPriority
	|  |

	"This is still a mess. I think we need to report the old msc-Number"
	subscriber addToMessageWaitingList: smscAddr gateway: dialogue transaction remoteAddress.
	hlr database updateSubscriber: subscriber.

	"Return absentSubscriberV2 with waiting list information"
	invocation returnError: self class absentSubscriber with: self class absentSubscriberData.

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	mwStatus at: 2 put: $1.
	self informServiceCentre.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'low-priority'.