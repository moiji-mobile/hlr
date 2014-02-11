invoke
insertFailed
	"The insertion of data failed. Inform someone else"
	failed := true.
	needsEnd ifTrue: [
		dialogue requestTcUAbort: TCAPDialogueUAbort serviceUser ].
	self signalFailure.