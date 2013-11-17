execution
returnResult: ssCode
	| ssData result |

	"Create a result"
	ssData := subscriber supplementaryServiceStateFor: ssCode.
	result := ssData toAsn1. 
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.

	hlr updateSupplementaryService: ssData for: subscriber.