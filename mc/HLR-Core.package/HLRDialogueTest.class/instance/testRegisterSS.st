test-supplementary-services
testRegisterSS
	| operationName dialogue  invoke invokeResult param invocations invocationData |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	invocationData := OrderedCollection new.
	param := ASN1Dictionary new
		at: 'ss-Code' put: SSData callForwardingUnconditional asByteArray;
		at: 'basicService' put: (ASN1Dictionary new
					at: 'teleservice' put: #[16r10];
					yourself);
		at: 'forwardedToNumber' put: '1234' toE164;
		yourself.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocationData add: invocation argument.
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	operationName := 'registerSS'.
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
	self assert: (subscriber supplementaryServiceStateFor: SSData callForwardingUnconditional) forwardedToNumber = '1234'.

	"Verify the encoding of the forwardingInfo"
	self assert: invocationData second provisionedSS elements first forwardingInfo ss_Code equals: #[33].
	self assert: invocationData second provisionedSS elements first forwardingInfo forwardingFeatureList first forwardingOptions equals:  #[16r0C].