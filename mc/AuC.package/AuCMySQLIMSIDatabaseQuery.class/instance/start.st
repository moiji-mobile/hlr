execution
start

	"Okay move this to a work queue proof-of-concept single db lookup"
	[
		self doStart
	] on: Error do: [:err |
		err logException: 'Failed to start query' area: #hlr.
		database discardOldConnection.
		^systemFailure value: 'Query failure'.
	].