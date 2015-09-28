barr-handling
testSendRoutingInfoV3CamelV2SuppressTCSI
	| operationName dialogue invoke  result operation param |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocation returnResultLastUsing: [ :res | 
					res at: 'roamingNumber' put: '10123' toE164 ].
				diag requestTcEnd: false]].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue 
		at: 'msisdn' put: subscriber msisdn toE164;
		at: 'interrogationType' put: 'basicCall';
		at: 'gmsc-OrGsmSCF-Address' put: '1234' toE164;
		expandAt: 'camelInfo' using: [ :camelInfo | 
			camelInfo
				at: 'supportedCamelPhases' put: '0011';
				at: 'suppress-T-CSI' put: nil ].

	invoke := dialogue
				requestTcInvokeNamed: operationName parameters: param
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false ];
		onReject: [self assert: false];
		onReturnLast: [:res | result := res resultObject ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"Everything is in place. It should return a MSRN"
	self deny: result isNil.
	self deny: result extendedRoutingInfo roamingNumber isNil.