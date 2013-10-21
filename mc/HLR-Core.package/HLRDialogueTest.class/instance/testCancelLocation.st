test-locationUpdatingPackage
testCancelLocation
	| res imsi |

	res := ''.
	imsi := '1234'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				res := ByteArray readHexFrom: invocation argument imsi.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRCancelOperation new
		imsi: imsi;
		hlrAddress: '3548999973';
		vlrAddress: '46707963173';
		endPoint: hlrEndPoint;
		start.

	self assert: (GSMNumberDigits decodeFrom: res) = imsi.