test-supplementary-services
testRegisterSS
	| operationName dialogue  invoke invokeResult param invocations invocationData operation dialoguePortion |
	
	subscriber
		vlrNumber: '1234'.

	invocations := 0.
	invocationData := OrderedCollection new.
	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocationData add: invocation argument.
				invocations := invocations + 1.
				invocation returnResultLast: nil.
				diag requestTcContinue]].

	operationName := 'registerSS'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'ss-Code' put: SSData callForwardingUnconditional asByteArray;
		at: 'forwardedToNumber' put: '1234' toE164;
		yourself.
	(param expandFieldNamed: 'basicService')
		at: 'teleservice' put: #[16r10].

	dialoguePortion := self mapOpenDestination:  subscriber imsi toE212 origination:  '0815' toE164.
	
	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:result | invokeResult := result].
	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)
		userInformation: { dialoguePortion }.

	self deny: invokeResult isNil.
	self assert: invocations = 2.
	self assert: (subscriber supplementaryServiceStateFor: SSData callForwardingUnconditional) forwardedToNumber = '1234' toE164.

	"Verify the encoding of the forwardingInfo"
	self assert: invocationData second provisionedSS elements first forwardingInfo ss_Code equals: #[33].
	self assert: invocationData second provisionedSS elements first forwardingInfo forwardingFeatureList first forwardingOptions equals:  #[16r0C].