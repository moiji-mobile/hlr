invoke
insertFailed
	"The insertion of data failed. Inform someone else"
	failed := true.
	needsEnd ifTrue: [
		dialogue requestTcUAbort: (dialogue uAbortCause: 0)].
	self signalFailure.