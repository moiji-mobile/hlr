execution
updateInformationAndEnd
	| result |

	subscriber
		sgsnNumber: sgsnNumber;
		sgsnAddress: sgsnAddress.
	hlr database updateSubscriber: subscriber.

	self flag: #todo. "Handle things for GPRS?"

	result := invocation resultValue
		at: 'hlr-Number' put: hlr hlrNumber toE164;
		yourself.

	"Done!"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'