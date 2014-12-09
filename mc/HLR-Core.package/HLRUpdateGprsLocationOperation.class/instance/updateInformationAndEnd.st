execution
updateInformationAndEnd
	| result |

	subscriber
		sgsnNumber: sgsnNumber;
		sgsnAddress: sgsnAddress.
	hlr database updateSubscriber: subscriber.

	self flag: #todo. "Handle things for GPRS?"

	result := ASN1Dictionary new
		at: 'hlr-Number' put: hlr hlrNumberAsE164;
		yourself.

	"Done!"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'