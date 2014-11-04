as yet unclassified
startWithNewDialogue
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self execute.