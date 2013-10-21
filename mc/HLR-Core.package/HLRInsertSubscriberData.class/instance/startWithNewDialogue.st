as yet unclassified
startWithNewDialogue
	needsBegin := true.
	dialogue := endPoint createDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self execute.