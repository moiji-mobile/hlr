execution
start
	| operation |
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	operation := dialogue rosOperationNamed: self class cancelOperation.
	invoke := dialogue
		requestTcInvoke: operation
		parameters: (self parametersOn: operation newArgumentValue)
		class: 1 timeout: 500.
	invoke
		onReturnLast: [self signalSuccess: 'success'];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue applicationContextOidForOperationNamed: self class cancelOperation)