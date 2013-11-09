execution
finishUpdate
	| result |
	result := ASN1Dictionary new
		at: 'hlr-Number' put: hlr hlrNumberAsE164;
		yourself.
	
	"Save"
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.