test-locationUpdatingPackage
testInsertSubscriberDataFailed
	| failed |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocation returnError: 'unidentifiedSubscriber' with: nil.
				diag requestTcContinue]].

	"Fire and forget the operation"
	HLRInsertSubscriberData new
		hlr: testHlr;
		hlrAddress: '3548999973';
		remoteGlobalTitle: '46707963173';
		dialogueHandler: hlrEndPoint;
		subscriber: subscriber;
		onSuccess: [self assert: false];
		onFailure: [failed := true];
		startWithNewDialogue.


	self assert: failed.