test-locationUpdatingPackage
testProvideRoamingNumberV3
	| reqImsi resRoamingNumber |

	reqImsi := ''.
	subscriber mscNumber: '12345'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				reqImsi := invocation argument imsi.
				self halt.
				invocation returnResultLast: (invocation operation resultValue
						at: 'roamingNumber' put: '1234';
						yourself).
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRProvideRoamingNumberOperationV3 new
		subscriber: subscriber;
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint dialogueHandler;
		onSuccess: [:res | resRoamingNumber := res];
		start.

	self assert: (GSMNumberDigits decodeFrom: reqImsi) = subscriber imsi.
	self assert: resRoamingNumber asString = '1234' .