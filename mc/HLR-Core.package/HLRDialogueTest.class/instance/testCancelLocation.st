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
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteAddress: '46707963173';
		dialogueHandler: hlrEndPoint;
		start.

	self assert: (GSMNumberDigits decodeFrom: res) = imsi.