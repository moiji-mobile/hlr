execution
start
	dialogue := endPoint createDialogue.
	invoke := dialogue
		requestTcInvokeNamed: self class cancelOperation
		parameters: self parameters
		class: 1 timeout: 500.
	dialogue
		requestTcBeginDestinationAddress: self remoteAddress
		originatingAddress: self localAddress
		applicationContextName: (self class applicationContextFor: self class cancelOperation)