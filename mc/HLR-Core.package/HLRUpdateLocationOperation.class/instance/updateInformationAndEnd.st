as yet unclassified
updateInformationAndEnd
	| result |

	subscriber
		vlrNumber: vlrNumber;
		mscNumber: mscNumber.
	hlr database updateSubscriber: subscriber.

	result := invocation newResultValue
		at: 'hlr-Number' put: hlr hlrNumber toE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.

	"Ask the HLR to ask to tell everyone waiting"
	hlr alertServiceCentresFor: subscriber.

	self signalSuccess: 'done'