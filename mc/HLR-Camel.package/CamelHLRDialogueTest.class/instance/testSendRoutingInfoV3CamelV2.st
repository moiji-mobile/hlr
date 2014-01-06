barr-handling
testSendRoutingInfoV3CamelV2
	| operationName dialogue invoke sriArg result |
	
	subscriber
		mscNumber: '123';
		vlrNumber: '456'.

	sriArg := ASN1Dictionary new
				at: 'msisdn' put: subscriber msisdnAsE164;
				at: 'interrogationType' put: 'basicCall';
				at: 'gmsc-OrGsmSCF-Address' put: '1234' toE164;
				at: 'camelInfo' put: (ASN1Dictionary new
					at: 'supportedCamelPhases' put: '110000';
					yourself);
				yourself.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invocation returnResultLast: (ASN1Dictionary new
									at: 'subscriberInfo' put: (ASN1Dictionary new
											at: 'imei' put: '1234';
											yourself);
									yourself).
				diag requestTcEnd: false]].

	operationName := 'sendRoutingInfoV3'.
	dialogue := testEndPoint createDialogue.
	invoke := dialogue
				requestTcInvokeNamed: operationName parameters:  sriArg
				class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false ];
		onReject: [self assert: false];
		onReturnLast: [:res | result := res].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	"Everything is in place. It should return a MSRN"
	self deny: result isNil.
	self deny: result extendedRoutingInfo camelRoutingInfo isNil.