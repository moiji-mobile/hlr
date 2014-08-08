test-locationUpdatingPackage
testProvideSubscriberInfo
	| reqImsi resImei |

	reqImsi := ''.
	subscriber mscNumber: '12345'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				reqImsi := invocation argument imsi asByteArray.
				invocation returnResultLast: (ASN1Dictionary new
									at: 'subscriberInfo' put: (ASN1Dictionary new
											at: 'imei' put: '1234';
											yourself);
									yourself).
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRProvideSubscriberInfo new
		subscriber: subscriber;
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint;
		onSuccess: [:res | resImei := res result subscriberInfo imei];
		start.

	self assert: (GSMNumberDigits decodeFrom: reqImsi) = subscriber imsi.
	self assert: resImei asString = '1234'.