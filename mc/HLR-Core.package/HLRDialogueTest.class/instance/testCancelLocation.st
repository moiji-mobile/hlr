test-locationUpdatingPackage
testCancelLocation
	| res imsi |

	res := ''.
	imsi := '1234'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				res := invocation argument imsi asByteArray.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRCancelOperation new
		imsi: imsi;
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint;
		start.

	self assert: (GSMNumberDigits decodeFrom: res) = imsi.