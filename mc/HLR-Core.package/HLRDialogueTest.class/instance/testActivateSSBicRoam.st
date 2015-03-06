test-supplementary-services
testActivateSSBicRoam
	| operationName dialogue  invoke invokeResult param invocations invocationData |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData barrIncomingCallRoam asByteArray;
		at: 'basicService' put: (ASN1Dictionary new
					at: 'teleservice' put: #[16r10];
					yourself);
		yourself.

	invocationData := OrderedCollection new.
	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocationData add: invocation argument.
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	operationName := 'activateSS'.
	dialogue := testEndPoint newDialogue.
	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self deny: invokeResult isNil.
	self assert: invocations = 2.

	"Check the barring"
	self assert: invocationData second provisionedSS elements first callBarringInfo ss_Code equals: #[155].