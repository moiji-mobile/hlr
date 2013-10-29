as yet unclassified
startWithNewDialogue
	needsBegin := true.
	dialogue := dialogueHandler createDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self execute.