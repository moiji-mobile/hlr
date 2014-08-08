camel-attributes
testUpdateLocation
	| operationName dialogue invoke res invocations updateParams |
	operationName := 'updateLocation'.
	dialogue := testEndPoint createDialogue.
	invocations := OrderedCollection new.

	subscriber activateSupplementaryServiceForCode: SSData callWaiting.
	
	updateParams := ASN1Dictionary new
		at: 'imsi' put: '72040800004067F4' byteArrayFromHex;
		at: 'msc-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Capability' put: (ASN1Dictionary new
			at: 'supportedCamelPhases' put: '111';
			yourself);
		yourself.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			invocations add: insert.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvokeNamed: operationName parameters: updateParams class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:param | res := true ].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res.
	self deny: subscriber isMobileStationNotReachable.

	"Now check"
	self assert: invocations size = 3.