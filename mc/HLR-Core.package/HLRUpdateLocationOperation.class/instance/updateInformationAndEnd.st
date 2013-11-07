as yet unclassified
updateInformationAndEnd
	| result |

	subscriber
		vlrNumber: vlrNumber;
		mscNumber: mscNumber.
	hlr database updateSubscriber: subscriber.

	self flag: #todo. "TODO: ask the GMSC to inform the SMSC that are in the waiting lists"

	result := ASN1Dictionary new
		at: 'hlr-Number' put: hlr hlrNumberAsE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.