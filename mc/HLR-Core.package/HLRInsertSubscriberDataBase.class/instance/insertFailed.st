invoke
insertFailed
	"The insertion of data failed. Inform someone else"
	failed := true.
	needsEnd ifTrue: [
		dialogue uAbort: 0].
	onErrorBlock value.