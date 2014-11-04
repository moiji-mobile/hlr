as yet unclassified
startWithNewDialogue
	needsBegin := true.
	needsEnd := true.
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].

	self execute.