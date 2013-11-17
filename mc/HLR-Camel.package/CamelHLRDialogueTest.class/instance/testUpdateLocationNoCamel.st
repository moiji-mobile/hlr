barr-handling
testUpdateLocationNoCamel
	"We expect that everything will be barred in case there is
	no proper camel capabilities"

	| operationName dialogue invoke res param invocations |
	operationName := 'updateLocation'.
	dialogue := testEndPoint createDialogue.

	subscriber activateSupplementaryServiceForCode: SSData callWaiting.
	invocations := OrderedCollection new.

	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			invocations add: insert.
			dialogue requestTcContinue].

	param := ASN1Dictionary new
		at: 'imsi' put: '72040800004067F4';
		at: 'msc-Number' put: '916407973671F3';
		at: 'vlr-Number' put: '916407973671F3';
		at: 'vlr-Capability' put: '';
		yourself.

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [:tmp | res := true].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: res.
	self deny: subscriber isMobileStationNotReachable.

	"Might be fragile against... changes."
	"Make sure that all outgoing calls are barred."
	self assert: invocations first argument subscriberStatus value = 'operatorDeterminedBarring'.
	self assert: invocations first argument odb_Data odb_GeneralData = '0001'
	