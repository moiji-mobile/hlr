as yet unclassified
startWithNewDialogue
	dialogue := dialogueHandler createDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self execute.