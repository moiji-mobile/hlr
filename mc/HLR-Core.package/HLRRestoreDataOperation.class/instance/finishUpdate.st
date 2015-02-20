execution
finishUpdate
	| result |
	result := ASN1Dictionary new
		at: 'hlr-Number' put: hlr hlrNumber toE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'