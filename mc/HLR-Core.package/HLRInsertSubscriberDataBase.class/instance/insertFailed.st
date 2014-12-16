invoke
insertFailed
	"The insertion of data failed. Inform someone else"
	failed := true.
	needsEnd ifTrue: [
		dialogue requestTcUAbort: dialogue newUAbort serviceUser ].
	self signalFailure.