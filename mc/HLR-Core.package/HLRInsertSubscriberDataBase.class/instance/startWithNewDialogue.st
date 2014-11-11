as yet unclassified
startWithNewDialogue
	needsBegin := true.
	needsEnd := true.
	dialogue := dialogueHandler newDialogue.
	dialogue
		onPAbort: [self signalFailure];
		onUAbort: [self signalFailure].

	self execute.