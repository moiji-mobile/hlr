execution
finishUpdate
	| result |
	result := invocation resultValue
		at: 'hlr-Number' put: hlr hlrNumber toE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'