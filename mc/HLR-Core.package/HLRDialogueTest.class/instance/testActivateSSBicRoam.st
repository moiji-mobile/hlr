test-supplementary-services
testActivateSSBicRoam
	|  dialogue  invoke invokeResult param invocations invocationData operation acn dialoguePortion |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	
	acn := self applicationContextNamed: 'networkFunctionalSsContext-v2'.
	operation := self rosOperationNamed: 'activateSS'.
	
	param := self activateSSParam: operation ssCode: SSData barrIncomingCallRoam asByteArray.
	dialoguePortion := self mapOpenDestination:subscriber imsi toE212 origination: '0815' toE164.

	invocationData := OrderedCollection new.
	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocationData add: invocation argument.
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		applicationContext: acn;
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		userInformation: { dialoguePortion }.

	self deny: invokeResult isNil.
	self assert: invocations = 2.

	"Check the barring"
	self assert: invocationData second provisionedSS elements first callBarringInfo ss_Code equals: #[155].