test-locationUpdatingPackage
testInsertSubscriberDataFailed
	| res  success |

	res := OrderedCollection new.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocation returnError: 'unidentifiedSubscriber' with: nil.
				diag requestTcContinue]].

	"Fire and forget the operation"
	HLRInsertSubscriberData new
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteAddress: '46707963173';
		dialogueHandler: hlrEndPoint;
		subscriber: subscriber;
		onSuccess: [success := true];
		startWithNewDialogue.

	self assert: res size = 3.
	self assert: res first keys size = 1.
	self assert: res first imsi = subscriber imsiAsTBCD asUppercase.
	self assert: success.
	self halt.
	self flag: #todo. "Not completed yet for error handling"