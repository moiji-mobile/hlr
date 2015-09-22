execution
start
	| operation |
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	operation := dialogue operationNamed: self class operationName.
	invoke := dialogue
		requestTcInvoke: operation
		parameters: (self parametersOn: operation argumentValue)
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self success: res resultObject];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue asn1Model applicationContextOidForOperationNamed: self class operationName)