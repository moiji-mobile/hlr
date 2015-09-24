test-locationUpdatingPackage
testUpdateLocation
	| operationName dialogue invoke res data |
	operationName := 'updateLocation'.
	dialogue := testEndPoint newDialogue.

	subscriber activateSupplementaryServiceForCode: SSData callWaiting.
	data := OrderedCollection new.

	dialogue
		onInvoke: [ :insert |
			data add: insert argument.
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  self createUpdateLocationParams class: 1 timeout: 500.
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

	"Check the ISD we get"
	self assert: data first category equals: #[16r0A].
	self assert: data first bearerServiceList first contents equals: #[16r11].
	self assert: data first teleserviceList first contents equals: #[16r11].
	self assert: data first provisionedSS elements second ss_Data ss_Code equals: #[16r12].
	self assert: data first provisionedSS elements second ss_Data ss_Status equals: #[16r00].