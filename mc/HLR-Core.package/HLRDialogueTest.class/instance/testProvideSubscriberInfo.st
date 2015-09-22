test-locationUpdatingPackage
testProvideSubscriberInfo
	| reqImsi resImei |

	reqImsi := ''.
	subscriber mscNumber: '12345'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation | | result |
				reqImsi := invocation argument imsi asByteArray.
				result := invocation resultValue.
				(result expandFieldNamed: 'subscriberInfo')
					at: 'imei' put: '1234'.
				invocation returnResultLast: result.
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRProvideSubscriberInfo new
		subscriber: subscriber;
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint dialogueHandler;
		onSuccess: [:res | resImei := res resultObject subscriberInfo imei];
		start.

	self assert: (GSMNumberDigits decodeFrom: reqImsi) = subscriber imsi.
	self assert: resImei asString = '1234'.