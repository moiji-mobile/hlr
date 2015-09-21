execution
returnResult: ssCode
	| ssData result |

	"Create a result"
	ssData := subscriber supplementaryServiceStateFor: ssCode.
	result := ssData toAsn1: dialogue asn1Model. 
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.

	hlr updateSupplementaryService: ssData for: subscriber.

	self signalSuccess: 'done'