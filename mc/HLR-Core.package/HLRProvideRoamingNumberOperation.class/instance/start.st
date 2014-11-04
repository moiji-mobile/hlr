execution
start
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	invoke := dialogue
		requestTcInvokeNamed: self class operationName
		parameters: self parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [:res | self success: res result];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (self class applicationContextFor: self class operationName)