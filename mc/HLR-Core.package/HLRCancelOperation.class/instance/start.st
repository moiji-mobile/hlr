execution
start
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	invoke := dialogue
		requestTcInvokeNamed: self class cancelOperation
		parameters: self parameters
		class: 1 timeout: 500.
	invoke
		onReturnLast: [self signalSuccess: 'success'];
		onError: [self signalFailure].
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue applicationContextNamed: self class cancelOperation)