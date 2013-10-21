as yet unclassified
updateInformationAndEnd
	| result |

	subscriber
		vlrNumber: vlrNumber;
		mscNumber: mscNumber.
	hlr database updateSubscriber: subscriber.

	result := ASN1Dictionary new
		at: 'hlr-Number' put: hlr hlrNumberAsE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.