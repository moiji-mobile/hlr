as yet unclassified
handleNotReachableLowPriority
	| param |

	"This is still a mess. I think we need to report the old msc-Number"
	subscriber addToMessageWaitingList: smscAddr gateway: dialogue transaction remoteAddress.
	hlr database updateSubscriber: subscriber.

	"Return absentSubscriberV2 with waiting list information"
	invocation returnError: self class absentSubscriber with: self class absentSubscriberData.

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	param := ASN1Dictionary new
		at: 'mw-Status' put: '0010';
		yourself.
	dialogue requestTcInvokeNamed: self class informServiceCentre parameters:  param class: 1 timeout: 500.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.
	self signalSuccess: 'low-priority'.