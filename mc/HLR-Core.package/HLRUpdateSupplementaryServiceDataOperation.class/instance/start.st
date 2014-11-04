execution
start
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self invokeDeleteSubscriberData.
	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (self class applicationContextFor: 'deleteSubscriberDataV3')