test-locationUpdatingPackage
testProvideRoamingNumberV3
	| reqImsi resRoamingNumber |

	reqImsi := ''.
	subscriber mscNumber: '12345'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				reqImsi := ByteArray readHexFrom: invocation argument imsi.
				invocation returnResultLast: (ASN1Dictionary new
						at: 'roamingNumber' put: '1234';
						yourself).
				diag requestTcEnd: false]].

	"Fire and forget the operation"
	HLRProvideRoamingNumberOperationV3 new
		subscriber: subscriber;
		hlrAddress: '3548999973';
		vlrAddress: '46707963173';
		endPoint: hlrEndPoint;
		onSuccess: [:res | resRoamingNumber := res roamingNumber ];
		start.

	self assert: (GSMNumberDigits decodeFrom: reqImsi) = subscriber imsi.
	self assert: resRoamingNumber = '1234'.