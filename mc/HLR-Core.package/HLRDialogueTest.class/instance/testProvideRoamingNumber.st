test-locationUpdatingPackage
testProvideRoamingNumber
	| reqImsi resRoamingNumber |

	reqImsi := ''.
	subscriber mscNumber: '12345'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				reqImsi := invocation argument imsi .
				invocation returnResultLast: '1234' asAsn1Value.
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRProvideRoamingNumberOperation new
		subscriber: subscriber;
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint;
		onSuccess: [:res | resRoamingNumber := res ];
		start.

	self assert: (GSMNumberDigits decodeFrom: reqImsi) = subscriber imsi.
	self assert: resRoamingNumber = '1234' asByteArray.