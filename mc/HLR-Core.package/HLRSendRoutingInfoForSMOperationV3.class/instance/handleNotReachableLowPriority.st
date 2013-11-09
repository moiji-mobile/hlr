as yet unclassified
handleNotReachableLowPriority
	| param |

	"This is still a mess. I think we need to report the old msc-Number"
	subscriber addToMessageWaitingList: smscAddr.
	hlr database updateSubscriber: subscriber.

	"Return absentSubscriberV2 now...Added to the MWD list. 3 is hardcoded
	as the reference to 23.040 does not describe it."
	invocation returnError: 'absentSubscriberSM' with: (ASN1Dictionary new
															at: 'absentSubscriberDiagnosticSM' put: 3;
															yourself).

	"Tell the GSMSC that we have now queued this SMSC. It a unconfirmed service"
	param := ASN1Dictionary new
		at: 'mw-Status' put: '0100';
		yourself.
	dialogue requestTcInvokeNamed: 'informServiceCentreV2' parameters:  param class: 1 timeout: 500.
	
	"Send the two invocations and be done"
	dialogue requestTcEnd: false.